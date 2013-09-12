public class Collection
{
    public static List<Object> fromX( List<Id> objs )
    {
        List<Object> objects = new List<Object>();
        for( Object obj : objs )
        {
            objects.add( obj );
        }
        return objects;
    }

    public static List<Id> fromIds( List<Object> objs )
    {
        List<Id> objects = new List<Id>();
        for( Object obj : objs )
        {
            objects.add( (Id)obj );
        }
        return objects;
    }

    public static List<Object> fromX( List<String> objs )
    {
        List<Object> objects = new List<Object>();
        for( Object obj : objs )
        {
            objects.add( obj );
        }
        return objects;
    }

    public static List<String> fromStrings( List<Object> objs )
    {
        List<String> objects = new List<String>();
        for( Object obj : objs )
        {
            objects.add( (String)obj );
        }
        return objects;
    }

    public static List<Object> fromX( List<Integer> objs )
    {
        List<Object> objects = new List<Object>();
        for( Object obj : objs )
        {
            objects.add( obj );
        }
        return objects;
    }

    public static List<Integer> fromIntegers( List<Object> objs )
    {
        List<Integer> objects = new List<Integer>();
        for( Object obj : objs )
        {
            objects.add( (Integer)obj );
        }
        return objects;
    }

    public static List<Object> fromX( List<Date> objs )
    {
        List<Object> objects = new List<Object>();
        for( Object obj : objs )
        {
            objects.add( obj );
        }
        return objects;
    }

    public static List<Date> fromDates( List<Object> objs )
    {
        List<Date> objects = new List<Date>();
        for( Object obj : objs )
        {
            objects.add( (Date)obj );
        }
        return objects;
    }

    public static List<Object> fromX( List<DateTime> objs )
    {
        List<Object> objects = new List<Object>();
        for( Object obj : objs )
        {
            objects.add( obj );
        }
        return objects;
    }

    public static List<DateTime> fromDateTimes( List<Object> objs )
    {
        List<DateTime> objects = new List<DateTime>();
        for( Object obj : objs )
        {
            objects.add( (DateTime)obj );
        }
        return objects;
    }

    public static List<Object> fromX( List<Decimal> objs )
    {
        List<Object> objects = new List<Object>();
        for( Object obj : objs )
        {
            objects.add( obj );
        }
        return objects;
    }

    public static List<Decimal> fromDecimals( List<Object> objs )
    {
        List<Decimal> objects = new List<Decimal>();
        for( Object obj : objs )
        {
            objects.add( (Decimal)obj );
        }
        return objects;
    }

    public static List<Object> fromX( List<Long> objs )
    {
        List<Object> objects = new List<Object>();
        for( Object obj : objs )
        {
            objects.add( obj );
        }
        return objects;
    }

    public static List<Long> fromLongs( List<Object> objs )
    {
        List<Long> objects = new List<Long>();
        for( Object obj : objs )
        {
            objects.add( (Long)obj );
        }
        return objects;
    }

    public static List<Object> fromX( List<Time> objs )
    {
        List<Object> objects = new List<Object>();
        for( Object obj : objs )
        {
            objects.add( obj );
        }
        return objects;
    }

    public static List<Time> fromTimes( List<Object> objs )
    {
        List<Time> objects = new List<Time>();
        for( Object obj : objs )
        {
            objects.add( (Time)obj );
        }
        return objects;
    }

    public static List<Object> fromX( List<Double> objs )
    {
        List<Object> objects = new List<Object>();
        for( Object obj : objs )
        {
            objects.add( obj );
        }
        return objects;
    }

    public static List<Double> fromDoubles( List<Object> objs )
    {
        List<Double> objects = new List<Double>();
        for( Object obj : objs )
        {
            objects.add( (Double)obj );
        }
        return objects;
    }


    /******/
    public static Set<Object> fromX( Set<Id> objs ){ return new Set<Object>( fromX( new List<Id>( objs) ) ); }
    public static Set<Object> fromX( Set<String> objs ){ return new Set<Object>( fromX( new List<String>( objs ) ) ); }
    public static Set<Object> fromX( Set<Integer> objs ){ return new Set<Object>( fromX( new List<Integer>( objs ) ) ); }
    public static Set<Object> fromX( Set<Date> objs) { return new Set<Object>( fromX( new List<Date>( objs ) ) ); }
    public static Set<Object> fromX( Set<DateTime> objs ){ return new Set<Object>( fromX( new List<DateTime>( objs ) ) ); }
    public static Set<Object> fromX( Set<Decimal> objs ){ return new Set<Object>( fromX( new List<Decimal>( objs ) ) ); }
    public static Set<Object> fromX( Set<Long> objs ){ return new Set<Object>( fromX( new List<Long>( objs ) ) ); }
    public static Set<Object> fromX( Set<Time> objs ){ return new Set<Object>( fromX( new List<Time>( objs ) ) ); }
    public static Set<Object> fromX( Set<Double> objs ){ return new Set<Object>( fromX( new List<Double>( objs ) ) ); }


    public static Set<Id> fromIds( Set<Object> objs ) { return new Set<Id>( fromIds( new List<Object>( objs ) ) ); }
    public static Set<String> fromStrings( Set<Object> objs ) { return new Set<String>( fromStrings( new List<Object>( objs ) ) ); } 
    public static Set<Integer> fromIntegers( Set<Object> objs ) { return new Set<Integer>( fromIntegers( new List<Object>( objs ) ) ); }
    public static Set<Date> fromDates( Set<Object> objs ) { return new Set<Date>( fromDates( new List<Object>( objs ) ) ); }
    public static Set<DateTime> fromDateTimes( Set<Object> objs ) { return new Set<DateTime>( fromDateTimes( new List<Object>( objs ) ) ); }
    public static Set<Decimal> fromDecimals( Set<Object> objs ) { return new Set<Decimal>( fromDecimals( new List<Object>( objs ) ) ); }
    public static Set<Long> fromLongs( Set<Object> objs ) { return new Set<Long>( fromLongs( new List<Object>( objs ) ) ); }
    public static Set<Time> fromTimes( Set<Object> objs ) { return new Set<Time>( fromTimes( new List<Object>( objs ) ) ); }
    public static Set<Double> fromDoubles( Set<Object> objs ) { return new Set<Double>( fromDoubles( new List<Object>( objs ) ) ); }
}