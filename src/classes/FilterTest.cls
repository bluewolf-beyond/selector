@isTest
private class FilterTest
{
    /////////////////////////////////////////////////////////////////
    // standard filter types
    /////////////////////////////////////////////////////////////////

    private static testMethod void testFieldChangedFilter_Schema()
    {
        Test.startTest();

            Filter companyChangedFilter = Filter.fieldChanged( Lead.Company );

        Test.stopTest();

        System.assert( companyChangedFilter.predicate instanceof FieldChangedPredicate,
            'The filter should be of the proper variety' );

        FieldChangedPredicate predicate = (FieldChangedPredicate)companyChangedFilter.predicate;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
    }

    private static testMethod void testFieldChangedFilter_String()
    {
        Test.startTest();

            Filter companyChangedFilter = Filter.fieldChanged( 'Company' );

        Test.stopTest();

        System.assert( companyChangedFilter.predicate instanceof FieldChangedPredicate,
            'The filter should be of the proper variety' );

        FieldChangedPredicate predicate = (FieldChangedPredicate)companyChangedFilter.predicate;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
    }

    private static testMethod void testFieldNewFilter_Schema()
    {
        Test.startTest();

            Filter companyNewFilter = Filter.fieldNew( Lead.Company );

        Test.stopTest();

        System.assert( companyNewFilter.predicate instanceof FieldNewPredicate,
            'The filter should be of the proper variety' );

        FieldNewPredicate predicate = (FieldNewPredicate)companyNewFilter.predicate;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
    }

    private static testMethod void testFieldNewFilter_String()
    {
        Test.startTest();

            Filter companyNewFilter = Filter.fieldNew( 'Company' );

        Test.stopTest();

        System.assert( companyNewFilter.predicate instanceof FieldNewPredicate,
            'The filter should be of the proper variety' );

        FieldNewPredicate predicate = (FieldNewPredicate)companyNewFilter.predicate;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
    }

    private static testMethod void testFieldEqualsFilter_Schema()
    {
        final String FILTER_VALUE = 'Foobar';

        Test.startTest();

            Filter companyEqualsFoobarFilter = Filter.fieldEquals( Lead.Company, FILTER_VALUE );

        Test.stopTest();

        System.assert( companyEqualsFoobarFilter.predicate instanceof FieldEqualsPredicate,
            'The filter should be of the proper variety' );

        FieldEqualsPredicate predicate = (FieldEqualsPredicate)companyEqualsFoobarFilter.predicate;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
        System.assertEquals( FILTER_VALUE, predicate.value,
            'The value passed in should be the filter value' );
    }

    private static testMethod void testFieldEqualsFilter_String()
    {
        final String FILTER_VALUE = 'Foobar';

        Test.startTest();

            Filter companyEqualsFoobarFilter = Filter.fieldEquals( 'Company', FILTER_VALUE );

        Test.stopTest();

        System.assert( companyEqualsFoobarFilter.predicate instanceof FieldEqualsPredicate,
            'The filter should be of the proper variety' );

        FieldEqualsPredicate predicate = (FieldEqualsPredicate)companyEqualsFoobarFilter.predicate;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
        System.assertEquals( FILTER_VALUE, predicate.value,
            'The value passed in should be the filter value' );
    }

    private static testMethod void testFieldNotEqualsFilter_Schema()
    {
        final String FILTER_VALUE = 'Foobar';

        Test.startTest();

            Filter companyNotEqualsFoobarFilter = Filter.fieldNotEquals( Lead.Company, FILTER_VALUE );

        Test.stopTest();

        System.assert( companyNotEqualsFoobarFilter.predicate instanceof NotPredicate,
            'The filter should be of the proper variety' );

        FieldEqualsPredicate predicate = (FieldEqualsPredicate)((NotPredicate)companyNotEqualsFoobarFilter.predicate).inverted;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
        System.assertEquals( FILTER_VALUE, predicate.value,
            'The value passed in should be the filter value' );
    }

    private static testMethod void testFieldNotEqualsFilter_String()
    {
        final String FILTER_VALUE = 'Foobar';

        Test.startTest();

            Filter companyNotEqualsFoobarFilter = Filter.fieldNotEquals( 'Company', FILTER_VALUE );

        Test.stopTest();

        System.assert( companyNotEqualsFoobarFilter.predicate instanceof NotPredicate,
            'The filter should be of the proper variety' );

        FieldEqualsPredicate predicate = (FieldEqualsPredicate)((NotPredicate)companyNotEqualsFoobarFilter.predicate).inverted;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
        System.assertEquals( FILTER_VALUE, predicate.value,
            'The value passed in should be the filter value' );
    }

    private static testMethod void testFieldInFilter_Schema()
    {
        Set<Object> FILTER_VALUES = new Set<Object>{ 'Foobar' };

        Test.startTest();

            Filter companyInFoobarFilter = Filter.fieldIn( Lead.Company, FILTER_VALUES );

        Test.stopTest();

        System.assert( companyInFoobarFilter.predicate instanceof FieldInPredicate,
            'The filter should be of the proper variety' );

        FieldInPredicate predicate = (FieldInPredicate)companyInFoobarFilter.predicate;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
        System.assertEquals( 1, predicate.values.size(),
            'The set passed in should be the filter set' );
        System.assert( predicate.values.containsAll( FILTER_VALUES ),
            'The value passed in should be the filter value' );
    }

