global class AndPredicate implements Predicate
{
    @TestVisible List<Predicate> predicates;

    global AndPredicate( Predicate left, Predicate right )
    {
        predicates = new List<Predicate>();

        if ( left instanceof AndPredicate )
        {
            predicates.addAll( ((AndPredicate)left).predicates );
        }
        else
        {
            predicates.add( left );
        }

        if ( right instanceof AndPredicate )
        {
            predicates.addAll( ((AndPredicate)right).predicates );
        }
        else
        {
            predicates.add( right );
        }
    }

    global AndPredicate( List<Predicate> predicates )
    {
        this.predicates = new List<Predicate>();
        this.predicates.addAll( predicates );
    }

    global Boolean evaluate( sObject newRecord )
    {
        for ( Predicate predicate : predicates )
        {
            if ( !predicate.evaluate( newRecord ) )
            {
                return false;
            }
        }

        return true;
    }

    global Boolean evaluate( sObject newRecord, sObject oldRecord )
    {
        for ( Predicate predicate : predicates )
        {
            if ( !predicate.evaluate( newRecord, oldRecord ) )
            {
                return false;
            }
        }

        return true;
    }
}
