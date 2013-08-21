global class Record
{
    global static Filter isNew()
    {
        return new Filter( new IsNewPredicate() );
    }

    global static Filter notNew()
    {
        return new Filter( new IsNewPredicate() ).notx();
    }

    global static Filter byId( Id searchId )
    {
        return new FilterIdMap( searchId );
    }

    global static Filter byName( String searchName )
    {
        return Field.isEqual( 'Name', searchName );
    }

    global static Filter isOrphan( String lookupField )
    {
        return Field.isNull( lookupField );
    }

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
