@isTest
global class RecordTest
{
    private static testMethod void isNew()
    {
        Test.startTest();

            Filter constructed = Record.isNew();

        Test.stopTest();

        System.assert( constructed.predicate instanceof IsNewPredicate,
            'The filter should be on new records' );
    }

    private static testMethod void notNew()
    {
        Test.startTest();

            Filter constructed = Record.notNew();

        Test.stopTest();

        System.assert( constructed.predicate instanceof NotPredicate,
            'The filter should be an inversion' );
        System.assert( ((NotPredicate)constructed.predicate).inverted instanceof IsNewPredicate,
            'The filter should be on non-new records' );
    }

    private static testMethod void byId()
    {
        System.assert( false, 'implement test' );
    }

    private static testMethod void byName()
    {
        System.assert( false, 'implement test' );
    }

    private static testMethod void isOrphan()
    {
        System.assert( false, 'implement test' );
    }
}
