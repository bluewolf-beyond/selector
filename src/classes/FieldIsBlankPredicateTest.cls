@isTest
private class FieldIsBlankPredicateTest
{
    private static testMethod void test_fieldIsBlank()
    {
        OpportunityLineItem oli = new OpportunityLineItem();
        PricebookEntry pbe = new PricebookEntry();
        Product2 pdt = new Product2();
        pdt.Family = '';

        pbe.Product2 = pdt;
        oli.PricebookEntry = pbe;

        Test.startTest();
            Boolean result = ( new FieldIsBlankPredicate( 'PricebookEntry.Product2.Family' ) ).evaluate( oli );
        Test.stopTest();

        System.assertEquals(true, result, 'Because the string field is blank, we expect the result to be true');
    }

    private static testMethod void test_fieldRelationshipIsEmpty()
    {
        OpportunityLineItem oli = new OpportunityLineItem();

        Test.startTest();
            Boolean result = ( new FieldIsBlankPredicate( 'PricebookEntry.Product2.Family' ) ).evaluate( oli );
        Test.stopTest();

        System.assertEquals(true, result, 'Because the relationship is blank, we expect to return true');
    }

    private static testMethod void testFieldIsNotBlank()
    {
        Lead testLead = new Lead( FirstName='Bob');

        Test.startTest();
            Boolean result = ( new FieldIsBlankPredicate( Lead.FirstName ) ).evaluate( testLead );
        Test.stopTest();

        System.assertEquals(false, result, 'Because the field is not blank, we expect that the result will be false');
    }
}