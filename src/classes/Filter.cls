global class Filter
{
    global static Filter fieldChanged( Schema.SObjectField field )
    {
        return new Filter( new FieldChangedPredicate( field ) );
    }

    global interface Predicate
    {
        Boolean evaluate( sObject newRecord );
        Boolean evaluate( sObject newRecord, sObject oldRecord );
    }

    global class FieldChangedPredicate implements Predicate
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

    global Filter( Predicate predicate )
    {
        this.predicate = predicate;
    }

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

    @TestVisible Predicate predicate;
}
