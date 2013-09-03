global class FieldStartsWithPredicate extends InsertPredicate
{
    @TestVisible FieldReference field;
    @TestVisible String value;

    global FieldStartsWithPredicate( FieldReference field, String value )
    {
        this.field = field;
        this.value = value;
    }

    global FieldStartsWithPredicate( Schema.SObjectField field, String value )
    {
        this( FieldReference.build( field ), value );
    }

    global FieldStartsWithPredicate( String field, String value )
    {
        this( FieldReference.build( field ), value );
    }

    global Boolean evaluate( sObject newRecord )
    {
        Object fieldValue = field.getFrom( newRecord );

        return fieldValue != null && String.valueOf( fieldValue ).startsWith( value );
    }
}
