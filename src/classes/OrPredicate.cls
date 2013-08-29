global class OrPredicate implements Predicate
{
    @TestVisible List<Predicate> predicates;

    global OrPredicate( Predicate left, Predicate right )
    {
        predicates = new List<Predicate>();

        if ( left instanceof OrPredicate )
        {
            predicates.addAll( ((OrPredicate)left).predicates );
        }
        else
        {
            predicates.add( left );
        }

        if ( right instanceof OrPredicate )
        {
            predicates.addAll( ((OrPredicate)right).predicates );
        }
        else
        {
            predicates.add( right );
        }
    }

    global OrPredicate( List<Predicate> predicates )
    {
        this.predicates = new List<Predicate>();
        this.predicates.addAll( predicates );
    }

    global Boolean evaluate( sObject newRecord )
    {
        for ( Predicate predicate : predicates )
        {
            if ( predicate.evaluate( newRecord ) )
            {
                return true;
            }
        }

        return false;
    }

    global Boolean evaluate( sObject newRecord, sObject oldRecord )
    {
        for ( Predicate predicate : predicates )
        {
            if ( predicate.evaluate( newRecord, oldRecord ) )
            {
                return true;
            }
        }

        return false;
    }
}
