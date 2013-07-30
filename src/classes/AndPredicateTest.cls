@isTest
private class AndPredicateTest
{
    static Predicate yes = new ConstantPredicate( true );
    static Predicate no = new ConstantPredicate( false );

    private static testMethod void testInsert()
    {
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

    private static testMethod void testUpdate()
    {
        Predicate yesAndYes = new AndPredicate( yes, yes );
        Predicate yesAndNo = new AndPredicate( no, yes );
        Predicate noAndYes = new AndPredicate( yes, no );
        Predicate noAndNo = new AndPredicate( no, no );

        Lead sObj = new Lead();

        Test.startTest();

            Boolean yesAndYesVal = yesAndYes.evaluate( sObj, sObj );
            Boolean yesAndNoVal = yesAndNo.evaluate( sObj, sObj );
            Boolean noAndYesVal = noAndYes.evaluate( sObj, sObj );
            Boolean noAndNoVal = noAndNo.evaluate( sObj, sObj );

        Test.stopTest();

        System.assertEquals( true, yesAndYesVal, 'true and true is true' );
        System.assertEquals( false, yesAndNoVal, 'true and false is false' );
        System.assertEquals( false, noAndYesVal, 'false and true is false' );
        System.assertEquals( false, noAndNoVal, 'false and false is false' );
    }

    private static testMethod void testConstruct_compoundFirst()
    {
        Predicate both = new AndPredicate( yes, no );
        Predicate another = new ConstantPredicate( true );

        Test.startTest();

            AndPredicate compoundPredicate = new AndPredicate( both, another );

        Test.stopTest();

        System.assertEquals( 3, compoundPredicate.predicates.size(),
            'Compound predicates should be flattened' );
        System.assertEquals( yes, compoundPredicate.predicates[0],
            'Compound predicates should be built in order' );
        System.assertEquals( no, compoundPredicate.predicates[1],
            'Compound predicates should be built in order' );
        System.assertEquals( another, compoundPredicate.predicates[2],
            'Compound predicates should be built in order' );
    }

    private static testMethod void testConstruct_compoundSecond()
    {
        Predicate both = new AndPredicate( yes, no );
        Predicate another = new ConstantPredicate( true );

        Test.startTest();

            AndPredicate compoundPredicate = new AndPredicate( another, both );

        Test.stopTest();

        System.assertEquals( 3, compoundPredicate.predicates.size(),
            'Compound predicates should be flattened' );
        System.assertEquals( another, compoundPredicate.predicates[0],
            'Compound predicates should be built in order' );
        System.assertEquals( yes, compoundPredicate.predicates[1],
            'Compound predicates should be built in order' );
        System.assertEquals( no, compoundPredicate.predicates[2],
            'Compound predicates should be built in order' );
    }

    private static testMethod void testConstruct_compoundBoth()
    {
        Predicate both = new AndPredicate( yes, no );
        Predicate another = new AndPredicate( no, yes );

        Test.startTest();

            AndPredicate compoundPredicate = new AndPredicate( both, another );

        Test.stopTest();

        System.assertEquals( 4, compoundPredicate.predicates.size(),
            'Compound predicates should be flattened' );
        System.assertEquals( yes, compoundPredicate.predicates[0],
            'Compound predicates should be built in order' );
        System.assertEquals( no, compoundPredicate.predicates[1],
            'Compound predicates should be built in order' );
        System.assertEquals( no, compoundPredicate.predicates[2],
            'Compound predicates should be built in order' );
        System.assertEquals( yes, compoundPredicate.predicates[3],
            'Compound predicates should be built in order' );
    }
}
