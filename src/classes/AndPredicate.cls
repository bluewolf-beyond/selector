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
