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
}
