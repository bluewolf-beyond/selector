global virtual class FieldNewPredicate implements Predicate
{
    @TestVisible FieldReference field;

    global FieldNewPredicate( Schema.SObjectField field )
    {
        this.field = FieldReference.build( field );
    }

    global FieldNewPredicate( String field )
    {
        this.field = FieldReference.build( field );
    }

    global Boolean evaluate( sObject newRecord )
    {
        return field.getFrom( newRecord ) != null;
    }

    global Boolean evaluate( sObject newRecord, sObject oldRecord )
    {
        return field.getFrom( newRecord ) != null &&
               field.getFrom( oldRecord ) == null;
    }
}
