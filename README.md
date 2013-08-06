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

Wouldn't you rather write this:

    List<Account> filteredAccounts = Select.Field.hasChanged( Account.Name ).filter( Trigger.new );

installation
------------

Install the managed package:

 * Production: <https://login.salesforce.com/packaging/installPackage.apexp?p0=04ti0000000WDDY>
 * Sandbox: <https://test.salesforce.com/packaging/installPackage.apexp?p0=04ti0000000WDDY>

reference
---------

### Filter instance methods

Select.Filter# *filter*( newRecords )

    List<sObject> filteredRecords = nameChanged.filter( Trigger.new )

Select.Filter# *filter*( newRecords, oldRecords )

    List<sObject> filteredRecords = nameChanged.filter( Trigger.new, Trigger.oldMap )

Select.Filter# *andx*( Filter otherFilter )

    Select.Filter nameNulled = nameChanged.andx( nameNull )

Select.Filter# *orx*( Filter otherFilter )

    Select.Filter fooOrBar = nameEqualsFoo.orx( nameEqualsBar )

Select.Filter# *notx*()

    Select.Filter notFoo = isFoo.notx()

### built-in filters

Select.Field. *hasChanged*( field )

    Select.Filter nameChanged = Select.Field.hasChanged( Account.Name )

Select.Field. *isNew*( field )

    Select.Filter newPhone = Select.Field.isNew( Contact.Phone )

Select.Field. *isEqual*( field, value )

    Select.Filter nameIsFoobar = Select.Field.isEqual( Account.Name, 'Foobar' )

Select.Field. *notEqual*( field, value )

    Select.Filter nameIsntFoobar = Select.Field.notEqual( Account.Name, 'Foobar' )

Select.Field. *isIn*( field, collection )

    Select.Filter isMidwest = Select.Field.isIn( Account.BillingState, midwestStates )

Select.Field. *notIn*( field, collection )

    Select.Filter notMidwest = Select.Field.notIn( Account.BillingState, midwestStates )

Select.Field. *isNull*( field )

    Select.Filter blankPhone = Select.Field.isNull( Contact.Phone )

Select.Field. *notNull*( field )

    Select.Filter hasPhone = Select.Field.notNull( Contact.Phone )

Select.Field. *hasChildren*( field )

    Select.Filter hasChildren = Select.Field.hasChildren( 'Contacts' )

Select.Field. *hasNoChildren*( field )

    Select.Filter hasNoChildren = Select.Field.hasNoChildren( 'Contacts' )

### constructors

new Select. *Filter*( predicate )

     Select.Filter customFilter = new Select.Filter( customPredicate )

### Predicate interface

To write a custom filter predicate, implement the interface `Select.Predicate`, which
consists of an evaluate method for the insert case and one for the update case.

Boolean Select.Predicate# *evaluate*( sObject newRecord )

Boolean Select.Predicate# *evaluate*( sObject newRecord, oldRecord )

For examples of Predicate implementations, see the built-in predicates.

### InsertPredicate abstract class

If you don't need special-case logic for the update case, extend this class instead.
