@isTest
private class FilterTest
{
    /////////////////////////////////////////////////////////////////
    // filtering methods
    /////////////////////////////////////////////////////////////////

    private static testMethod void testFilter_Insert()
    {
        final Integer NUM_MATCHING = 6;
        final Integer MOD_FACTOR = 3;
        final Integer NUM_RECORDS = NUM_MATCHING * MOD_FACTOR;
        final String FILTER_COMPANY = 'Foobar Industries';

        Filter filter = new Filter( new CompanyMatcher( FILTER_COMPANY ) );

        List<sObject> testRecords = new List<sObject>();

        for ( Integer i = 0; i < NUM_RECORDS; i++ )
        {
            if ( Math.mod( i, MOD_FACTOR ) == 0 )
            {
                testRecords.add( new Lead( Company = FILTER_COMPANY ) );
            }
            else
            {
                testRecords.add( new Lead( Company = 'Intractable Industries' ) );
            }
        }

        Test.startTest();

            List<sObject> filteredRecords = filter.filter( testRecords );

        Test.stopTest();

        System.assertEquals( NUM_MATCHING, filteredRecords.size(),
            'All records matching the filter should be returned' );

        for ( sObject record : filteredRecords )
        {
            System.assertEquals( FILTER_COMPANY, record.get('Company'),
                'Only records matching the filter should be returned' );
        }
    }

    private static testMethod void testFilter_Update()
    {
        final Integer NUM_MATCHING = 6;
        final Integer MOD_FACTOR = 3;
        final Integer NUM_RECORDS = NUM_MATCHING * MOD_FACTOR;
        final String FILTER_COMPANY = 'Foobar Industries';

        Filter filter = new Filter( new CompanyMatcher( FILTER_COMPANY ) );

        List<sObject> testRecords = new List<sObject>();

        for ( Integer i = 0; i < NUM_RECORDS; i++ )
        {
            Lead testRecord = new Lead();
            testRecord.FirstName = 'John';
            testRecord.LastName = 'Resig';

            if ( Math.mod( i, MOD_FACTOR ) == 0 )
            {
                testRecord.Company = 'Intractable Industries';
            }
            else
            {
                testRecord.Company = FILTER_COMPANY;
            }

            testRecords.add( testRecord );
        }

        insert testRecords;

        Map<Id, sObject> oldRecords = new Map<Id, sObject>( (List<Lead>)testRecords.clone() );

        Test.startTest();

            List<sObject> filteredRecords = filter.filter( testRecords, oldRecords );

        Test.stopTest();

        System.assertEquals( NUM_MATCHING, filteredRecords.size(),
            'All records matching the filter should be returned' );

        for ( sObject record : filteredRecords )
        {
            System.assertNotEquals( FILTER_COMPANY, record.get('Company'),
                'Only records matching the filter should be returned' );
        }
    }

    /////////////////////////////////////////////////////////////////
    // composition methods
    /////////////////////////////////////////////////////////////////

    private static testMethod void testFilter_andx()
    {
        Predicate left = new ConstantPredicate( false );
        Predicate right = new ConstantPredicate( true );

        Test.startTest();

            Filter leftAndRight = new Filter( left ).andx( new Filter( right ) );
            Filter rightAndLeft = new Filter( right ).andx( new Filter( left ) );

        Test.stopTest();

        System.assert( leftAndRight.predicate instanceof AndPredicate,
            'The filter and operation should return an and predicate' );
        AndPredicate andPredicate = (AndPredicate)leftAndRight.predicate;
        System.assertEquals( left, andPredicate.predicates[0], 'the predicates should be the children' );
        System.assertEquals( right, andPredicate.predicates[1], 'the predicates should be the children' );

        System.assert( rightAndLeft.predicate instanceof AndPredicate,
            'The filter and operation should return an and predicate' );
        andPredicate = (AndPredicate)rightAndLeft.predicate;
        System.assertEquals( right, andPredicate.predicates[0], 'the predicates should be the children' );
        System.assertEquals( left, andPredicate.predicates[1], 'the predicates should be the children' );
    }

    private static testMethod void testFilter_orx()
    {
        Predicate left = new ConstantPredicate( false );
        Predicate right = new ConstantPredicate( true );

        Test.startTest();

            Filter leftOrRight = new Filter( left ).orx( new Filter( right ) );
            Filter rightOrLeft = new Filter( right ).orx( new Filter( left ) );

        Test.stopTest();

        System.assert( leftOrRight.predicate instanceof OrPredicate,
            'The filter or operation should return an or predicate' );
        OrPredicate orPredicate = (OrPredicate)leftOrRight.predicate;
        System.assertEquals( left, orPredicate.predicates[0], 'the predicates should be the children' );
        System.assertEquals( right, orPredicate.predicates[1], 'the predicates should be the children' );

        System.assert( rightOrLeft.predicate instanceof OrPredicate,
            'The filter or operation should return an or predicate' );
        orPredicate = (OrPredicate)rightOrLeft.predicate;
        System.assertEquals( right, orPredicate.predicates[0], 'the predicates should be the children' );
        System.assertEquals( left, orPredicate.predicates[1], 'the predicates should be the children' );
    }

    private static testMethod void testFilter_notx()
    {
        Predicate no = new ConstantPredicate( false );

        Test.startTest();

            Filter yesFilter = new Filter( no ).notx();

        Test.stopTest();

        System.assert( yesFilter.predicate instanceof NotPredicate,
            'The filter not operation should return a not predicate' );
        NotPredicate yes = (NotPredicate)yesFilter.predicate;
        System.assertEquals( no, yes.inverted, 'the predicate should be the child' );
    }

    /////////////////////////////////////////////////////////////////
    // test predicates
    /////////////////////////////////////////////////////////////////

    private class CompanyMatcher implements Predicate
    {
        String company;
        CompanyMatcher( String company )
        {
            this.company = company;
        }

        public Boolean evaluate( sObject newRecord )
        {
            return newRecord.get('Company') == company;
        }

        public Boolean evaluate( sObject newRecord, sObject oldRecord )
        {
            return newRecord.get('Company') != company;
        }
    }
}
