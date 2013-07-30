@isTest
private class NotPredicateTest
{
    private static testMethod void testInsert()
    {
        Predicate yes = new ConstantPredicate( true );
        Predicate no = new ConstantPredicate( false );

        Predicate notYes = new NotPredicate( yes );
        Predicate notNo = new NotPredicate( no );

        Lead sObj = new Lead();

        Test.startTest();

            Boolean notYesVal = notYes.evaluate( sObj );
            Boolean notNoVal = notNo.evaluate( sObj );

        Test.stopTest();

        System.assertEquals( false, notYesVal, 'not true is false' );
        System.assertEquals( true, notNoVal, 'not false is true' );
    }

    private static testMethod void testUpdate()
    {
        Predicate yes = new ConstantPredicate( true );
        Predicate no = new ConstantPredicate( false );

        Predicate notYes = new NotPredicate( yes );
        Predicate notNo = new NotPredicate( no );

        Lead sObj = new Lead();

        Test.startTest();

            Boolean notYesVal = notYes.evaluate( sObj, sObj );
            Boolean notNoVal = notNo.evaluate( sObj, sObj );

        Test.stopTest();

        System.assertEquals( false, notYesVal, 'not true is false' );
        System.assertEquals( true, notNoVal, 'not false is true' );
    }
}
