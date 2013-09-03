@isTest
private class FieldContainsPredicateTest
{
    static testMethod void testInsert()
    {
        final String TASK_FIELD_SUBJECT = 'Subject';

        sObject withWine = new Task();
        withWine.put( TASK_FIELD_SUBJECT, 'Wine' );

        sObject withBrandy = new Task();
        withBrandy.put( TASK_FIELD_SUBJECT, 'Brandy' );

        sObject withNull = new Task();
        withNull.put( TASK_FIELD_SUBJECT, null );

        Predicate predicate = new FieldContainsPredicate( TASK_FIELD_SUBJECT, 'in' );

        Test.startTest();

            Boolean fieldWithWine = predicate.evaluate( withWine );
            Boolean fieldWithBrandy = predicate.evaluate( withBrandy );
            Boolean fieldWithNull = predicate.evaluate( withNull );

        Test.stopTest();

        System.assert( predicate instanceof InsertPredicate,
            'No update test needed' );

        System.assertEquals( true, fieldWithWine,
            'A field value containing the search term should be recognized as such' );
        System.assertEquals( false, fieldWithBrandy,
            'A field value not containing the search term should be recognized as such' );
        System.assertEquals( false, fieldWithNull,
            'A field with no value should not contain the search term' );
    }
}
