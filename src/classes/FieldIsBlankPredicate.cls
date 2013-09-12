global virtual class FieldIsBlankPredicate extends InsertPredicate
{
    @TestVisible FieldReference field;

    global FieldIsBlankPredicate( Schema.SObjectField field )
    {
        this.field = FieldReference.build( field );
    }

    global FieldIsBlankPredicate( String field )
    {
        this.field = FieldReference.build( field );
    }

    global Boolean evaluate( sObject newRecord )
    {
        return String.isBlank( (String)field.getFrom( newRecord ) );
    }
}