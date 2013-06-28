@isTest
private class FilterTest
{
    private static testMethod void testPredicate_FieldChanged_Insert()
    {
        Filter.Predicate predicate = new Filter.FieldChangedPredicate( Lead.Company );

        sObject sObjectWithValue = new Lead();
        sObjectWithValue.put( 'Company', 'Foobar Industries' );

        sObject sObjectWithoutValue = new Lead();

        Test.startTest();

            Boolean fieldWithValueChanged = predicate.evaluate( sObjectWithValue );
            Boolean fieldWithoutValueChanged = predicate.evaluate( sObjectWithoutValue );

        Test.stopTest();

        System.assertEquals( true, fieldWithValueChanged,
            'A Field with a value on insert is considered changed' );
        System.assertEquals( false, fieldWithoutValueChanged,
            'A Field without a value on insert isn\'t considered changed' );
    }

    private static testMethod void testPredicate_FieldChanged_Update()
    {
        Filter.Predicate predicate = new Filter.FieldChangedPredicate( Lead.Company );

        sObject sObjectOriginal = new Lead();
        sObjectOriginal.put( 'Company', 'Foobar Industries' );

        sObject sObjectWithOldValue = new Lead();
        sObjectWithOldValue.put( 'Company', 'Foobar Industries' );

        sObject sObjectWithNewValue = new Lead();
        sObjectWithNewValue.put( 'Company', 'Intractable Industries' );

        Test.startTest();

            Boolean fieldWithOldValueChanged = predicate.evaluate( sObjectWithOldValue, sObjectOriginal );
            Boolean fieldWithNewValueChanged = predicate.evaluate( sObjectWithNewValue, sObjectOriginal );

        Test.stopTest();

        System.assertEquals( false, fieldWithOldValueChanged,
            'A Field with the original value on update isn\'t considered changed' );
        System.assertEquals( true, fieldWithNewValueChanged,
            'A Field with a new value on update isn\'t considered changed' );
    }
}
