global abstract class InsertPredicate implements Predicate
{
    global Boolean evaluate( sObject newRecord, sObject oldRecord )
    {
        return ((Predicate)this).evaluate( newRecord );
    }
}
