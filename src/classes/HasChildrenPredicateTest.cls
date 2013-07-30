@isTest
private class HasChildrenPredicateTest
{
    private static testMethod void testHasNoChildren_noChildren()
    {
        Account act = new Account();

        Test.startTest();
            List<sObject> accountsWithNoChildren = Field.hasChildren( 'Contacts' ).filter( new List<Account>{ act } );
        Test.stopTest();

        System.assertEquals( 0, accountsWithNoChildren.size(), 'This account has a no children, so it should have been filtered out');
    }
}
