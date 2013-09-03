@isTest
private class FieldEndsWithPredicateTest
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

        Predicate predicate = new FieldEndsWithPredicate( TASK_FIELD_SUBJECT, 'ine' );

        Test.startTest();

            Boolean fieldWithWine = predicate.evaluate( withWine );
            Boolean fieldWithBrandy = predicate.evaluate( withBrandy );
            Boolean fieldWithNull = predicate.evaluate( withNull );

        Test.stopTest();

        System.assert( predicate instanceof InsertPredicate,
            'No update test needed' );

        System.assertEquals( true, fieldWithWine,
            'A field value ending with the suffix should be recognized as such' );
        System.assertEquals( false, fieldWithBrandy,
            'A field value ending with something other than suffix should be recognized as such' );
        System.assertEquals( false, fieldWithNull,
            'A field with no value should not end with the suffix' );
    }
}