    private static testMethod void testFieldInFilter_String()
    {
        Set<Object> FILTER_VALUES = new Set<Object>{ 'Foobar' };

        Test.startTest();

            Filter companyInFoobarFilter = Filter.fieldIn( 'Company', FILTER_VALUES );

        Test.stopTest();

        System.assert( companyInFoobarFilter.predicate instanceof FieldInPredicate,
            'The filter should be of the proper variety' );

        FieldInPredicate predicate = (FieldInPredicate)companyInFoobarFilter.predicate;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
        System.assertEquals( 1, predicate.values.size(),
            'The set passed in should be the filter set' );
        System.assert( predicate.values.containsAll( FILTER_VALUES ),
            'The value passed in should be the filter value' );
    }

    private static testMethod void testFieldNotInFilter_Schema()
    {
        Set<Object> FILTER_VALUES = new Set<Object>{ 'Foobar' };

        Test.startTest();

            Filter companyNotInFoobarFilter = Filter.fieldNotIn( Lead.Company, FILTER_VALUES );

        Test.stopTest();

        System.assert( companyNotInFoobarFilter.predicate instanceof NotPredicate,
            'The filter should be of the proper variety' );

        FieldInPredicate predicate = (FieldInPredicate)((NotPredicate)companyNotInFoobarFilter.predicate).inverted;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
        System.assertEquals( 1, predicate.values.size(),
            'The set passed in should be the filter set' );
        System.assert( predicate.values.containsAll( FILTER_VALUES ),
            'The value passed in should be the filter value' );
    }

    private static testMethod void testFieldNotInFilter_String()
    {
        Set<Object> FILTER_VALUES = new Set<Object>{ 'Foobar' };

        Test.startTest();

            Filter companyNotInFoobarFilter = Filter.fieldNotIn( 'Company', FILTER_VALUES );

        Test.stopTest();

        System.assert( companyNotInFoobarFilter.predicate instanceof NotPredicate,
            'The filter should be of the proper variety' );

        FieldInPredicate predicate = (FieldInPredicate)((NotPredicate)companyNotInFoobarFilter.predicate).inverted;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
        System.assertEquals( 1, predicate.values.size(),
            'The set passed in should be the filter set' );
        System.assert( predicate.values.containsAll( FILTER_VALUES ),
            'The value passed in should be the filter value' );
    }

    private static testMethod void testFieldNullFilter_Schema()
    {
        Test.startTest();

            Filter companyNullFilter = Filter.fieldNull( Lead.Company );

        Test.stopTest();

        System.assert( companyNullFilter.predicate instanceof FieldNullPredicate,
            'The filter should be of the proper variety' );

        FieldNullPredicate predicate = (FieldNullPredicate)companyNullFilter.predicate;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
    }

    private static testMethod void testFieldNullFilter_String()
    {
        Test.startTest();

            Filter companyNullFilter = Filter.fieldNull( 'Company' );

        Test.stopTest();

        System.assert( companyNullFilter.predicate instanceof FieldNullPredicate,
            'The filter should be of the proper variety' );

        FieldNullPredicate predicate = (FieldNullPredicate)companyNullFilter.predicate;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
    }

    private static testMethod void testFieldNotNullFilter_Schema()
    {
        Test.startTest();

            Filter companyNotNullFilter = Filter.fieldNotNull( Lead.Company );

        Test.stopTest();

        System.assert( companyNotNullFilter.predicate instanceof NotPredicate,
            'The filter should be of the proper variety' );

        FieldNullPredicate predicate = (FieldNullPredicate)((NotPredicate)companyNotNullFilter.predicate).inverted;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
    }

    private static testMethod void testFieldNotNullFilter_String()
    {
        Test.startTest();

            Filter companyNotNullFilter = Filter.fieldNotNull( 'Company' );

        Test.stopTest();

        System.assert( companyNotNullFilter.predicate instanceof NotPredicate,
            'The filter should be of the proper variety' );

        FieldNullPredicate predicate = (FieldNullPredicate)((NotPredicate)companyNotNullFilter.predicate).inverted;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
    }

    /////////////////////////////////////////////////////////////////
    // Filter instance methods
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
        System.assertEquals( left, andPredicate.left, 'the predicates should be the children' );
        System.assertEquals( right, andPredicate.right, 'the predicates should be the children' );

        System.assert( rightAndLeft.predicate instanceof AndPredicate,
            'The filter and operation should return an and predicate' );
        andPredicate = (AndPredicate)rightAndLeft.predicate;
        System.assertEquals( right, andPredicate.left, 'the predicates should be the children' );
        System.assertEquals( left, andPredicate.right, 'the predicates should be the children' );
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
        System.assertEquals( left, orPredicate.left, 'the predicates should be the children' );
        System.assertEquals( right, orPredicate.right, 'the predicates should be the children' );

        System.assert( rightOrLeft.predicate instanceof OrPredicate,
            'The filter or operation should return an or predicate' );
        orPredicate = (OrPredicate)rightOrLeft.predicate;
        System.assertEquals( right, orPredicate.left, 'the predicates should be the children' );
        System.assertEquals( left, orPredicate.right, 'the predicates should be the children' );
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
