global virtual class FieldEqualsPredicate extends InsertPredicate
{
    @TestVisible FieldReference field;
    @TestVisible Object value;

    global FieldEqualsPredicate( FieldReference field, Object value )
    {
        this.field = field;
        this.value = value;
    }

    global FieldEqualsPredicate( Schema.SObjectField field, Object value )
    {
        this( FieldReference.build( field ), value );
    }

    global FieldEqualsPredicate( String field, Object value )
    {
        this( FieldReference.build( field ), value );
    }

    global Boolean evaluate( sObject newRecord )
    {
        return field.getFrom( newRecord ) == value;
    }
}
