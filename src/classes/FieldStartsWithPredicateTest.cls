@isTest
private class FieldStartsWithPredicateTest {
    static testMethod void testInsert()
    {
        final String TASK_FIELD_SUBJECT = 'Subject';

        sObject withWine = new Task();
        withWine.put ( TASK_FIELD_SUBJECT, 'Wine' );

        sObject withBrandy = new Task();
        withBrandy.put ( TASK_FIELD_SUBJECT, 'Brandy' );

        sObject withNull = new Task();
        withNull.put ( TASK_FIELD_SUBJECT, null );

        Predicate predicate = new FieldStartsWithPredicate( TASK_FIELD_SUBJECT, 'Win' );

        Test.startTest();
            Boolean fieldWithWine = predicate.evaluate(withWine);
            Boolean fieldWithBrandy = predicate.evaluate(withBrandy);
            Boolean fieldWithNull = predicate.evaluate(withNull);
        Test.stopTest();

        System.assert(predicate instanceof InsertPredicate, 'No update test needed');

        System.assert(fieldWithWine, 'A field value beginning with the prefix should be recognized as such');
        System.assert(!fieldWithBrandy, 'A field value beginning with something other than prefix should be recognized as such');
        System.assert(!fieldWithNull, 'A field with no value should not begin with the prefix');
    }
}