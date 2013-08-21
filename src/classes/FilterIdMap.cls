/*
 * FilterIdMap class
 *
 * Optimized to use a map of ids.
 */
global class FilterIdMap extends Filter
{
    global override List<sObject> filter( List<sObject> newRecords )
    {
        return new List<sObject>{ (new Map<Id, sObject>( newRecords )).get( searchId ) };
    }

    global override List<sObject> filter( List<sObject> newRecords, Map<Id, sObject> oldRecords )
    {
        return filter( newRecords );
    }

    global FilterIdMap( Id searchId )
    {
        super( null );
        this.searchId = searchId;
    }

    @TestVisible Id searchId;
}
