@isTest
private class FilterTest
{
    /////////////////////////////////////////////////////////////////
    // standard filter types
    /////////////////////////////////////////////////////////////////

    private static testMethod void testFieldChangedFilter()
    {
        Test.startTest();

            Filter companyChangedFilter = Filter.fieldChanged( Lead.Company );

        Test.stopTest();

        System.assert( companyChangedFilter.predicate instanceof Filter.FieldChangedPredicate,
            'The filter should be of the proper variety' );

        Filter.FieldChangedPredicate predicate = (Filter.FieldChangedPredicate)companyChangedFilter.predicate;
        System.assertEquals( predicate.field, Lead.Company,
            'The field passed in should be the filter field' );
    }

    private static testMethod void testFieldNewFilter()
    {
        Test.startTest();

            Filter companyNewFilter = Filter.fieldNew( Lead.Company );

        Test.stopTest();

        System.assert( companyNewFilter.predicate instanceof Filter.FieldNewPredicate,
            'The filter should be of the proper variety' );

        Filter.FieldNewPredicate predicate = (Filter.FieldNewPredicate)companyNewFilter.predicate;
        System.assertEquals( predicate.field, Lead.Company,
            'The field passed in should be the filter field' );
    }

    private static testMethod void testFieldEqualsFilter()
    {
        final String FILTER_VALUE = 'Foobar';

        Test.startTest();

            Filter companyEqualsFoobarFilter = Filter.fieldEquals( Lead.Company, FILTER_VALUE );

        Test.stopTest();

        System.assert( companyEqualsFoobarFilter.predicate instanceof Filter.FieldEqualsPredicate,
            'The filter should be of the proper variety' );

        Filter.FieldEqualsPredicate predicate = (Filter.FieldEqualsPredicate)companyEqualsFoobarFilter.predicate;
        System.assertEquals( predicate.field, Lead.Company,
            'The field passed in should be the filter field' );
        System.assertEquals( predicate.value, FILTER_VALUE,
            'The value passed in should be the filter value' );
    }

    private static testMethod void testFieldNotEqualsFilter()
    {
        final String FILTER_VALUE = 'Foobar';

        Test.startTest();

            Filter companyNotEqualsFoobarFilter = Filter.fieldNotEquals( Lead.Company, FILTER_VALUE );

        Test.stopTest();

        System.assert( companyNotEqualsFoobarFilter.predicate instanceof Filter.FieldNotEqualsPredicate,
            'The filter should be of the proper variety' );

        Filter.FieldNotEqualsPredicate predicate = (Filter.FieldNotEqualsPredicate)companyNotEqualsFoobarFilter.predicate;
        System.assertEquals( predicate.field, Lead.Company,
            'The field passed in should be the filter field' );
        System.assertEquals( predicate.value, FILTER_VALUE,
            'The value passed in should be the filter value' );
    }

    private static testMethod void testFieldNullFilter()
    {
        Test.startTest();

            Filter companyNullFilter = Filter.fieldNull( Lead.Company );

        Test.stopTest();

        System.assert( companyNullFilter.predicate instanceof Filter.FieldNullPredicate,
            'The filter should be of the proper variety' );

        Filter.FieldNullPredicate predicate = (Filter.FieldNullPredicate)companyNullFilter.predicate;
        System.assertEquals( predicate.field, Lead.Company,
            'The field passed in should be the filter field' );
    }

