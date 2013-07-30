global virtual class FieldNullPredicate extends FieldEqualsPredicate
{
    global FieldNullPredicate( Schema.SObjectField field )
    {
        super( field, null );
    }

    global FieldNullPredicate( String field )
    {
        super( field, null );
    }
}
