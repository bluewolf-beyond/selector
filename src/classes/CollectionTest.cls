@isTest
public class CollectionTest
{
    public static testMethod void testFromIds()
    {
        Set<Id> expected = new Set<Id>{ '006Q000000Bm98F' };

        Test.startTest();
            Set<Object> actualFromX = Collection.fromX( expected );
            Set<Id> actualFromOriginalType = Collection.fromIds( actualFromX );
        Test.stopTest();

        System.assert( expected.containsAll( actualFromOriginalType ) , 'These sets should be identical');
        System.assertEquals( expected.size(), actualFromOriginalType.size(), 'The set size should be identical' );
        System.assertEquals( actualFromX.size(), actualFromOriginalType.size(), 'The set size should be identical');
        for( Id expectedObj : actualFromOriginalType )
        {
            System.assert( actualFromX.contains( expectedObj ), 'The original set should be returned cast to ');
        }
    }

    public static testMethod void testFromStrings()
    {
        Set<String> expected = new Set<String>{'test', 'test2', 'bob'};

        Test.startTest();
            Set<Object> actualFromX = Collection.fromX( expected );
            Set<String> actualFromOriginalType = Collection.fromStrings( actualFromX );
        Test.stopTest();

        System.assert( expected.containsAll( actualFromOriginalType ) , 'These sets should be identical');
        System.assertEquals( expected.size(), actualFromOriginalType.size(), 'The set size should be identical' );
        System.assertEquals( actualFromX.size(), actualFromOriginalType.size(), 'The set size should be identical');
        for( String expectedObj : actualFromOriginalType )
        {
            System.assert( actualFromX.contains( expectedObj ), 'The original set should be returned cast to ');
        }
    }

    public static testMethod void testFromInts()
    {
        Set<Integer> expected = new Set<Integer>{ 2 };

        Test.startTest();
            Set<Object> actualFromX = Collection.fromX( expected );
            Set<Integer> actualFromOriginalType = Collection.fromIntegers( actualFromX );
        Test.stopTest();

        System.assert( expected.containsAll( actualFromOriginalType ) , 'These sets should be identical' );
        System.assertEquals( expected.size(), actualFromOriginalType.size(), 'The set size should be identical' );
        System.assertEquals( actualFromX.size(), actualFromOriginalType.size(), 'The set size should be identical');
        for( Integer expectedObj : actualFromOriginalType )
        {
            System.assert( actualFromX.contains( expectedObj ), 'The original set should be returned cast to ');
        }
    }

    public static testMethod void testFromDates()
    {
        Set<Date> expected = new Set<Date>{ Date.today() };

        Test.startTest();
            Set<Object> actualFromX = Collection.fromX( expected );
            Set<Date> actualFromOriginalType = Collection.fromDates( actualFromX );
        Test.stopTest();

        System.assert( expected.containsAll( actualFromOriginalType ) , 'These sets should be identical');
        System.assertEquals( expected.size(), actualFromOriginalType.size(), 'The set size should be identical' );
        System.assertEquals( actualFromX.size(), actualFromOriginalType.size(), 'The set size should be identical');
        for( Date expectedObj : actualFromOriginalType )
        {
            System.assert( actualFromX.contains( expectedObj ), 'The original set should be returned cast to ');
        }
    }

    public static testMethod void testFromDateTimes()
    {
        Set<DateTime> expected = new Set<DateTime>{ DateTime.now() };

        Test.startTest();
            Set<Object> actualFromX = Collection.fromX( expected );
            Set<DateTime> actualFromOriginalType = Collection.fromDateTimes( actualFromX );
        Test.stopTest();

        System.assert( expected.containsAll( actualFromOriginalType ) , 'These sets should be identical');
        System.assertEquals( expected.size(), actualFromOriginalType.size(), 'The set size should be identical' );
        System.assertEquals( actualFromX.size(), actualFromOriginalType.size(), 'The set size should be identical');
        for( DateTime expectedObj : actualFromOriginalType )
        {
            System.assert( actualFromX.contains( expectedObj ), 'The original set should be returned cast to ');
        }
    }

    public static testMethod void testFromDecimals()
    {
        Set<Decimal> expected = new Set<Decimal>{ 3.1 };

        Test.startTest();
            Set<Object> actualFromX = Collection.fromX( expected );
            Set<Decimal> actualFromOriginalType = Collection.fromDecimals( actualFromX );
        Test.stopTest();

        System.assert( expected.containsAll( actualFromOriginalType ) , 'These sets should be identical');
        System.assertEquals( expected.size(), actualFromOriginalType.size(), 'The set size should be identical' );
        System.assertEquals( actualFromX.size(), actualFromOriginalType.size(), 'The set size should be identical');
        for( Decimal expectedObj : actualFromOriginalType )
        {
            System.assert( actualFromX.contains( expectedObj ), 'The original set should be returned cast to ');
        }
    }

    public static testMethod void testFromDateLongs()
    {
        Set<Long> expected = new Set<Long>{ 33L };

        Test.startTest();
            Set<Object> actualFromX = Collection.fromX( expected );
            Set<Long> actualFromOriginalType = Collection.fromLongs( actualFromX );
        Test.stopTest();

        System.assert( expected.containsAll( actualFromOriginalType ) , 'These sets should be identical');
        System.assertEquals( expected.size(), actualFromOriginalType.size(), 'The set size should be identical' );
        System.assertEquals( actualFromX.size(), actualFromOriginalType.size(), 'The set size should be identical');
        for( Long expectedObj : actualFromOriginalType )
        {
            System.assert( actualFromX.contains( expectedObj ), 'The original set should be returned cast to ');
        }
    }

    public static testMethod void testFromTimes()
    {
        Set<Time> expected = new Set<Time>{ DateTime.now().time() };

        Test.startTest();
            Set<Object> actualFromX = Collection.fromX( expected );
            Set<Time> actualFromOriginalType = Collection.fromTimes( actualFromX );
        Test.stopTest();

        System.assert( expected.containsAll( actualFromOriginalType ) , 'These sets should be identical');
        System.assertEquals( expected.size(), actualFromOriginalType.size(), 'The set size should be identical' );
        System.assertEquals( actualFromX.size(), actualFromOriginalType.size(), 'The set size should be identical');
        for( Time expectedObj : actualFromOriginalType )
        {
            System.assert( actualFromX.contains( expectedObj ), 'The original set should be returned cast to ');
        }
    }

    public static testMethod void testFromDoubles()
    {
        Set<Double> expected = new Set<Double>{ 3.2323 };

        Test.startTest();
            Set<Object> actualFromX = Collection.fromX( expected );
            Set<Double> actualFromOriginalType = Collection.fromDoubles( actualFromX );
        Test.stopTest();

        System.assert( expected.containsAll( actualFromOriginalType ) , 'These sets should be identical');
        System.assertEquals( expected.size(), actualFromOriginalType.size(), 'The set size should be identical' );
        System.assertEquals( actualFromX.size(), actualFromOriginalType.size(), 'The set size should be identical');
        for( Double expectedObj : actualFromOriginalType )
        {
            System.assert( actualFromX.contains( expectedObj ), 'The original set should be returned cast to ');
        }
    }

}