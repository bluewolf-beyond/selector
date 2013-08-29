selector
========

Filter sObjects based on various criteria.

 * introduction
 * installation
 * reference

introduction
------------

You know why this exists.  Every time you write a new trigger
you end up reimplementing the same filters over and over again.

    List<Account> filteredAccounts = new List<Account>();

    for ( Account newAccount : Trigger.new )
    {
        Account oldAccount = Trigger.oldMap.get( newAccount.Id );

        if ( newAccount.Name != oldAccount.Name )
        {
            filteredAccounts.add( newAccount );
        }
    }

    return filteredAccounts;

Wouldn't you rather write this:

    return (List<Account>)Select.Field.hasChanged( Account.Name )
                                      .filter( Trigger.new, Trigger.oldMap );

For fields directly on the objects being filtered, use the
`Schema.sObjectField` to reference for the safest code.  It
is also possible to pass in `String` field references, which
can traverse parent relationships.  For instance, in a
Contact trigger:

    return (List<Contact>)Select.Field.isEqual( 'Account.Region', 'Midwest' )
                                      .filter( Trigger.new );

If the filter you need is simply a logical combination of
built-ins or existing custom filters, you can use the
filter composition methods to build it up.

    // !((filterA && filterB) || filterC)
    Select.Filter myComplexFilter = filterA.andx( filterB )
                                           .orx( filterC )
                                           .notx();

If the built-in filters are not sufficient, it is simple
enough to extend them with your own.  Implement the
`Predicate` interface, which evaluates an sObject to
determine whether to include it in the results.

    // custom filter predicate
    class GrowingAccountPredicate implements Select.Predicate
    {
        Boolean evaluate( sObject newRecord )
        {
            return newRecord.get( 'Annual_Sales__c' ) > 50000;
        }

        Boolean evaluate( sObject newRecord, sObject oldRecord )
        {
            return newRecord.get( 'Annual_Sales__c' ) > oldRecord.get( 'Annual_Sales__c' );
        }
    }

    // factory method for the custom filter
    Select.Filter isGrowingAccount()
    {
        return new Select.Filter( new GrowingAccountPredicate() );
    }

    // usage of the custom filter
    List<Accounts> filterGrowingAccounts()
    {
        return (List<Account>)MyFilter.isGrowingAccount()
                                      .filter( Trigger.new );
    }

This may seem like a lot of work, but consider this: as long
as you unit test your custom predicate you can dispense with
significant testing of your filter methods.  And since
testing predicates is much simpler than testing filters
(because of their singular nature) this is quite easy.

Another point on ***testing***.  Since this library is
(presumably) well-tested, there is no need for your tests to
deal with mixed filter cases at all.  To make life easier
for yourself, use dependency injection to have your tests
to use a simpler filter, and test the positive and negative
cases independently.  For instance,

    // somewhere in a service class

    // ...
    @TestVisible static Select.Filter accountChanged = Select.Field.hasChanged( Contact.AccountId );

    public List<Contact> filterAccountChanged( List<Contact> newRecords, Map<Id, Contact> oldRecords )
    {
        return accountChanged.filter( newRecords, oldRecords );
    }
    // ...

    // in the corresponding test class

    // ...
    private static testMethod void testSomeHighLevelThing()
    {
        // when setting up test data, don't bother
        // meeting filter criteria
        // ...

        // inject a filter that passes ALL records
        ContactServices.accountChanged = Select.Record.all();

        Test.startTest();

            ContactServices.doSomeHighLevelThing( contacts );

        Test.stopTest();

        // Don't bother checking that the FILTERED records are EXCLUDED
        // ...
    }

    private static testMethod void testSomeHighLevelThing_Negative()
    {
        // when setting up test data, don't bother
        // meeting filter criteria
        // ...

        // inject a filter that passes NONE of the records
        ContactServices.accountChanged = Select.Record.none();

        Test.startTest();

            ContactServices.doSomeHighLevelThing( contacts );

        Test.stopTest();

        // Don't bother checking that the UNFILTERED records are INCLUDED
        // ...
    }
    // ...

For more information consult the API reference below.

installation
------------

Install the managed package:

 * Production: <https://login.salesforce.com/packaging/installPackage.apexp?p0=04ti0000000WDDY>
 * Sandbox: <https://test.salesforce.com/packaging/installPackage.apexp?p0=04ti0000000WDDY>

reference
---------

### Filter instance methods

 * Select.Filter# ***filter***( List&lt;sObject&gt; newRecords )
   * List&lt;sObject&gt;

Execute the filter on the list of records, returning the
list of sObjects matching the filter's predicate.

    List<sObject> filteredRecords = nameChanged.filter( Trigger.new )

 * Select.Filter# ***filter***( List&lt;sObject&gt; newRecords, Map&lt;Id, sObject&gt; oldRecords )
   * List&lt;sObject&gt;

Execute the filter on the list of records and the map of
associated old records, returning the list of sObjects
matching the filter's predicate.

    List<sObject> filteredRecords = nameChanged.filter( Trigger.new, Trigger.oldMap )

 * Select.Filter# ***andx***( Select.Filter otherFilter )
   * Select.Filter

