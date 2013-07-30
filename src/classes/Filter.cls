global class Filter
{
    /////////////////////////////////////////////////////////////////
    // standard filter types
    /////////////////////////////////////////////////////////////////

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

    global static Filter hasChildren( String field )
    {
        return new Filter( new HasChildrenPredicate( field ) );
    }

    global static Filter hasNoChildren( String field )
    {
        return new Filter( new NotPredicate( new HasChildrenPredicate( field ) ) );
    }

    global static Filter fieldNotEquals( Schema.SObjectField field, Object value )
    {
        return new Filter( new NotPredicate( new FieldEqualsPredicate( field, value ) ) );
    }

    global static Filter fieldNotEquals( String field, Object value )
    {
        return new Filter( new NotPredicate( new FieldEqualsPredicate( field, value ) ) );
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
        return new Filter( new NotPredicate( new FieldInPredicate( field, values ) ) );
    }

    global static Filter fieldNotIn( String field, Set<Object> values )
    {
        return new Filter( new NotPredicate( new FieldInPredicate( field, values ) ) );
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
        return new Filter( new NotPredicate( new FieldNullPredicate( field ) ) );
    }

    global static Filter fieldNotNull( String field )
    {
        return new Filter( new NotPredicate( new FieldNullPredicate( field ) ) );
    }

    /////////////////////////////////////////////////////////////////
    // Filter instance methods
    /////////////////////////////////////////////////////////////////

    global List<sObject> filter( List<sObject> newRecords )
    {
        List<sObject> filteredRecords = new List<sObject>();

        for ( sObject record : newRecords )
        {
            if ( predicate.evaluate( record ) )
            {
                filteredRecords.add( record );
            }
        }

        return filteredRecords;
    }

    global List<sObject> filter( List<sObject> newRecords, Map<Id, sObject> oldRecords )
    {
        List<sObject> filteredRecords = new List<sObject>();

        for ( sObject record : newRecords )
        {
            sObject oldRecord = oldRecords.get( record.Id );

            if ( predicate.evaluate( record, oldRecord ) )
            {
                filteredRecords.add( record );
            }
        }

        return filteredRecords;
    }

    global Filter andx( Filter other )
    {
        return new Filter( new AndPredicate( this.predicate, other.predicate ) );
    }

    global Filter orx( Filter other )
    {
        return new Filter( new OrPredicate( this.predicate, other.predicate ) );
    }

    /////////////////////////////////////////////////////////////////
    // Filter class glue
    /////////////////////////////////////////////////////////////////

    global Filter( Predicate predicate )
    {
        this.predicate = predicate;
    }

    @TestVisible Predicate predicate;
}
