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

    // isIn Schema.sObjectField, Set<Object>
    global static Filter isIn( Schema.SObjectField field, Set<Object> values )
    {
        return new Filter( new FieldInPredicate( field, values ) );
    }

    global static Filter isIn( Schema.SObjectField field, Set<String> values )
    {
        return new Filter( new FieldInPredicate( field, new Set<Object>( ((List<Object>)new List<String>(values) ) )  ) );
    }
    
    global static Filter isIn( Schema.SObjectField field, Set<Integer> values )
    {
        return new Filter( new FieldInPredicate( field, new Set<Object>( ((List<Object>)new List<Integer>(values) ) )  ) );
    }
    
    global static Filter isIn( Schema.SObjectField field, Set<Decimal> values )
    {
        return new Filter( new FieldInPredicate( field, new Set<Object>( ((List<Object>)new List<Decimal>(values) ) )  ) );
    }
    
    global static Filter isIn( Schema.SObjectField field, Set<Date> values )
    {
        return new Filter( new FieldInPredicate( field, new Set<Object>( ((List<Object>)new List<Date>(values) ) )  ) );
    }
    
    global static Filter isIn( Schema.SObjectField field, Set<DateTime> values )
    {
        return new Filter( new FieldInPredicate( field, new Set<Object>( ((List<Object>)new List<DateTime>(values) ) )  ) );
    }
    
    global static Filter isIn( Schema.SObjectField field, Set<Id> values )
    {
        return new Filter( new FieldInPredicate( field, new Set<Object>( ((List<Object>)new List<Id>(values) ) )  ) );
    }
    // end isIn Schema.sObjectField, Set<Object>

    // isIn String, Set<Object>
    global static Filter isIn( String field, Set<Object> values )
    {
        return new Filter( new FieldInPredicate( field, values ) );
    }

    global static Filter isIn( String field, Set<String> values )
    {
        return new Filter( new FieldInPredicate( field, new Set<Object>( ((List<Object>)new List<String>(values) ) )  ) );
    }
    
    global static Filter isIn( String field, Set<Integer> values )
    {
        return new Filter( new FieldInPredicate( field, new Set<Object>( ((List<Object>)new List<Integer>(values) ) )  ) );
    }
    
    global static Filter isIn( String field, Set<Decimal> values )
    {
        return new Filter( new FieldInPredicate( field, new Set<Object>( ((List<Object>)new List<Decimal>(values) ) )  ) );
    }
    
    global static Filter isIn( String field, Set<Date> values )
    {
        return new Filter( new FieldInPredicate( field, new Set<Object>( ((List<Object>)new List<Date>(values) ) )  ) );
    }
    
    global static Filter isIn( String field, Set<DateTime> values )
    {
        return new Filter( new FieldInPredicate( field, new Set<Object>( ((List<Object>)new List<DateTime>(values) ) )  ) );
    }
    
    global static Filter isIn( String field, Set<Id> values )
    {
        return new Filter( new FieldInPredicate( field, new Set<Object>( ((List<Object>)new List<Id>(values) ) )  ) );
    }
    // end isIn String, Set<Object>    

    // isIn Schema.SObjectField, List<Object>
    global static Filter isIn( Schema.SObjectField field, List<Object> values )
    {
        return new Filter( new FieldInPredicate( field, new Set<Object>( values ) ) );
    }
    
    global static Filter isIn( Schema.SObjectField field, List<String> values )
    {
        return isIn(field, (List<Object>)values );
    }

    global static Filter isIn( Schema.SObjectField field, List<Id> values )
    {
        return isIn(field, (List<Object>)values );
    }

    global static Filter isIn( Schema.SObjectField field, List<Decimal> values )
    {
        return isIn(field, (List<Object>)values );
    }

    global static Filter isIn( Schema.SObjectField field, List<Integer> values )
    {
        return isIn(field, (List<Object>)values );
    }

    global static Filter isIn( Schema.SObjectField field, List<Date> values )
    {
        return isIn(field, (List<Object>)values );
    }

    global static Filter isIn( Schema.SObjectField field, List<DateTime> values )
    {
        return isIn(field, (List<Object>)values );
    }
    // end isIn Schema.SObjectField, List<Object>

    // isIn String, List<Object>
    global static Filter isIn( String field, List<Object> values )
    {
        return new Filter( new FieldInPredicate( field, new Set<Object>( values ) ) );
    }

    global static Filter isIn( String field, List<String> values )
    {
        return isIn(field, (List<Object>)values );
    }

    global static Filter isIn( String field, List<Id> values )
    {
        return isIn(field, (List<Object>)values );
    }

    global static Filter isIn( String field, List<Decimal> values )
    {
        return isIn(field, (List<Object>)values );
    }

    global static Filter isIn( String field, List<Integer> values )
    {
        return isIn(field, (List<Object>)values );
    }

    global static Filter isIn( String field, List<Date> values )
    {
        return isIn(field, (List<Object>)values );
    }

    global static Filter isIn( String field, List<DateTime> values )
    {
        return isIn(field, (List<Object>)values );
    }
    // end isIn String, List<Object>

    // notIn Schema.SObjectField, Set<Object>
    global static Filter notIn( Schema.SObjectField field, Set<Object> values )
    {
        return isIn( field, values ).notx();
    }
    
    global static Filter notIn( Schema.SObjectField field, Set<String> values )
    {
        return isIn(field, new Set<Object>( ((List<Object>)new List<String>(values) ) ) ).notx();
    }

    global static Filter notIn( Schema.SObjectField field, Set<Id> values )
    {
        return isIn(field, new Set<Object>( ((List<Object>)new List<Id>(values) ) ) ).notx();
    }

    global static Filter notIn( Schema.SObjectField field, Set<Decimal> values )
    {
        return isIn(field, new Set<Object>( ((List<Object>)new List<Decimal>(values) ) ) ).notx();
    }

    global static Filter notIn( Schema.SObjectField field, Set<Integer> values )
    {
        return isIn(field, new Set<Object>( ((List<Object>)new List<Integer>(values) ) ) ).notx();
    }

    global static Filter notIn( Schema.SObjectField field, Set<Date> values )
    {
        return isIn(field, new Set<Object>( ((List<Object>)new List<Date>(values) ) ) ).notx();
    }

    global static Filter notIn( Schema.SObjectField field, Set<DateTime> values )
    {
        return isIn(field, new Set<Object>( ((List<Object>)new List<DateTime>(values) ) ) ).notx();
    }
    // end notIn Schema.SObjectField, Set<Object>

    // notIn String, Set<Object>
    global static Filter notIn( String field, Set<Object> values )
    {
        return isIn( field, values ).notx();
    }
    
    global static Filter notIn( String field, Set<String> values )
    {
        return isIn(field, new Set<Object>( ((List<Object>)new List<String>(values) ) ) ).notx();
    }

    global static Filter notIn( String field, Set<Id> values )
    {
        return isIn(field, new Set<Object>( ((List<Object>)new List<Id>(values) ) ) ).notx();
    }

    global static Filter notIn( String field, Set<Decimal> values )
    {
        return isIn(field, new Set<Object>( ((List<Object>)new List<Decimal>(values) ) ) ).notx();
    }

    global static Filter notIn( String field, Set<Integer> values )
    {
        return isIn(field, new Set<Object>( ((List<Object>)new List<Integer>(values) ) ) ).notx();
    }

    global static Filter notIn( String field, Set<Date> values )
    {
        return isIn(field, new Set<Object>( ((List<Object>)new List<Date>(values) ) ) ).notx();
    }

    global static Filter notIn( String field, Set<DateTime> values )
    {
        return isIn(field, new Set<Object>( ((List<Object>)new List<DateTime>(values) ) ) ).notx();
    }
    // end notIn String, Set<Object>

    // notIn Schema.sObjectField, List<Object>
    global static Filter notIn( Schema.SObjectField field, List<Object> values )
    {
        return isIn( field, values ).notx();
    }
    
    global static Filter notIn( String field, List<String> values )
    {
        return isIn(field, (List<Object>)values ).notx();
    }

    global static Filter notIn( String field, List<Id> values )
    {
        return isIn(field, (List<Object>)values ).notx();
    }

    global static Filter notIn( String field, List<Decimal> values )
    {
        return isIn(field, (List<Object>)values ).notx();
    }

    global static Filter notIn( String field, List<Integer> values )
    {
        return isIn(field, (List<Object>)values ).notx();
    }

    global static Filter notIn( String field, List<Date> values )
    {
        return isIn(field, (List<Object>)values ).notx();
    }

    global static Filter notIn( String field, List<DateTime> values )
    {
        return isIn(field, (List<Object>)values ).notx();
    }
    // end notIn Schema.sObjectField, List<Object>

    // notIn String, List<Object>
    global static Filter notIn( String field, List<Object> values )
    {
        return isIn( field, values ).notx();
    }
    
    global static Filter notIn( Schema.SObjectField field, List<String> values )
    {
        return isIn(field, (List<Object>)values ).notx();
    }

    global static Filter notIn( Schema.SObjectField field, List<Id> values )
    {
        return isIn(field, (List<Object>)values ).notx();
    }

    global static Filter notIn( Schema.SObjectField field, List<Decimal> values )
    {
        return isIn(field, (List<Object>)values ).notx();
    }

    global static Filter notIn( Schema.SObjectField field, List<Integer> values )
    {
        return isIn(field, (List<Object>)values ).notx();
    }

    global static Filter notIn( Schema.SObjectField field, List<Date> values )
    {
        return isIn(field, (List<Object>)values ).notx();
    }

    global static Filter notIn( Schema.SObjectField field, List<DateTime> values )
    {
        return isIn(field, (List<Object>)values ).notx();
    }
    // end notIn String, List<Object>

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
