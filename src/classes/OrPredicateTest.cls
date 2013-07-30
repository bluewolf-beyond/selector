@isTest
private class OrPredicateTest
{
    static Predicate yes = new ConstantPredicate( true );
    static Predicate no = new ConstantPredicate( false );
    static Lead sObj = new Lead();

    private static testMethod void testInsert()
    {
        Predicate yesOrYes = new OrPredicate( yes, yes );
        Predicate yesOrNo = new OrPredicate( no, yes );
        Predicate noOrYes = new OrPredicate( yes, no );
        Predicate noOrNo = new OrPredicate( no, no );

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
        Predicate yesOrYes = new OrPredicate( yes, yes );
        Predicate yesOrNo = new OrPredicate( no, yes );
        Predicate noOrYes = new OrPredicate( yes, no );
        Predicate noOrNo = new OrPredicate( no, no );

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

    private static testMethod void testConstruct_compoundFirst()
    {
        Predicate both = new OrPredicate( yes, no );
        Predicate another = new ConstantPredicate( true );

        Test.startTest();

            OrPredicate compoundPredicate = new OrPredicate( both, another );

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
        Predicate both = new OrPredicate( yes, no );
        Predicate another = new ConstantPredicate( true );

        Test.startTest();

            OrPredicate compoundPredicate = new OrPredicate( another, both );

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
        Predicate both = new OrPredicate( yes, no );
        Predicate another = new OrPredicate( no, yes );

        Test.startTest();

            OrPredicate compoundPredicate = new OrPredicate( both, another );

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

    private static testMethod void testShortcutEvaluate_Insert()
    {
        SpyPredicate spy = new SpyPredicate();
        Predicate both = new OrPredicate( yes, spy );

        Test.startTest();

            both.evaluate( sObj );

        Test.stopTest();

        System.assertEquals( false, spy.wasCalled,
            'OrPredicate should use shortcut evaluation' );
    }

    private static testMethod void testShortcutEvaluate_Update()
    {
        SpyPredicate spy = new SpyPredicate();
        Predicate both = new OrPredicate( yes, spy );

        Test.startTest();

            both.evaluate( sObj, sObj );

        Test.stopTest();

        System.assertEquals( false, spy.wasCalled,
            'OrPredicate should use shortcut evaluation' );
    }
}