Returns a filter that is the conjunction of this filter and
the other filter.  The returned filter only allows through
sObjects matching _both_ source filters.

    Select.Filter nameNulled = nameChanged.andx( nameNull )

 * Select.Filter# ***orx***( Select.Filter otherFilter )
   * Select.Filter

Returns a filter that is the disjunction of this filter and
the other filter.  The returned filter allows through all
sObjects matching _either_ source filter.

    Select.Filter fooOrBar = nameEqualsFoo.orx( nameEqualsBar )

 * Select.Filter# ***notx***()
   * Select.Filter

Returns a filter that is the logical inverse of this filter.
The returned filter allows through only sObjects _not_
matching the source filter.

    Select.Filter notFoo = isFoo.notx()

### built-in filters

All field parameters for the built-in filters can be
specified as a `String` or as a `Schema.sObjectField`.
For more information see the `FieldReference`
documentation below.

 * Select.Field. ***hasChanged***( field )
   * Select.Filter

Filter for sObjects that have an updated value in the given
field, or in the insert case, have any non-null value.

    Select.Filter nameChanged = Select.Field.hasChanged( Account.Name )

 * Select.Field. ***isNew***( field )
   * Select.Filter

Filter for sObjects that have a non-null value in the given
field where previously the field was null, or in the
insert case have any non-null value.

    Select.Filter newPhone = Select.Field.isNew( Contact.Phone )

 * Select.Field. ***isEqual***( field, value )
   * Select.Filter

Filter for sObjects that have the specified value in the
given field.

    Select.Filter nameIsFoobar = Select.Field.isEqual( Account.Name, 'Foobar' )

 * Select.Field. ***notEqual***( field, value )
   * Select.Filter

Filter for sObjects that do not have the specified value in
the given field.

    Select.Filter nameIsntFoobar = Select.Field.notEqual( Account.Name, 'Foobar' )

 * Select.Field. ***isIn***( field, collection )
   * Select.Filter

Filter for sObjects with a field value contained in the set
of specified values.

    Select.Filter isMidwest = Select.Field.isIn( Account.BillingState, midwestStates )

 * Select.Field. ***notIn***( field, collection )
   * Select.Filter

Filter for sObjects with a field value not contained in the
set of specified values.

    Select.Filter notMidwest = Select.Field.notIn( Account.BillingState, midwestStates )

 * Select.Field. ***isNull***( field )
   * Select.Filter

Filter for sObjects with null in the given field.

    Select.Filter blankPhone = Select.Field.isNull( Contact.Phone )

 * Select.Field. ***notNull***( field )
   * Select.Filter

Filter for sObjects with a non-null value in the given field.

    Select.Filter hasPhone = Select.Field.notNull( Contact.Phone )

 * Select.Field. ***hasChildren***( String childRelationship )
   * Select.Filter

Filter for sObjects with child records for the given
child relationship.

    Select.Filter hasChildren = Select.Field.hasChildren( 'Contacts' )

 * Select.Field. ***hasNoChildren***( String childRelationship )
   * Select.Filter

Filter for sObjects without child records for the given
child relationship.

    Select.Filter hasNoChildren = Select.Field.hasNoChildren( 'Contacts' )

### constructors

 * new Select. ***Filter***( Select.Predicate predicate )

Create a new filter with the given predicate.

     Select.Filter customFilter = new Select.Filter( customPredicate )

### Predicate interface

To write a custom filter predicate, implement the interface `Select.Predicate`, which
consists of an evaluate method for the insert case and one for the update case.

 * Select.Predicate# ***evaluate***( sObject newRecord )
   * Boolean

Should return whether or not to include the given record in the
filtered results.  Represents the insert case of a trigger.

 * Select.Predicate# ***evaluate***( sObject newRecord, sObject oldRecord )
   * Boolean

Should return whether or not to include the given record in the
filtered results.  Represents the update case of a trigger.

For examples of Predicate implementations, see the built-in
predicates.

### InsertPredicate abstract class

If you don't need special-case logic for the update case,
extend this class instead.  That way you only need to
implement the first signature of the `evaluate` method
which takes only a single sObject instance.

### FieldReference abstract class

Represents an abstract reference to an sObject field.  It
uses inversion of control to allow the library to get the
value of an sObject field without knowing whether the
reference is a String or a Schema.sObject field.

 * Select.FieldReference# ***getFrom***( sObject record )
   * Object

Returns the value of the referenced field on the given
sObject.

    Id accountId = (Id)idReference.getFrom( theAccount )

### FieldReference factory methods

 * Select.FieldReference. ***build***( Schema.sObjectField field )
   * Select.FieldReference

Returns a FieldReference encapsulating the given field.

    Select.FieldReference idRef = Select.FieldReference.build( Account.Id )

 * Select.FieldReference. ***build***( String field )
   * Select.FieldReference

Returns a FieldReference encapsulating the field represented
by the given string. If there is no '`.`' character, the
reference behaves as it would with the equivalent Schema
reference (and it would be safer to use that).  If the given
string contains a period, the reference will traverse
sObject relationships as expected.

    Select.FieldReference parentAccountIdRef = Select.FieldReference.build( 'Account.Id' );

The difference between `idRef` and `parentAccountIdRef` is
that the former would be used directly on the Account
object, whereas the latter could be used on any child object
with a lookup named 'Account'.
