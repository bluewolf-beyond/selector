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
                                      .filter( Trigger.new );

For fields directly on the objects being filtered, use the
`Schema.sObjectField` to reference for the safest code.  It
is also possible to pass in `String` field references, which
can traverse parent relationships.  For instance, in a
Contact trigger:

    return (List<Contact>)Select.Field.isEqual( 'Account.Region', 'Midwest' )
                                      .filter( Trigger.new );

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

If the filter you need is simply a logical combination of
built-ins or existing custom filters, you can use the
filter composition methods to build it up.

    // !( (filterA && filterB) || filterC )
    Select.Filter myComplexFilter = filterA.andx( filterB )
                                           .orx( filterC )
                                           .notx();

For more information consult the API reference below.

installation
------------

Install the managed package:

 * Production: <https://login.salesforce.com/packaging/installPackage.apexp?p0=04ti0000000WDDY>
 * Sandbox: <https://test.salesforce.com/packaging/installPackage.apexp?p0=04ti0000000WDDY>

reference
---------

### Filter instance methods

 * Select.Filter# ***filter***( newRecords )

Execute the filter on the list of records, returning the
list of sObjects matching the filter's predicate.

    List<sObject> filteredRecords = nameChanged.filter( Trigger.new )

 * Select.Filter# ***filter***( newRecords, oldRecords )

Execute the filter on the list of records and the map of
associated old records, returning the list of sObjects
matching the filter's predicate.

    List<sObject> filteredRecords = nameChanged.filter( Trigger.new, Trigger.oldMap )

 * Select.Filter# ***andx***( Filter otherFilter )

Returns a filter that is the conjunction of this filter and
the other filter.  The returned filter only allows through
sObjects matching _both_ source filters.

    Select.Filter nameNulled = nameChanged.andx( nameNull )

 * Select.Filter# ***orx***( Filter otherFilter )

Returns a filter that is the disjunction of this filter and
the other filter.  The returned filter allows through all
sObjects matching _either_ source filter.

    Select.Filter fooOrBar = nameEqualsFoo.orx( nameEqualsBar )

 * Select.Filter# ***notx***()

Returns a filter that is the logical inverse of this filter.
The returned filter allows through only sObjects _not_
matching the source filter.

    Select.Filter notFoo = isFoo.notx()

### built-in filters

 * Select.Field. ***hasChanged***( field )

    Select.Filter nameChanged = Select.Field.hasChanged( Account.Name )

 * Select.Field. ***isNew***( field )

    Select.Filter newPhone = Select.Field.isNew( Contact.Phone )

 * Select.Field. ***isEqual***( field, value )

    Select.Filter nameIsFoobar = Select.Field.isEqual( Account.Name, 'Foobar' )

 * Select.Field. ***notEqual***( field, value )

    Select.Filter nameIsntFoobar = Select.Field.notEqual( Account.Name, 'Foobar' )

 * Select.Field. ***isIn***( field, collection )

    Select.Filter isMidwest = Select.Field.isIn( Account.BillingState, midwestStates )

 * Select.Field. ***notIn***( field, collection )

    Select.Filter notMidwest = Select.Field.notIn( Account.BillingState, midwestStates )

 * Select.Field. ***isNull***( field )

    Select.Filter blankPhone = Select.Field.isNull( Contact.Phone )

 * Select.Field. ***notNull***( field )

    Select.Filter hasPhone = Select.Field.notNull( Contact.Phone )

 * Select.Field. ***hasChildren***( field )

    Select.Filter hasChildren = Select.Field.hasChildren( 'Contacts' )

 * Select.Field. ***hasNoChildren***( field )

    Select.Filter hasNoChildren = Select.Field.hasNoChildren( 'Contacts' )

### constructors

 * new Select. ***Filter***( predicate )

     Select.Filter customFilter = new Select.Filter( customPredicate )

### Predicate interface

To write a custom filter predicate, implement the interface `Select.Predicate`, which
consists of an evaluate method for the insert case and one for the update case.

 * Boolean Select.Predicate# ***evaluate***( sObject newRecord )

 * Boolean Select.Predicate# ***evaluate***( sObject newRecord, oldRecord )

For examples of Predicate implementations, see the built-in predicates.

### InsertPredicate abstract class

If you don't need special-case logic for the update case, extend this class instead.
