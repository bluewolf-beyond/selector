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
        return Filter.andx( many );
    }

    global static Filter either( Filter one, Filter other )
    {
        return one.orx( other );
    }

    global static Filter any( List<Filter> many )
    {
        return Filter.orx( many );
    }
}
