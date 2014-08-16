global virtual class SObjectFieldReference extends Select.FieldReference
{
    @TestVisible String field;
    global SObjectFieldReference( String field )
    {
        this.field = field;
    }

    global override Object getFrom( sObject record )
    {
        return record.getSObject( field );
    }

    global override String toString()
    {
        return field;
    }

    global static Select.FieldReference buildSObjectFieldReference( String field )
    {
        Integer index = field.indexOf('.');

        if ( index == -1 )
        {
            return new SObjectFieldReference( field );
        }

        return new ChainedFieldReference( field.substring( 0, index ), buildSObjectFieldReference( field.substring( index + 1 ) ) );
    }
}