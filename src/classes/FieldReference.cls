global abstract class FieldReference
{
    // FieldReference interface

    global abstract Object getFrom( sObject record );

    // factory methods

    global static FieldReference build( Schema.SObjectField field )
    {
        return new SchemaFieldReference( field );
    }

    global static FieldReference build( String field )
    {
        Integer index = field.indexOf('.');

        if ( index == -1 )
        {
            return new SimpleFieldReference( field );
        }

        return new ChainedFieldReference( field.substring( 0, index ), build( field.substring( index + 1 ) ) );
    }

    // concrete implementations

    global virtual class SchemaFieldReference extends FieldReference
    {
        @TestVisible Schema.SObjectField field;

        global SchemaFieldReference( Schema.SObjectField field )
        {
            this.field = field;
        }

        global override Object getFrom( sObject record )
        {
            return record.get( field );
        }

        global override String toString()
        {
            return '' + field;
        }
    }

    global virtual class SimpleFieldReference extends FieldReference
    {
        @TestVisible String field;

        global SimpleFieldReference( String field )
        {
            this.field = field;
        }

        global override Object getFrom( sObject record )
        {
            return record.get( field );
        }

        global override String toString()
        {
            return field;
        }
    }

    global virtual class ChainedFieldReference extends FieldReference
    {
        @TestVisible String field;
        @TestVisible FieldReference next;

        global ChainedFieldReference( String field, FieldReference next )
        {
            this.field = field;
            this.next = next;
        }

        global override Object getFrom( sObject record )
        {
            return next.getFrom( record.getSObject( field ) );
        }

        global override String toString()
        {
            return field + '.' + next.toString();
        }
    }
}
