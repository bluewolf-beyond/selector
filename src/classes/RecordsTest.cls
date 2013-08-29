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
        Filter left = Field.hasChanged( 'Account' );
        Filter right = Field.isNull( 'Name' );

        Test.startTest();

            Filter constructed = Records.both( left, right );

        Test.stopTest();

        System.assert( constructed.predicate instanceof AndPredicate,
            'The filter should be a conjunction' );

        AndPredicate predicate = (AndPredicate)constructed.predicate;
        System.assert( predicate.predicates[0] === left.predicate,
            'The left predicate should be the first of the conjoined predicates' );
        System.assert( predicate.predicates[1] === right.predicate,
            'The left predicate should be the first of the conjoined predicates' );
    }

    private static testMethod void all_conjunction()
    {
        Filter left = Field.hasChanged( 'Account' );
        Filter right = Field.isNull( 'Name' );

        Test.startTest();

            Filter constructed = Records.all( new List<Filter>{ left, right } );

        Test.stopTest();

        System.assert( constructed.predicate instanceof AndPredicate,
            'The filter should be a conjunction' );

        AndPredicate predicate = (AndPredicate)constructed.predicate;
        System.assert( predicate.predicates[0] === left.predicate,
            'The left predicate should be the first of the conjoined predicates' );
        System.assert( predicate.predicates[1] === right.predicate,
            'The left predicate should be the first of the conjoined predicates' );
    }

    private static testMethod void either()
    {
        Filter left = Field.hasChanged( 'Account' );
        Filter right = Field.isNull( 'Name' );

        Test.startTest();

            Filter constructed = Records.either( left, right );

        Test.stopTest();

        System.assert( constructed.predicate instanceof OrPredicate,
            'The filter should be a disjunction' );

        OrPredicate predicate = (OrPredicate)constructed.predicate;
        System.assert( predicate.predicates[0] === left.predicate,
            'The left predicate should be the first of the disjoined predicates' );
        System.assert( predicate.predicates[1] === right.predicate,
            'The left predicate should be the first of the disjoined predicates' );
    }

    private static testMethod void any()
    {
        Filter left = Field.hasChanged( 'Account' );
        Filter right = Field.isNull( 'Name' );

        Test.startTest();

            Filter constructed = Records.any( new List<Filter>{ left, right } );

        Test.stopTest();

        System.assert( constructed.predicate instanceof OrPredicate,
            'The filter should be a disjunction' );

        OrPredicate predicate = (OrPredicate)constructed.predicate;
        System.assert( predicate.predicates[0] === left.predicate,
            'The left predicate should be the first of the disjoined predicates' );
        System.assert( predicate.predicates[1] === right.predicate,
            'The left predicate should be the first of the disjoined predicates' );
    }
}
