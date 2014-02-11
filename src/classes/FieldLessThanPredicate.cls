global virtual class FieldLessThanPredicate extends InsertPredicate
{
    @TestVisible FieldReference field;
    @TestVisible Object value;

    global FieldLessThanPredicate( FieldReference field, Object value )
    {
        this.field = field;
        this.value = value;
    }

    global FieldLessThanPredicate( Schema.SObjectField field, Object value )
    {
        this( FieldReference.build( field ), value );
    }

    global FieldLessThanPredicate( String field, Object value )
    {
        this( FieldReference.build( field ), value );
    }

    global Boolean evaluate( sObject newRecord )
    {
        PrimitiveComparator comparator = new PrimitiveComparator();
        return comparator.compare( field.getFrom( newRecord ), value ) < 0;
    }
}