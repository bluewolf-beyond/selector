global interface Predicate
{
    Boolean evaluate( sObject newRecord );
    Boolean evaluate( sObject newRecord, sObject oldRecord );
}
