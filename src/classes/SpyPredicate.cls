global class SpyPredicate extends InsertPredicate
{
    @TestVisible Boolean wasCalled = false;

    global Boolean evaluate( sObject newRecord )
    {
        wasCalled = true;
        return false;
    }
}
