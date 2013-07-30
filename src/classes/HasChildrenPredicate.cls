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
