@isTest
global class RecordsTest
{
    private static testMethod void all()
    {
        Test.startTest();

            Filter constructed = Records.all();

        Test.stopTest();

        System.assert( constructed.predicate instanceof ConstantPredicate,
            'The filter should be of the right type' );
        System.assertEquals( true, ((ConstantPredicate)constructed.predicate).value,
            'The constant filter should always return true' );
    }

    private static testMethod void none()
    {
        Test.startTest();

            Filter constructed = Records.none();

        Test.stopTest();

        System.assert( constructed.predicate instanceof ConstantPredicate,
            'The filter should be of the right type' );
        System.assertEquals( false, ((ConstantPredicate)constructed.predicate).value,
            'The constant filter should always return false' );
    }

    private static testMethod void both()
    {
        System.assert( false, 'implement test' );
    }

    private static testMethod void all_conjunction()
    {
        System.assert( false, 'implement test' );
    }

    private static testMethod void either()
    {
        System.assert( false, 'implement test' );
    }

    private static testMethod void any()
    {
        System.assert( false, 'implement test' );
    }
}
