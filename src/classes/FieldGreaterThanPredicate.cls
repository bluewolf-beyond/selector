global virtual class FieldGreaterThanPredicate extends InsertPredicate
{
    @TestVisible FieldReference field;
    @TestVisible Object value;

    global FieldGreaterThanPredicate( FieldReference field, Object value )
    {
        this.field = field;
        this.value = value;
    }

    global FieldGreaterThanPredicate( Schema.SObjectField field, Object value )
    {
        this( FieldReference.build( field ), value );
    }

    global FieldGreaterThanPredicate( String field, Object value )
    {
        this( FieldReference.build( field ), value );
    }

    global Boolean evaluate( sObject newRecord )
    {
        PrimitiveComparator comparator = new PrimitiveComparator();
        return comparator.compare( field.getFrom( newRecord ), value ) > 0;
    }
}