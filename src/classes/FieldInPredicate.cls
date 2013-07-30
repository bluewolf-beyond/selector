global virtual class FieldInPredicate extends InsertPredicate
{
    @TestVisible FieldReference field;
    @TestVisible Set<Object> values;

    global FieldInPredicate( FieldReference field, Set<Object> values )
    {
        this.field = field;
        this.values = values;
    }

    global FieldInPredicate( Schema.SObjectField field, Set<Object> values )
    {
        this( FieldReference.build( field ), values );
    }

    global FieldInPredicate( String field, Set<Object> values )
    {
        this( FieldReference.build( field ), values );
    }

    global Boolean evaluate( sObject newRecord )
    {
        return values.contains( field.getFrom( newRecord ) );
    }
}