    private static testMethod void testFieldNotNullFilter()
    {
        Test.startTest();

            Filter companyNotNullFilter = Filter.fieldNotNull( Lead.Company );

        Test.stopTest();

        System.assert( companyNotNullFilter.predicate instanceof Filter.FieldNotNullPredicate,
            'The filter should be of the proper variety' );

        Filter.FieldNotNullPredicate predicate = (Filter.FieldNotNullPredicate)companyNotNullFilter.predicate;
        System.assertEquals( predicate.field, Lead.Company,
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
        Filter.Predicate left = new ConstantPredicate( false );
        Filter.Predicate right = new ConstantPredicate( true );

        Test.startTest();

            Filter leftAndRight = new Filter( left ).andx( new Filter( right ) );
            Filter rightAndLeft = new Filter( right ).andx( new Filter( left ) );

        Test.stopTest();

        System.assert( leftAndRight.predicate instanceof Filter.AndPredicate,
            'The filter and operation should return an and predicate' );
        Filter.AndPredicate andPredicate = (Filter.AndPredicate)leftAndRight.predicate;
        System.assertEquals( left, andPredicate.left, 'the predicates should be the children' );
        System.assertEquals( right, andPredicate.right, 'the predicates should be the children' );

        System.assert( rightAndLeft.predicate instanceof Filter.AndPredicate,
            'The filter and operation should return an and predicate' );
        andPredicate = (Filter.AndPredicate)rightAndLeft.predicate;
        System.assertEquals( right, andPredicate.left, 'the predicates should be the children' );
        System.assertEquals( left, andPredicate.right, 'the predicates should be the children' );
    }

    private static testMethod void testFilter_orx()
    {
        Filter.Predicate left = new ConstantPredicate( false );
        Filter.Predicate right = new ConstantPredicate( true );

        Test.startTest();

            Filter leftOrRight = new Filter( left ).orx( new Filter( right ) );
            Filter rightOrLeft = new Filter( right ).orx( new Filter( left ) );

        Test.stopTest();

        System.assert( leftOrRight.predicate instanceof Filter.OrPredicate,
            'The filter or operation should return an or predicate' );
        Filter.OrPredicate orPredicate = (Filter.OrPredicate)leftOrRight.predicate;
        System.assertEquals( left, orPredicate.left, 'the predicates should be the children' );
        System.assertEquals( right, orPredicate.right, 'the predicates should be the children' );

        System.assert( rightOrLeft.predicate instanceof Filter.OrPredicate,
            'The filter or operation should return an or predicate' );
        orPredicate = (Filter.OrPredicate)rightOrLeft.predicate;
        System.assertEquals( right, orPredicate.left, 'the predicates should be the children' );
        System.assertEquals( left, orPredicate.right, 'the predicates should be the children' );
    }

    /////////////////////////////////////////////////////////////////
    // standard Predicates
    /////////////////////////////////////////////////////////////////

    private static testMethod void testPredicate_FieldChanged_Insert()
    {
        Filter.Predicate predicate = new Filter.FieldChangedPredicate( Lead.Company );

        sObject sObjectWithValue = new Lead();
        sObjectWithValue.put( 'Company', 'Foobar Industries' );

        sObject sObjectWithoutValue = new Lead();

        Test.startTest();

            Boolean fieldWithValueChanged = predicate.evaluate( sObjectWithValue );
            Boolean fieldWithoutValueChanged = predicate.evaluate( sObjectWithoutValue );

        Test.stopTest();

        System.assertEquals( true, fieldWithValueChanged,
            'A Field with a value on insert is considered changed' );
        System.assertEquals( false, fieldWithoutValueChanged,
            'A Field without a value on insert isn\'t considered changed' );
    }

    private static testMethod void testPredicate_FieldChanged_Update()
    {
        Filter.Predicate predicate = new Filter.FieldChangedPredicate( Lead.Company );

        sObject sObjectOriginal = new Lead();
        sObjectOriginal.put( 'Company', 'Foobar Industries' );

        sObject sObjectWithOldValue = new Lead();
        sObjectWithOldValue.put( 'Company', 'Foobar Industries' );

        sObject sObjectWithNewValue = new Lead();
        sObjectWithNewValue.put( 'Company', 'Intractable Industries' );

        Test.startTest();

            Boolean fieldWithOldValueChanged = predicate.evaluate( sObjectWithOldValue, sObjectOriginal );
            Boolean fieldWithNewValueChanged = predicate.evaluate( sObjectWithNewValue, sObjectOriginal );

        Test.stopTest();

        System.assertEquals( false, fieldWithOldValueChanged,
            'A Field with the original value on update isn\'t considered changed' );
        System.assertEquals( true, fieldWithNewValueChanged,
            'A Field with a new value on update isn\'t considered changed' );
    }

    private static testMethod void testPredicate_FieldNew_Insert()
    {
        Filter.Predicate predicate = new Filter.FieldNewPredicate( Lead.Company );

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
        Filter.Predicate predicate = new Filter.FieldNewPredicate( Lead.Company );

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
        Filter.Predicate predicate = new Filter.FieldEqualsPredicate( Lead.Company, 'Foobar Industries' );

        sObject sObjectWithValue = new Lead();
        sObjectWithValue.put( 'Company', 'Foobar Industries' );

        sObject sObjectWithOther = new Lead();
        sObjectWithOther.put( 'Company', 'Intractable Industries' );

        Test.startTest();

            Boolean fieldWithValueEquals = predicate.evaluate( sObjectWithValue );
            Boolean fieldWithOtherEquals = predicate.evaluate( sObjectWithOther );

        Test.stopTest();

        System.assert( predicate instanceof Filter.InsertPredicate,
            'No update test needed' );

        System.assertEquals( true, fieldWithValueEquals,
            'A Field with a matching value on insert is considered equal' );
        System.assertEquals( false, fieldWithOtherEquals,
            'A Field with a differing value on insert isn\'t considered equal' );
    }

    private static testMethod void testPredicate_FieldNotEquals()
    {
        Filter.Predicate predicate = new Filter.FieldNotEqualsPredicate( Lead.Company, 'Foobar Industries' );

        sObject sObjectWithValue = new Lead();
        sObjectWithValue.put( 'Company', 'Foobar Industries' );

        sObject sObjectWithOther = new Lead();
        sObjectWithOther.put( 'Company', 'Intractable Industries' );

        Test.startTest();

            Boolean fieldWithValueNotEquals = predicate.evaluate( sObjectWithValue );
            Boolean fieldWithOtherNotEquals = predicate.evaluate( sObjectWithOther );

        Test.stopTest();

        System.assert( predicate instanceof Filter.InsertPredicate,
            'No update test needed' );

        System.assertEquals( false, fieldWithValueNotEquals,
            'A Field with a matching value on insert is considered equal' );
        System.assertEquals( true, fieldWithOtherNotEquals,
            'A Field with a differing value on insert isn\'t considered equal' );
    }

    private static testMethod void testPredicate_FieldNull()
    {
        Filter.Predicate predicate = new Filter.FieldNullPredicate( Lead.Company );

        sObject sObjectWithValue = new Lead();
        sObjectWithValue.put( 'Company', 'Foobar Industries' );

        sObject sObjectWithoutValue = new Lead();

        Test.startTest();

            Boolean fieldWithValueNull = predicate.evaluate( sObjectWithValue );
            Boolean fieldWithoutValueNull = predicate.evaluate( sObjectWithoutValue );

        Test.stopTest();

        System.assert( predicate instanceof Filter.InsertPredicate,
            'No update test needed' );

        System.assertEquals( false, fieldWithValueNull,
            'A Field with a value on insert is not null' );
        System.assertEquals( true, fieldWithoutValueNull,
            'A Field without a value on insert is null' );
    }

    private static testMethod void testPredicate_FieldNotNull()
    {
        Filter.Predicate predicate = new Filter.FieldNotNullPredicate( Lead.Company );

        sObject sObjectWithValue = new Lead();
        sObjectWithValue.put( 'Company', 'Foobar Industries' );

        sObject sObjectWithoutValue = new Lead();

        Test.startTest();

            Boolean fieldWithValueNotNull = predicate.evaluate( sObjectWithValue );
            Boolean fieldWithoutValueNotNull = predicate.evaluate( sObjectWithoutValue );

        Test.stopTest();

        System.assert( predicate instanceof Filter.InsertPredicate,
            'No update test needed' );

        System.assertEquals( true, fieldWithValueNotNull,
            'A Field with a value on insert is not null' );
        System.assertEquals( false, fieldWithoutValueNotNull,
            'A Field without a value on insert is null' );
    }

    private static testMethod void testPredicate_And()
    {
        Filter.Predicate yes = new ConstantPredicate( true );
        Filter.Predicate no = new ConstantPredicate( false );

        Filter.Predicate yesAndYes = new Filter.AndPredicate( yes, yes );
        Filter.Predicate yesAndNo = new Filter.AndPredicate( no, yes );
        Filter.Predicate noAndYes = new Filter.AndPredicate( yes, no );
        Filter.Predicate noAndNo = new Filter.AndPredicate( no, no );

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

    private static testMethod void testPredicate_Or()
    {
        Filter.Predicate yes = new ConstantPredicate( true );
        Filter.Predicate no = new ConstantPredicate( false );

        Filter.Predicate yesOrYes = new Filter.OrPredicate( yes, yes );
        Filter.Predicate yesOrNo = new Filter.OrPredicate( no, yes );
        Filter.Predicate noOrYes = new Filter.OrPredicate( yes, no );
        Filter.Predicate noOrNo = new Filter.OrPredicate( no, no );

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

    /////////////////////////////////////////////////////////////////
    // test predicates
    /////////////////////////////////////////////////////////////////

    private class CompanyMatcher implements Filter.Predicate
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

    private class ConstantPredicate extends Filter.InsertPredicate
    {
        Boolean value;

        ConstantPredicate( Boolean value )
        {
            this.value = value;
        }

        public Boolean evaluate( sObject newRecord )
        {
            return value;
        }
    }
}
