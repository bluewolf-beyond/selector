@isTest
private class FieldGreaterThanPredicateTest
{
    private static testMethod void testInsert()
    {
        final Decimal AMOUNT = 563454.22;
        Predicate predicate = new FieldGreaterThanPredicate( Opportunity.Amount, AMOUNT );

        sObject sObjectGreater = new Opportunity();
        sObjectGreater.put( 'Amount', AMOUNT + 1);

        sObject sObjectLess = new Opportunity();
        sObjectLess.put( 'Amount', AMOUNT );

        Test.startTest();

            Boolean fieldGreaterIsGreater = predicate.evaluate( sObjectGreater );
            Boolean fieldLessIsGreater = predicate.evaluate( sObjectLess );

        Test.stopTest();

        System.assert( predicate instanceof InsertPredicate,
            'No update test needed' );

        System.assertEquals( true, fieldGreaterIsGreater,
            'A Field with a matching value on insert is considered equal' );
        System.assertEquals( false, fieldLessIsGreater,
            'A Field with a differing value on insert isn\'t considered equal' );
    }
}