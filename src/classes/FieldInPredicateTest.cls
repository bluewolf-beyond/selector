@isTest
private class FieldInPredicateTest
{
    private static testMethod void testInsert()
    {
        Predicate predicate = new FieldInPredicate( Lead.Company, new Set<Object>{ 'Foobar Industries' } );

        sObject sObjectWithValue = new Lead();
        sObjectWithValue.put( 'Company', 'Foobar Industries' );

        sObject sObjectWithOther = new Lead();
        sObjectWithOther.put( 'Company', 'Intractable Industries' );

        Test.startTest();

            Boolean fieldWithValueIn = predicate.evaluate( sObjectWithValue );
            Boolean fieldWithOtherIn = predicate.evaluate( sObjectWithOther );

        Test.stopTest();

        System.assert( predicate instanceof InsertPredicate,
            'No update test needed' );

        System.assertEquals( true, fieldWithValueIn,
            'A Field with a matching value on insert is considered equal' );
        System.assertEquals( false, fieldWithOtherIn,
            'A Field with a differing value on insert isn\'t considered equal' );
    }
}
