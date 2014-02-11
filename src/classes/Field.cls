/*
 * Field class
 *
 * Factory methods for field-related Filters.
 *
 * Named so to confrom to the API:
 *   Select.Field.hasChanged( field )
 */
global class Field
{
    global static Filter hasChanged( Schema.SObjectField field )
    {
        return new Filter( new FieldChangedPredicate( field ) );
    }

    global static Filter hasChanged( String field )
    {
        return new Filter( new FieldChangedPredicate( field ) );
    }

    global static Filter notChanged( Schema.SObjectField field )
    {
        return hasChanged( field ).notx();
    }

    global static Filter notChanged( String field )
    {
        return hasChanged( field ).notx();
    }

    global static Filter isNew( Schema.SObjectField field )
    {
        return new Filter( new FieldNewPredicate( field ) );
    }

    global static Filter isNew( String field )
    {
        return new Filter( new FieldNewPredicate( field ) );
    }

    global static Filter notNew( Schema.SObjectField field )
    {
        return isNew( field ).notx();
    }

    global static Filter notNew( String field )
    {
        return isNew( field ).notx();
    }

    global static Filter hasChildren( String field )
    {
        return new Filter( new HasChildrenPredicate( field ) );
    }

    global static Filter hasNoChildren( String field )
    {
        return hasChildren( field ).notx();
    }

    global static Filter isEqual( Schema.SObjectField field, Object value )
    {
        return new Filter( new FieldEqualsPredicate( field, value ) );
    }

    global static Filter isEqual( String field, Object value )
    {
        return new Filter( new FieldEqualsPredicate( field, value ) );
    }

    global static Filter notEqual( Schema.SObjectField field, Object value )
    {
        return isEqual( field, value ).notx();
    }

    global static Filter notEqual( String field, Object value )
    {
        return isEqual( field, value ).notx();
    }

    global static Filter isIn( Schema.SObjectField field, Set<Object> values )
    {
        return new Filter( new FieldInPredicate( field, values ) );
    }

    global static Filter isIn( String field, Set<Object> values )
    {
        return new Filter( new FieldInPredicate( field, values ) );
    }

    global static Filter isIn( Schema.SObjectField field, List<Object> values )
    {
        return new Filter( new FieldInPredicate( field, new Set<Object>( values ) ) );
    }

    global static Filter isIn( String field, List<Object> values )
    {
        return new Filter( new FieldInPredicate( field, new Set<Object>( values ) ) );
    }

    global static Filter notIn( Schema.SObjectField field, Set<Object> values )
    {
        return isIn( field, values ).notx();
    }

    global static Filter notIn( String field, Set<Object> values )
    {
        return isIn( field, values ).notx();
    }

    global static Filter notIn( Schema.SObjectField field, List<Object> values )
    {
        return isIn( field, values ).notx();
    }

    global static Filter notIn( String field, List<Object> values )
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

    global static Filter startsWith( Schema.SObjectField field, String value )
    {
        return new Filter( new FieldStartsWithPredicate( field, value ) );
    }

    global static Filter startsWith( String field, String value )
    {
        return new Filter( new FieldStartsWithPredicate( field, value ) );
    }

    global static Filter endsWith( Schema.SObjectField field, String value )
    {
        return new Filter( new FieldEndsWithPredicate( field, value ) );
    }

    global static Filter endsWith( String field, String value )
    {
        return new Filter( new FieldEndsWithPredicate( field, value ) );
    }

    global static Filter contains( Schema.SObjectField field, String value )
    {
        return new Filter( new FieldContainsPredicate( field, value ) );
    }

    global static Filter contains( String field, String value )
    {
        return new Filter( new FieldContainsPredicate( field, value ) );
    }
    
    global static Filter lessThan( String field, Object value )
    {
        return new Filter( new FieldLessThanPredicate(field, value) );
    }

    global static Filter lessThan( Schema.SObjectField field, Object value )
    {
        return new Filter( new FieldLessThanPredicate(field, value) );
    }

    global static Filter greaterThan( String field, Object value )
    {
        return new Filter( new FieldGreaterThanPredicate(field, value) );
    }

    global static Filter greaterThan( Schema.SObjectField field, Object value )
    {
        return new Filter( new FieldGreaterThanPredicate(field, value) );
    }    
}
