global class NotPredicate implements Predicate
{
    @TestVisible Predicate inverted;

    global NotPredicate( Predicate inverted )
    {
        this.inverted = inverted;
    }

    global Boolean evaluate( sObject newRecord )
    {
        return !inverted.evaluate( newRecord );
    }

    global Boolean evaluate( sObject newRecord, sObject oldRecord )
    {
        return !inverted.evaluate( newRecord, oldRecord );
    }
}
