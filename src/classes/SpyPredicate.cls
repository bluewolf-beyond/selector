global class SpyPredicate extends InsertPredicate
{
    @TestVisible Boolean wasCalled = false;
    @TestVisible Boolean insertCalled = false;
    @TestVisible Boolean updateCalled = false;

    global Boolean evaluate( sObject newRecord )
    {
        wasCalled = true;
        insertCalled = true;
        return false;
    }

    global override Boolean evaluate( sObject newRecord, sObject oldRecord )
    {
        wasCalled = true;
        updateCalled = true;
        return false;
    }
}
