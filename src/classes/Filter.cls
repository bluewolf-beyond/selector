/*
 * Filter class
 *
 * The main filtering operation.
 * Delegates inclusion checking to the Predicate.
 *
 * Create custom filters by implementing a Predicate.
 */
global virtual class Filter
{
    /////////////////////////////////////////////////////////////////
    // filtering methods
    /////////////////////////////////////////////////////////////////

    global virtual List<sObject> filter( List<sObject> newRecords )
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

    global virtual List<sObject> filter( List<sObject> newRecords, Map<Id, sObject> oldRecords )
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

    global static Filter andx( List<Filter> many )
    {
        if ( many.isEmpty() )
        {
            return Records.all();
        }

        List<Predicate> predicates = new List<Predicate>();

        for ( Filter filter : many )
        {
            predicates.add( filter.predicate );
        }

        return new Filter( new AndPredicate( predicates ) );
    }

    global static Filter orx( List<Filter> many )
    {
        if ( many.isEmpty() )
        {
            return Records.none();
        }

        List<Predicate> predicates = new List<Predicate>();

        for ( Filter filter : many )
        {
            predicates.add( filter.predicate );
        }

        return new Filter( new OrPredicate( predicates ) );
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
