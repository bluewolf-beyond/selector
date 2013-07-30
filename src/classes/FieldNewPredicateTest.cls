@isTest
private class FieldNewPredicateTest
{
    private static testMethod void testInsert()
    {
        Predicate predicate = new FieldNewPredicate( Lead.Company );

        sObject sObjectWithValue = new Lead();
        sObjectWithValue.put( 'Company', 'Foobar Industries' );

        sObject sObjectWithoutValue = new Lead();

        Test.startTest();

            Boolean fieldWithValueNew = predicate.evaluate( sObjectWithValue );
            Boolean fieldWithoutValueNew = predicate.evaluate( sObjectWithoutValue );

        Test.stopTest();

        System.assertEquals( true, fieldWithValueNew,
            'A Field with a value on insert is considered new' );
        System.assertEquals( false, fieldWithoutValueNew,
            'A Field without a value on insert isn\'t considered new' );
    }

    private static testMethod void testUpdate()
    {
        Predicate predicate = new FieldNewPredicate( Lead.Company );

        sObject sObjectNew = new Lead();
        sObjectNew.put( 'Company', 'Foobar Industries' );

        sObject sObjectWithValue = new Lead();
        sObjectWithValue.put( 'Company', 'Intractable Industries' );

        sObject sObjectWithoutValue = new Lead();
        sObjectWithoutValue.put( 'Company', null );

        Test.startTest();

            Boolean fieldWithValueNew = predicate.evaluate( sObjectNew, sObjectWithValue );
            Boolean fieldWithoutValueNew = predicate.evaluate( sObjectNew, sObjectWithoutValue );

        Test.stopTest();

        System.assertEquals( false, fieldWithValueNew,
            'A Field with a value on update isn\'t considered new' );
        System.assertEquals( true, fieldWithoutValueNew,
            'A Field without a value on update is considered new' );
    }
}
