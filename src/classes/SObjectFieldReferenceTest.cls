@isTest
private class SObjectFieldReferenceTest
{
    static testMethod void test_SObjectFieldReference()
    {
        final String fieldRefPath = 'Account';
        Account act = new Account( Name='AccountName' );
        Opportunity opty = new Opportunity();
        opty.Account = act;

        Test.startTest();
            SObjectFieldReference fieldRef = new SObjectFieldReference( fieldRefPath );
            Account fieldRefAccount = (Account)fieldRef.getFrom( opty );
        Test.stopTest();

        System.assertEquals( act.Name, fieldRefAccount.Name, 'We expect the sObject returned from the FieldReference to be the Opportunties Account' );
        System.assertEquals( fieldRefPath, fieldRef.toString(), 'We expect the field path to the sObject to be returned');
    }

    static testMethod void test_buildSObjectFieldReference()
    {
        String fieldRef = 'Opportunity.Account';

        Account act = new Account( Name='ActName' );
        Opportunity opty = new Opportunity();
        opty.Account = act;
        OpportunityLineItem oli = new OpportunityLineItem();
        oli.Opportunity = opty;

        Test.startTest();
            Select.FieldReference sObjFieldRef = SObjectFieldReference.buildSObjectFieldReference( fieldRef );
            Account fieldRefsObject = (Account)sObjFieldRef.getFrom( oli );
        Test.stopTest();

        System.assertEquals( act.Name, fieldRefsObject.Name, 'We expect the lookup from the OpportunityLineItems Opportunities Account' );
    }
}