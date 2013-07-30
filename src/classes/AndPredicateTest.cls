@isTest
private class AndPredicateTest
{
    private static testMethod void testInsert()
    {
        Predicate yes = new ConstantPredicate( true );
        Predicate no = new ConstantPredicate( false );

        Predicate yesAndYes = new AndPredicate( yes, yes );
        Predicate yesAndNo = new AndPredicate( no, yes );
        Predicate noAndYes = new AndPredicate( yes, no );
        Predicate noAndNo = new AndPredicate( no, no );

        Lead sObj = new Lead();

        Test.startTest();

            Boolean yesAndYesVal = yesAndYes.evaluate( sObj );
            Boolean yesAndNoVal = yesAndNo.evaluate( sObj );
            Boolean noAndYesVal = noAndYes.evaluate( sObj );
            Boolean noAndNoVal = noAndNo.evaluate( sObj );

        Test.stopTest();

        System.assertEquals( true, yesAndYesVal, 'true and true is true' );
        System.assertEquals( false, yesAndNoVal, 'true and false is false' );
        System.assertEquals( false, noAndYesVal, 'false and true is false' );
        System.assertEquals( false, noAndNoVal, 'false and false is false' );
    }
}
