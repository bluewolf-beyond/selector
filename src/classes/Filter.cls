global class Filter
{
    /////////////////////////////////////////////////////////////////
    // standard filter types
    /////////////////////////////////////////////////////////////////

    global static Filter hasChildren( String field )
    {
        return new Filter( new HasChildrenPredicate( field ) );
    }

    global static Filter hasNoChildren( String field )
    {
        return hasChildren( field ).notx();
    }

    /////////////////////////////////////////////////////////////////
    // Filter instance methods
    /////////////////////////////////////////////////////////////////

    global List<sObject> filter( List<sObject> newRecords )
    {
        List<sObject> filteredRecords = new List<sObject>();

        for ( sObject record : newRecords )
        {
            if ( predicate.evaluate( record ) )
            {
                filteredRecords.add( record );
            }
        }

        return filteredRecords;
    }

    global List<sObject> filter( List<sObject> newRecords, Map<Id, sObject> oldRecords )
    {
        List<sObject> filteredRecords = new List<sObject>();

        for ( sObject record : newRecords )
        {
            sObject oldRecord = oldRecords.get( record.Id );

            if ( predicate.evaluate( record, oldRecord ) )
            {
                filteredRecords.add( record );
            }
        }

        return filteredRecords;
    }

    global Filter andx( Filter other )
    {
        return new Filter( new AndPredicate( this.predicate, other.predicate ) );
    }

    global Filter orx( Filter other )
    {
        return new Filter( new OrPredicate( this.predicate, other.predicate ) );
    }

    global Filter notx()
    {
        return new Filter( new NotPredicate( this.predicate ) );
    }

    /////////////////////////////////////////////////////////////////
    // Filter class glue
    /////////////////////////////////////////////////////////////////

    global Filter( Predicate predicate )
    {
        this.predicate = predicate;
    }

    @TestVisible Predicate predicate;
}
