global class Records
{
    global static Filter all()
    {
        return new Filter( new ConstantPredicate( true ) );
    }

    global static Filter none()
    {
        return new Filter( new ConstantPredicate( false ) );
    }

    global static Filter both( Filter one, Filter other )
    {
        return one.andx( other );
    }

    global static Filter all( List<Filter> many )
    {
        if ( many.isEmpty() )
        {
            return all();
        }

        Filter conjunction = many.remove(0);

        for ( Filter filter : many )
        {
            conjunction = conjunction.andx( filter );
        }

        return conjunction;
    }

    global static Filter either( Filter one, Filter other )
    {
        return one.orx( other );
    }

    global static Filter any( List<Filter> many )
    {
        if ( many.isEmpty() )
        {
            return none();
        }

        Filter disjunction = many.remove(0);

        for ( Filter filter : many )
        {
            disjunction = disjunction.orx( filter );
        }

        return disjunction;
    }
}
