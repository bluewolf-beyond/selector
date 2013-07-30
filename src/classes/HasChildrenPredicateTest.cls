@isTest
private class HasChildrenPredicateTest
{
    private static testMethod void testInsert()
    {
        Account act = new Account();

        Predicate hasContacts = new HasChildrenPredicate( 'Contacts' );

        Test.startTest();

            Boolean accountWithNoChildrenHasContacts = hasContacts.evaluate( act );

        Test.stopTest();

        System.assertEquals( false, accountWithNoChildrenHasContacts,
            'sObjects with no children should be recognized as such' );
    }
}
