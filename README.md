filter
======

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

    List<Account> filteredAccounts = Filter.fieldChanged( Account.Name ).filter( Trigger.new );

installation
------------

Use the Solution Repository:
<http://bw-solution-repository.herokuapp.com/>

reference
---------

### instance methods

Filter#*filter*( newRecords )

    List<sObject> filteredRecords = nameChanged.filter( Trigger.new )

Filter#*filter*( newRecords, oldRecords )

    List<sObject> filteredRecords = nameChanged.filter( Trigger.new, Trigger.oldMap )

Filter#*andx*( Filter otherFilter )

    Filter nameNulled = nameChanged.andx( nameNull )

Filter#*orx*( Filter otherFilter )

    Filter fooOrBar = nameEqualsFoo.orx( nameEqualsBar )

### built-in filters

Filter.*fieldChanged*( field )

    Filter nameChanged = Filter.fieldChanged( Account.Name )

Filter.*fieldEquals*( field, value )

    Filter nameIsFoobar = Filter.fieldEquals( Account.Name, 'Foobar' )

Filter.*fieldNotEquals*( field, value )

    Filter nameIsntFoobar = Filter.fieldEquals( Account.Name, 'Foobar' )

Filter.*fieldNull*( field )

    Filter blankPhone = Filter.fieldNull( Contact.Phone )

Filter.*fieldNotNull*( field )

    Filter hasPhone = Filter.fieldNotNull( Contact.Phone )

### constructors

new Filter( predicate )

     Filter customFilter = new Filter( customPredicate )

### Predicate interface

To write a custom filter predicate, implement the interface `Filter.Predicate`, which
consists of an evaluate method for the insert case and one for the update case.

    Boolean Predicate#*evaluate*( sObject newRecord )
    Boolean Predicate#*evaluate*( sObject newRecord, oldRecord )

### InsertPredicate abstract class

If you don't need special-case logic for the update case, extend this class instead.
