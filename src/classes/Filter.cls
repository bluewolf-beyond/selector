global class Filter
{
    /////////////////////////////////////////////////////////////////
    // standard filter types
    /////////////////////////////////////////////////////////////////

    global static Filter fieldChanged( Schema.SObjectField field )
    {
        return new Filter( new FieldChangedPredicate( field ) );
    }

    global static Filter fieldNew( Schema.SObjectField field )
    {
        return new Filter( new FieldNewPredicate( field ) );
    }

    global static Filter fieldEquals( Schema.SObjectField field, Object value )
    {
        return new Filter( new FieldEqualsPredicate( field, value ) );
    }

    global static Filter fieldNotEquals( Schema.SObjectField field, Object value )
    {
        return new Filter( new FieldNotEqualsPredicate( field, value ) );
    }

    global static Filter fieldIn( Schema.SObjectField field, Set<Object> values )
    {
        return new Filter( new FieldInPredicate( field, values ) );
    }

    global static Filter fieldNotIn( Schema.SObjectField field, Set<Object> values )
    {
        return new Filter( new FieldNotInPredicate( field, values ) );
    }

    global static Filter fieldNull( Schema.SObjectField field )
    {
        return new Filter( new FieldNullPredicate( field ) );
    }

    global static Filter fieldNotNull( Schema.SObjectField field )
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
    // Predicate interface
    /////////////////////////////////////////////////////////////////

    global interface Predicate
    {
        Boolean evaluate( sObject newRecord );
        Boolean evaluate( sObject newRecord, sObject oldRecord );
    }

    global abstract class InsertPredicate implements Predicate
    {
        global Boolean evaluate( sObject newRecord, sObject oldRecord )
        {
            return ((Predicate)this).evaluate( newRecord );
        }
    }

    /////////////////////////////////////////////////////////////////
    // standard Predicates
    /////////////////////////////////////////////////////////////////

    global virtual class FieldChangedPredicate implements Predicate
    {
        @TestVisible Schema.SObjectField field;

        global FieldChangedPredicate( Schema.SObjectField field )
        {
            this.field = field;
        }

        global Boolean evaluate( sObject newRecord )
        {
            return newRecord.get( field ) != null;
        }

        global Boolean evaluate( sObject newRecord, sObject oldRecord )
        {
            return newRecord.get( field ) != oldRecord.get( field );
        }
    }

    global virtual class FieldNewPredicate implements Predicate
    {
        @TestVisible Schema.SObjectField field;

        global FieldNewPredicate( Schema.SObjectField field )
        {
            this.field = field;
        }

        global Boolean evaluate( sObject newRecord )
        {
            return newRecord.get( field ) != null;
        }

        global Boolean evaluate( sObject newRecord, sObject oldRecord )
        {
            return newRecord.get( field ) != null &&
                   oldRecord.get( field ) == null;
        }
    }

    global virtual class FieldEqualsPredicate extends InsertPredicate
    {
        @TestVisible Schema.SObjectField field;
        @TestVisible Object value;

        global FieldEqualsPredicate( Schema.SObjectField field, Object value )
        {
            this.field = field;
            this.value = value;
        }

        global Boolean evaluate( sObject newRecord )
        {
            return newRecord.get( field ) == value;
        }
    }

    global virtual class FieldNotEqualsPredicate extends InsertPredicate
    {
        @TestVisible Schema.SObjectField field;
        @TestVisible Object value;

        global FieldNotEqualsPredicate( Schema.SObjectField field, Object value )
        {
            this.field = field;
            this.value = value;
        }

        global Boolean evaluate( sObject newRecord )
        {
            return newRecord.get( field ) != value;
        }
    }

    global virtual class FieldInPredicate extends InsertPredicate
    {
        @TestVisible Schema.SObjectField field;
        @TestVisible Set<Object> values;

        global FieldInPredicate( Schema.SObjectField field, Set<Object> values )
        {
            this.field = field;
            this.values = values;
        }

        global Boolean evaluate( sObject newRecord )
        {
            return values.contains( newRecord.get( field ) );
        }
    }

    global virtual class FieldNotInPredicate extends InsertPredicate
    {
        @TestVisible Schema.SObjectField field;
        @TestVisible Set<Object> values;

        global FieldNotInPredicate( Schema.SObjectField field, Set<Object> values )
        {
            this.field = field;
            this.values = values;
        }

        global Boolean evaluate( sObject newRecord )
        {
            return !values.contains( newRecord.get( field ) );
        }
    }

    global virtual class FieldNullPredicate extends FieldEqualsPredicate
    {
        global FieldNullPredicate( Schema.SObjectField field )
        {
            super( field, null );
        }
    }

    global virtual class FieldNotNullPredicate extends FieldNotEqualsPredicate
    {
        global FieldNotNullPredicate( Schema.SObjectField field )
        {
            super( field, null );
        }
    }

    global class AndPredicate implements Predicate
    {
        @TestVisible Predicate left, right;

        global AndPredicate( Predicate left, Predicate right )
        {
            this.left = left;
            this.right = right;
        }

        global Boolean evaluate( sObject newRecord )
        {
            return left.evaluate( newRecord ) &&
                   right.evaluate( newRecord );
        }

        global Boolean evaluate( sObject newRecord, sObject oldRecord )
        {
            return left.evaluate( newRecord, oldRecord ) &&
                   right.evaluate( newRecord, oldRecord );
        }
    }

    global class OrPredicate implements Predicate
    {
        @TestVisible Predicate left, right;

        global OrPredicate( Predicate left, Predicate right )
        {
            this.left = left;
            this.right = right;
        }

        global Boolean evaluate( sObject newRecord )
        {
            return left.evaluate( newRecord ) ||
                   right.evaluate( newRecord );
        }

        global Boolean evaluate( sObject newRecord, sObject oldRecord )
        {
            return left.evaluate( newRecord, oldRecord ) ||
                   right.evaluate( newRecord, oldRecord );
        }
    }
}
