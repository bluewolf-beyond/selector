global virtual class FieldChangedPredicate implements Predicate
{
    @TestVisible FieldReference field;

    global FieldChangedPredicate( Schema.SObjectField field )
    {
        this.field = FieldReference.build( field );
    }

    global FieldChangedPredicate( String field )
    {
        this.field = FieldReference.build( field );
    }

    global Boolean evaluate( sObject newRecord )
    {
        return field.getFrom( newRecord ) != null;
    }

    global Boolean evaluate( sObject newRecord, sObject oldRecord )
    {
        return field.getFrom( newRecord ) != field.getFrom( oldRecord );
    }
}
