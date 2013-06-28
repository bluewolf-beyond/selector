global class Filter
{
    global interface Predicate
    {
        Boolean evaluate( sObject newRecord );
        Boolean evaluate( sObject newRecord, sObject oldRecord );
    }

    global class FieldChangedPredicate implements Predicate
    {
        Schema.SObjectField field;

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
}
