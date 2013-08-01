/*
 * Filter class
 *
 * The main filtering operation.
 * Delegates inclusion checking to the Predicate.
 *
 * Create custom filters by implementing a Predicate.
 */
global class Filter
{
    /////////////////////////////////////////////////////////////////
    // filtering methods
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
        if ( null == oldRecords )
        {
            return filter( newRecords );
        }

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

    /////////////////////////////////////////////////////////////////
    // composition methods
    /////////////////////////////////////////////////////////////////

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
