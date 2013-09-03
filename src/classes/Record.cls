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
        return Field.isEqual( 'Id', searchId );
    }

    global static Filter notId( Id searchId )
    {
        return byId( searchId ).notx();
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
