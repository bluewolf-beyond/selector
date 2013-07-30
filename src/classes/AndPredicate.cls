global class AndPredicate implements Predicate
{
    @TestVisible List<Predicate> predicates;

    global AndPredicate( Predicate left, Predicate right )
    {
        predicates = new List<Predicate>();
        predicates.add( left );
        predicates.add( right );
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
