/*
 * InsertPredicate abstract class
 *
 * Specialization of the Predicate interface.
 * Used for predicates that ignore the old record in the
 *   update case.
 *
 * To extend this class, simply implement the unary evaluate
 *   method from the Predicate interface.
 */
global abstract class InsertPredicate implements Predicate
{
    global virtual Boolean evaluate( sObject newRecord, sObject oldRecord )
    {
        return ((Predicate)this).evaluate( newRecord );
    }
}
