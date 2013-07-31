/*
 * Predicate interface
 *
 * Evaluates an sObject to determine a Boolean.
 * Operates on a single instance (the insert case) and on two
 *   instances referring to the same sObject (the update case).
 *
 * Pass a Predicate instance to the Filter constructor.
 *
 * If there is no difference between the insert and update
 *   cases for a custom Predicate, don't implement this.
 *   Instead, extend the InsertPredicate abstract class.
 */
global interface Predicate
{
    Boolean evaluate( sObject newRecord );
    Boolean evaluate( sObject newRecord, sObject oldRecord );
}
