global class Field
{
    global static Filter changed( Schema.SObjectField field )
    {
        return new Filter( new FieldChangedPredicate( field ) );
    }

    global static Filter changed( String field )
    {
        return new Filter( new FieldChangedPredicate( field ) );
    }

    global static Filter isNew( Schema.SObjectField field )
    {
        return new Filter( new FieldNewPredicate( field ) );
    }

    global static Filter isNew( String field )
    {
        return new Filter( new FieldNewPredicate( field ) );
    }

    global static Filter equals( Schema.SObjectField field, Object value )
    {
        return new Filter( new FieldEqualsPredicate( field, value ) );
    }

    global static Filter equals( String field, Object value )
    {
        return new Filter( new FieldEqualsPredicate( field, value ) );
    }

    global static Filter notEquals( Schema.SObjectField field, Object value )
    {
        return equals( field, value ).notx();
    }

    global static Filter notEquals( String field, Object value )
    {
        return equals( field, value ).notx();
    }

    global static Filter isIn( Schema.SObjectField field, Set<Object> values )
    {
        return new Filter( new FieldInPredicate( field, values ) );
    }

    global static Filter isIn( String field, Set<Object> values )
    {
        return new Filter( new FieldInPredicate( field, values ) );
    }

    global static Filter notIn( Schema.SObjectField field, Set<Object> values )
    {
        return isIn( field, values ).notx();
    }

    global static Filter notIn( String field, Set<Object> values )
    {
        return isIn( field, values ).notx();
    }

    global static Filter isNull( Schema.SObjectField field )
    {
        return new Filter( new FieldNullPredicate( field ) );
    }

    global static Filter isNull( String field )
    {
        return new Filter( new FieldNullPredicate( field ) );
    }

    global static Filter notNull( Schema.SObjectField field )
    {
        return isNull( field ).notx();
    }

    global static Filter notNull( String field )
    {
        return isNull( field ).notx();
    }
}
