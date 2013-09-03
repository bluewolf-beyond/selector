global class FieldContainsPredicate extends InsertPredicate
{
    @TestVisible FieldReference field;
    @TestVisible String value;

    global FieldContainsPredicate( FieldReference field, String value )
    {
        this.field = field;
        this.value = value;
    }

    global FieldContainsPredicate( Schema.SObjectField field, String value )
    {
        this( FieldReference.build( field ), value );
    }

    global FieldContainsPredicate( String field, String value )
    {
        this( FieldReference.build( field ), value );
    }

    global Boolean evaluate( sObject newRecord )
    {
        Object fieldValue = field.getFrom( newRecord );

        return fieldValue != null && String.valueOf( fieldValue ).contains( value );
    }
}
