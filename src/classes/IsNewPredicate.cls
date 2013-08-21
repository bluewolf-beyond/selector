global class IsNewPredicate implements Predicate
{
    global Boolean evaluate( sObject record )
    {
        return true;
    }

    global Boolean evaluate( sObject record, sObject oldRecord )
    {
        return false;
    }
}
