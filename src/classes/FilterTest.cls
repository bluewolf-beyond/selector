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

        System.assert( companyNewFilter.predicate instanceof Filter.FieldNewPredicate,
            'The filter should be of the proper variety' );

        Filter.FieldNewPredicate predicate = (Filter.FieldNewPredicate)companyNewFilter.predicate;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
    }

    private static testMethod void testFieldNewFilter_String()
    {
        Test.startTest();

            Filter companyNewFilter = Filter.fieldNew( 'Company' );

        Test.stopTest();

        System.assert( companyNewFilter.predicate instanceof Filter.FieldNewPredicate,
            'The filter should be of the proper variety' );

        Filter.FieldNewPredicate predicate = (Filter.FieldNewPredicate)companyNewFilter.predicate;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
    }

    private static testMethod void testFieldEqualsFilter_Schema()
    {
        final String FILTER_VALUE = 'Foobar';

        Test.startTest();

            Filter companyEqualsFoobarFilter = Filter.fieldEquals( Lead.Company, FILTER_VALUE );

        Test.stopTest();

        System.assert( companyEqualsFoobarFilter.predicate instanceof Filter.FieldEqualsPredicate,
            'The filter should be of the proper variety' );

        Filter.FieldEqualsPredicate predicate = (Filter.FieldEqualsPredicate)companyEqualsFoobarFilter.predicate;
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

        System.assert( companyEqualsFoobarFilter.predicate instanceof Filter.FieldEqualsPredicate,
            'The filter should be of the proper variety' );

        Filter.FieldEqualsPredicate predicate = (Filter.FieldEqualsPredicate)companyEqualsFoobarFilter.predicate;
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

        System.assert( companyNotEqualsFoobarFilter.predicate instanceof Filter.FieldNotEqualsPredicate,
            'The filter should be of the proper variety' );

        Filter.FieldNotEqualsPredicate predicate = (Filter.FieldNotEqualsPredicate)companyNotEqualsFoobarFilter.predicate;
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

        System.assert( companyNotEqualsFoobarFilter.predicate instanceof Filter.FieldNotEqualsPredicate,
            'The filter should be of the proper variety' );

        Filter.FieldNotEqualsPredicate predicate = (Filter.FieldNotEqualsPredicate)companyNotEqualsFoobarFilter.predicate;
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

        System.assert( companyInFoobarFilter.predicate instanceof Filter.FieldInPredicate,
            'The filter should be of the proper variety' );

        Filter.FieldInPredicate predicate = (Filter.FieldInPredicate)companyInFoobarFilter.predicate;
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

        System.assert( companyInFoobarFilter.predicate instanceof Filter.FieldInPredicate,
            'The filter should be of the proper variety' );

        Filter.FieldInPredicate predicate = (Filter.FieldInPredicate)companyInFoobarFilter.predicate;
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

        System.assert( companyNotInFoobarFilter.predicate instanceof Filter.FieldNotInPredicate,
            'The filter should be of the proper variety' );

        Filter.FieldNotInPredicate predicate = (Filter.FieldNotInPredicate)companyNotInFoobarFilter.predicate;
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

        System.assert( companyNotInFoobarFilter.predicate instanceof Filter.FieldNotInPredicate,
            'The filter should be of the proper variety' );

        Filter.FieldNotInPredicate predicate = (Filter.FieldNotInPredicate)companyNotInFoobarFilter.predicate;
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

        System.assert( companyNullFilter.predicate instanceof Filter.FieldNullPredicate,
            'The filter should be of the proper variety' );

        Filter.FieldNullPredicate predicate = (Filter.FieldNullPredicate)companyNullFilter.predicate;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
    }

    private static testMethod void testFieldNullFilter_String()
    {
        Test.startTest();

            Filter companyNullFilter = Filter.fieldNull( 'Company' );

        Test.stopTest();

        System.assert( companyNullFilter.predicate instanceof Filter.FieldNullPredicate,
            'The filter should be of the proper variety' );

        Filter.FieldNullPredicate predicate = (Filter.FieldNullPredicate)companyNullFilter.predicate;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
    }

    private static testMethod void testFieldNotNullFilter_Schema()
    {
        Test.startTest();

            Filter companyNotNullFilter = Filter.fieldNotNull( Lead.Company );

        Test.stopTest();

        System.assert( companyNotNullFilter.predicate instanceof Filter.FieldNotNullPredicate,
            'The filter should be of the proper variety' );

        Filter.FieldNotNullPredicate predicate = (Filter.FieldNotNullPredicate)companyNotNullFilter.predicate;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
    }

    private static testMethod void testFieldNotNullFilter_String()
    {
        Test.startTest();

            Filter companyNotNullFilter = Filter.fieldNotNull( 'Company' );

        Test.stopTest();

        System.assert( companyNotNullFilter.predicate instanceof Filter.FieldNotNullPredicate,
            'The filter should be of the proper variety' );

        Filter.FieldNotNullPredicate predicate = (Filter.FieldNotNullPredicate)companyNotNullFilter.predicate;
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

    /////////////////////////////////////////////////////////////////
    // standard Predicates
    /////////////////////////////////////////////////////////////////

    private static testMethod void testPredicate_FieldNew_Insert()
    {
        Predicate predicate = new Filter.FieldNewPredicate( Lead.Company );

        sObject sObjectWithValue = new Lead();
        sObjectWithValue.put( 'Company', 'Foobar Industries' );

        sObject sObjectWithoutValue = new Lead();

        Test.startTest();

            Boolean fieldWithValueNew = predicate.evaluate( sObjectWithValue );
            Boolean fieldWithoutValueNew = predicate.evaluate( sObjectWithoutValue );

        Test.stopTest();

        System.assertEquals( true, fieldWithValueNew,
            'A Field with a value on insert is considered new' );
        System.assertEquals( false, fieldWithoutValueNew,
            'A Field without a value on insert isn\'t considered new' );
    }

    private static testMethod void testPredicate_FieldNew_Update()
    {
        Predicate predicate = new Filter.FieldNewPredicate( Lead.Company );

        sObject sObjectNew = new Lead();
        sObjectNew.put( 'Company', 'Foobar Industries' );

        sObject sObjectWithValue = new Lead();
        sObjectWithValue.put( 'Company', 'Intractable Industries' );

        sObject sObjectWithoutValue = new Lead();
        sObjectWithoutValue.put( 'Company', null );

        Test.startTest();

            Boolean fieldWithValueNew = predicate.evaluate( sObjectNew, sObjectWithValue );
            Boolean fieldWithoutValueNew = predicate.evaluate( sObjectNew, sObjectWithoutValue );

        Test.stopTest();

        System.assertEquals( false, fieldWithValueNew,
            'A Field with a value on update isn\'t considered new' );
        System.assertEquals( true, fieldWithoutValueNew,
            'A Field without a value on update is considered new' );
    }

    private static testMethod void testPredicate_FieldEquals()
    {
        Predicate predicate = new Filter.FieldEqualsPredicate( Lead.Company, 'Foobar Industries' );

        sObject sObjectWithValue = new Lead();
        sObjectWithValue.put( 'Company', 'Foobar Industries' );

        sObject sObjectWithOther = new Lead();
        sObjectWithOther.put( 'Company', 'Intractable Industries' );

        Test.startTest();

            Boolean fieldWithValueEquals = predicate.evaluate( sObjectWithValue );
            Boolean fieldWithOtherEquals = predicate.evaluate( sObjectWithOther );

        Test.stopTest();

        System.assert( predicate instanceof InsertPredicate,
            'No update test needed' );

        System.assertEquals( true, fieldWithValueEquals,
            'A Field with a matching value on insert is considered equal' );
        System.assertEquals( false, fieldWithOtherEquals,
            'A Field with a differing value on insert isn\'t considered equal' );
    }

    private static testMethod void testPredicate_FieldNotEquals()
    {
        Predicate predicate = new Filter.FieldNotEqualsPredicate( Lead.Company, 'Foobar Industries' );

        sObject sObjectWithValue = new Lead();
        sObjectWithValue.put( 'Company', 'Foobar Industries' );

        sObject sObjectWithOther = new Lead();
        sObjectWithOther.put( 'Company', 'Intractable Industries' );

        Test.startTest();

            Boolean fieldWithValueNotEquals = predicate.evaluate( sObjectWithValue );
            Boolean fieldWithOtherNotEquals = predicate.evaluate( sObjectWithOther );

        Test.stopTest();

        System.assert( predicate instanceof InsertPredicate,
            'No update test needed' );

        System.assertEquals( false, fieldWithValueNotEquals,
            'A Field with a matching value on insert is considered equal' );
        System.assertEquals( true, fieldWithOtherNotEquals,
            'A Field with a differing value on insert isn\'t considered equal' );
    }

    private static testMethod void testPredicate_FieldIn()
    {
        Predicate predicate = new Filter.FieldInPredicate( Lead.Company, new Set<Object>{ 'Foobar Industries' } );

        sObject sObjectWithValue = new Lead();
        sObjectWithValue.put( 'Company', 'Foobar Industries' );

        sObject sObjectWithOther = new Lead();
        sObjectWithOther.put( 'Company', 'Intractable Industries' );

        Test.startTest();

            Boolean fieldWithValueIn = predicate.evaluate( sObjectWithValue );
            Boolean fieldWithOtherIn = predicate.evaluate( sObjectWithOther );

        Test.stopTest();

        System.assert( predicate instanceof InsertPredicate,
            'No update test needed' );

        System.assertEquals( true, fieldWithValueIn,
            'A Field with a matching value on insert is considered equal' );
        System.assertEquals( false, fieldWithOtherIn,
            'A Field with a differing value on insert isn\'t considered equal' );
    }

    private static testMethod void testHasNoChildren_noChildren()
    {
        Account act = new Account();

        Test.startTest();
            List<sObject> accountsWithNoChildren = Filter.hasChildren( 'Contacts' ).filter( new List<Account>{ act } );
        Test.stopTest();

        System.assertEquals( 0, accountsWithNoChildren.size(), 'This account has a no children, so it should have been filtered out');
    }

    private static testMethod void testHasChildren_noChildren()
    {
        Account act = new Account();

        Test.startTest();
            List<sObject> accountsWithChildren = Filter.hasNoChildren( 'Contacts' ).filter( new List<Account>{ act } );
        Test.stopTest();

        System.assertEquals( 1, accountsWithChildren.size(), 'This account has no children, so it should not have been filtered out');
    }

    private static testMethod void testPredicate_FieldNotIn()
    {
        Predicate predicate = new Filter.FieldNotInPredicate( Lead.Company, new Set<Object>{ 'Foobar Industries' } );

        sObject sObjectWithValue = new Lead();
        sObjectWithValue.put( 'Company', 'Foobar Industries' );

        sObject sObjectWithOther = new Lead();
        sObjectWithOther.put( 'Company', 'Intractable Industries' );

        Test.startTest();

            Boolean fieldWithValueNotIn = predicate.evaluate( sObjectWithValue );
            Boolean fieldWithOtherNotIn = predicate.evaluate( sObjectWithOther );

        Test.stopTest();

        System.assert( predicate instanceof InsertPredicate,
            'No update test needed' );

        System.assertEquals( false, fieldWithValueNotIn,
            'A Field with a matching value on insert is considered equal' );
        System.assertEquals( true, fieldWithOtherNotIn,
            'A Field with a differing value on insert isn\'t considered equal' );
    }

    private static testMethod void testPredicate_FieldNull()
    {
        Predicate predicate = new Filter.FieldNullPredicate( Lead.Company );

        sObject sObjectWithValue = new Lead();
        sObjectWithValue.put( 'Company', 'Foobar Industries' );

        sObject sObjectWithoutValue = new Lead();

        Test.startTest();

            Boolean fieldWithValueNull = predicate.evaluate( sObjectWithValue );
            Boolean fieldWithoutValueNull = predicate.evaluate( sObjectWithoutValue );

        Test.stopTest();

        System.assert( predicate instanceof InsertPredicate,
            'No update test needed' );

        System.assertEquals( false, fieldWithValueNull,
            'A Field with a value on insert is not null' );
        System.assertEquals( true, fieldWithoutValueNull,
            'A Field without a value on insert is null' );
    }

    private static testMethod void testPredicate_FieldNotNull()
    {
        Predicate predicate = new Filter.FieldNotNullPredicate( Lead.Company );

        sObject sObjectWithValue = new Lead();
        sObjectWithValue.put( 'Company', 'Foobar Industries' );

        sObject sObjectWithoutValue = new Lead();

        Test.startTest();

            Boolean fieldWithValueNotNull = predicate.evaluate( sObjectWithValue );
            Boolean fieldWithoutValueNotNull = predicate.evaluate( sObjectWithoutValue );

        Test.stopTest();

        System.assert( predicate instanceof InsertPredicate,
            'No update test needed' );

        System.assertEquals( true, fieldWithValueNotNull,
            'A Field with a value on insert is not null' );
        System.assertEquals( false, fieldWithoutValueNotNull,
            'A Field without a value on insert is null' );
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
