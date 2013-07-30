@isTest
private class FieldNullPredicateTest
{
    private static testMethod void testInsert()
    {
        Predicate predicate = new FieldNullPredicate( Lead.Company );

        sObject sObjectWithValue = new Lead();
        sObjectWithValue.put( 'Company', 'Foobar Industries' );

        sObject sObjectWithoutValue = new Lead();

        Test.startTest();

            Boolean fieldWithValueNull = predicate.evaluate( sObjectWithValue );
            Boolean fieldWithoutValueNull = predicate.evaluate( sObjectWithoutValue );

        Test.stopTest();

        System.assert( predicate instanceof InsertPredicate,
            'No update test needed' );

        System.assertEquals( false, fieldWithValueNull,
            'A Field with a value on insert is not null' );
        System.assertEquals( true, fieldWithoutValueNull,
            'A Field without a value on insert is null' );
    }
}
