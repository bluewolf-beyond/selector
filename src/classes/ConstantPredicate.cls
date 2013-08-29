global class ConstantPredicate extends InsertPredicate
{
    @TestVisible Boolean value;

    global ConstantPredicate( Boolean value )
    {
        this.value = value;
    }

    global Boolean evaluate( sObject newRecord )
    {
        return value;
    }
}
