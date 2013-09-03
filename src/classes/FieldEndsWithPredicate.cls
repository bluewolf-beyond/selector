global class FieldEndsWithPredicate extends InsertPredicate
{
    @TestVisible FieldReference field;
    @TestVisible String value;

    global FieldEndsWithPredicate( FieldReference field, String value )
    {
        this.field = field;
        this.value = value;
    }

    global FieldEndsWithPredicate( Schema.SObjectField field, String value )
    {
        this( FieldReference.build( field ), value );
    }

    global FieldEndsWithPredicate( String field, String value )
    {
        this( FieldReference.build( field ), value );
    }

    global Boolean evaluate( sObject newRecord )
    {
        Object fieldValue = field.getFrom( newRecord );

        return fieldValue != null && String.valueOf( fieldValue ).endsWith( value );
    }
}
