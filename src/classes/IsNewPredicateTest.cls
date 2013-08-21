@isTest
private class IsNewPredicateTest
{
    private static testMethod void testInsert()
    {
        Predicate predicate = new IsNewPredicate();

        sObject record = new Lead();

        Test.startTest();

            Boolean isNewOnInsert = predicate.evaluate( record );

        Test.stopTest();

        System.assert( isNewOnInsert, 'The record is new on insert' );
    }

    private static testMethod void testUpdate()
    {
        Predicate predicate = new IsNewPredicate();

        sObject record = new Lead();

        Test.startTest();

            Boolean isNewOnUpdate = predicate.evaluate( record, record );

        Test.stopTest();

        System.assertEquals( false, isNewOnUpdate, 'The record is not new on insert' );
    }
}
