global class ConstantPredicate extends InsertPredicate
{
    Boolean value;

    global ConstantPredicate( Boolean value )
    {
        this.value = value;
    }

    global Boolean evaluate( sObject newRecord )
    {
        return value;
    }
}
