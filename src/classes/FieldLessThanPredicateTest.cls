@isTest
private class FieldLessThanPredicateTest
{
    private static testMethod void testInsert()
    {
        final Decimal AMOUNT = 563454.22;
        Predicate predicate = new FieldLessThanPredicate( Opportunity.Amount, AMOUNT );

        sObject sObjectGreater = new Opportunity();
        sObjectGreater.put( 'Amount', AMOUNT + 1);

        sObject sObjectLess = new Opportunity();
        sObjectLess.put( 'Amount', AMOUNT );

        Test.startTest();

            Boolean fieldGreaterIsLess = predicate.evaluate( sObjectGreater );
            Boolean fieldLessIsLess = predicate.evaluate( sObjectLess );

        Test.stopTest();

        System.assert( predicate instanceof InsertPredicate,
            'No update test needed' );

        System.assertEquals( false, fieldGreaterIsLess,
            'A Field with a matching value on insert is considered equal' );
        System.assertEquals( false, fieldLessIsLess,
            'A Field with a differing value on insert isn\'t considered equal' );
    }
}