@isTest
private class FieldEqualsPredicateTest
{
    private static testMethod void testInsert()
    {
        Predicate predicate = new FieldEqualsPredicate( Lead.Company, 'Foobar Industries' );

        sObject sObjectWithValue = new Lead();
        sObjectWithValue.put( 'Company', 'Foobar Industries' );

        sObject sObjectWithOther = new Lead();
        sObjectWithOther.put( 'Company', 'Intractable Industries' );

        Test.startTest();

            Boolean fieldWithValueEquals = predicate.evaluate( sObjectWithValue );
            Boolean fieldWithOtherEquals = predicate.evaluate( sObjectWithOther );

        Test.stopTest();

        System.assert( predicate instanceof InsertPredicate,
            'No update test needed' );

        System.assertEquals( true, fieldWithValueEquals,
            'A Field with a matching value on insert is considered equal' );
        System.assertEquals( false, fieldWithOtherEquals,
            'A Field with a differing value on insert isn\'t considered equal' );
    }
}
