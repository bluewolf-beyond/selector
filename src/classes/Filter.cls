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
        return new Filter( new HasNoChildrenPredicate( field ) );
    }

    global static Filter fieldNotEquals( Schema.SObjectField field, Object value )
    {
        return new Filter( new FieldNotEqualsPredicate( field, value ) );
    }

    global static Filter fieldNotEquals( String field, Object value )
    {
        return new Filter( new FieldNotEqualsPredicate( field, value ) );
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
        return new Filter( new FieldNotInPredicate( field, values ) );
    }

    global static Filter fieldNotIn( String field, Set<Object> values )
    {
        return new Filter( new FieldNotInPredicate( field, values ) );
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
        return new Filter( new FieldNotNullPredicate( field ) );
    }

    global static Filter fieldNotNull( String field )
    {
        return new Filter( new FieldNotNullPredicate( field ) );
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

    /////////////////////////////////////////////////////////////////
    // standard Predicates
    /////////////////////////////////////////////////////////////////

    global virtual class HasNoChildrenPredicate extends InsertPredicate
    {
        @TestVisible String childrenField;

        global HasNoChildrenPredicate( String field )
        {
            this.childrenField = field;
        }

        global Boolean evaluate( sObject newRecord )
        {
            List<sObject> childrenObjects = newRecord.getSObjects( childrenField );
            return childrenObjects == null || childrenObjects.isEmpty();
        }

    }

    global virtual class HasChildrenPredicate extends InsertPredicate
    {
        @TestVisible String childrenField;

        global HasChildrenPredicate( String field )
        {
            this.childrenField = field;
        }

        global Boolean evaluate( sObject newRecord )
        {
            List<sObject> childrenObjects = newRecord.getSObjects( childrenField );
            return childrenObjects != null && !newRecord.getSObjects( childrenField ).isEmpty();
        }

    }

    global virtual class FieldNotEqualsPredicate extends InsertPredicate
    {
        @TestVisible FieldReference field;
        @TestVisible Object value;

        global FieldNotEqualsPredicate( FieldReference field, Object value )
        {
            this.field = field;
            this.value = value;
        }

        global FieldNotEqualsPredicate( Schema.SObjectField field, Object value )
        {
            this( FieldReference.build( field ), value );
        }

        global FieldNotEqualsPredicate( String field, Object value )
        {
            this( FieldReference.build( field ), value );
        }

        global Boolean evaluate( sObject newRecord )
        {
            return field.getFrom( newRecord ) != value;
        }
    }

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

    global virtual class FieldNotInPredicate extends InsertPredicate
    {
        @TestVisible FieldReference field;
        @TestVisible Set<Object> values;

        global FieldNotInPredicate( FieldReference field, Set<Object> values )
        {
            this.field = field;
            this.values = values;
        }

        global FieldNotInPredicate( Schema.SObjectField field, Set<Object> values )
        {
            this( FieldReference.build( field ), values );
        }

        global FieldNotInPredicate( String field, Set<Object> values )
        {
            this( FieldReference.build( field ), values );
        }

        global Boolean evaluate( sObject newRecord )
        {
            return !values.contains( field.getFrom( newRecord ) );
        }
    }

    global virtual class FieldNotNullPredicate extends FieldNotEqualsPredicate
    {
        global FieldNotNullPredicate( Schema.SObjectField field )
        {
            super( field, null );
        }

        global FieldNotNullPredicate( String field )
        {
            super( field, null );
        }
    }
}
