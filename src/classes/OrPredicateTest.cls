@isTest
private class OrPredicateTest
{
    private static testMethod void testInsert()
    {
        Predicate yes = new ConstantPredicate( true );
        Predicate no = new ConstantPredicate( false );

        Predicate yesOrYes = new OrPredicate( yes, yes );
        Predicate yesOrNo = new OrPredicate( no, yes );
        Predicate noOrYes = new OrPredicate( yes, no );
        Predicate noOrNo = new OrPredicate( no, no );

        Lead sObj = new Lead();

        Test.startTest();

            Boolean yesOrYesVal = yesOrYes.evaluate( sObj );
            Boolean yesOrNoVal = yesOrNo.evaluate( sObj );
            Boolean noOrYesVal = noOrYes.evaluate( sObj );
            Boolean noOrNoVal = noOrNo.evaluate( sObj );

        Test.stopTest();

        System.assertEquals( true, yesOrYesVal, 'true or true is true' );
        System.assertEquals( true, yesOrNoVal, 'true or false is true' );
        System.assertEquals( true, noOrYesVal, 'false or true is true' );
        System.assertEquals( false, noOrNoVal, 'false or false is false' );
    }

    private static testMethod void testUpdate()
    {
        Predicate yes = new ConstantPredicate( true );
        Predicate no = new ConstantPredicate( false );

        Predicate yesOrYes = new OrPredicate( yes, yes );
        Predicate yesOrNo = new OrPredicate( no, yes );
        Predicate noOrYes = new OrPredicate( yes, no );
        Predicate noOrNo = new OrPredicate( no, no );

        Lead sObj = new Lead();

        Test.startTest();

            Boolean yesOrYesVal = yesOrYes.evaluate( sObj, sObj );
            Boolean yesOrNoVal = yesOrNo.evaluate( sObj, sObj );
            Boolean noOrYesVal = noOrYes.evaluate( sObj, sObj );
            Boolean noOrNoVal = noOrNo.evaluate( sObj, sObj );

        Test.stopTest();

        System.assertEquals( true, yesOrYesVal, 'true or true is true' );
        System.assertEquals( true, yesOrNoVal, 'true or false is true' );
        System.assertEquals( true, noOrYesVal, 'false or true is true' );
        System.assertEquals( false, noOrNoVal, 'false or false is false' );
    }
}
