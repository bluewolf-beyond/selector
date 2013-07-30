global class Field
{
    global static Filter fieldChanged( Schema.SObjectField field )
    {
        return new Filter( new FieldChangedPredicate( field ) );
    }

    global static Filter fieldChanged( String field )
    {
        return new Filter( new FieldChangedPredicate( field ) );
    }

    global static Filter fieldNew( Schema.SObjectField field )
    {
        return new Filter( new FieldNewPredicate( field ) );
    }

    global static Filter fieldNew( String field )
    {
        return new Filter( new FieldNewPredicate( field ) );
    }

    global static Filter fieldEquals( Schema.SObjectField field, Object value )
    {
        return new Filter( new FieldEqualsPredicate( field, value ) );
    }

    global static Filter fieldEquals( String field, Object value )
    {
        return new Filter( new FieldEqualsPredicate( field, value ) );
    }

    global static Filter fieldNotEquals( Schema.SObjectField field, Object value )
    {
        return fieldEquals( field, value ).notx();
    }

    global static Filter fieldNotEquals( String field, Object value )
    {
        return fieldEquals( field, value ).notx();
    }

    global static Filter fieldIn( Schema.SObjectField field, Set<Object> values )
    {
        return new Filter( new FieldInPredicate( field, values ) );
    }

    global static Filter fieldIn( String field, Set<Object> values )
    {
        return new Filter( new FieldInPredicate( field, values ) );
    }

    global static Filter fieldNotIn( Schema.SObjectField field, Set<Object> values )
    {
        return fieldIn( field, values ).notx();
    }

    global static Filter fieldNotIn( String field, Set<Object> values )
    {
        return fieldIn( field, values ).notx();
    }

    global static Filter fieldNull( Schema.SObjectField field )
    {
        return new Filter( new FieldNullPredicate( field ) );
    }

    global static Filter fieldNull( String field )
    {
        return new Filter( new FieldNullPredicate( field ) );
    }

    global static Filter fieldNotNull( Schema.SObjectField field )
    {
        return fieldNull( field ).notx();
    }

    global static Filter fieldNotNull( String field )
    {
        return fieldNull( field ).notx();
    }
}
