table 60302 "Sent Headers"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;

        }

        field(2; "Customer Name"; Text[100])
        {
            DataClassification = CustomerContent;
            TableRelation = Customer.Name;
        }
        field(3; "Document Status"; Enum "Sent Document Status")
        {
            DataClassification = CustomerContent;
        }
        field(4; "Ready"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(5; "Customer No."; Code[20])
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                Customer: Record Customer;
                UnknownCustLbl: Label 'Misconfigured';
            begin
                if Customer.Get("Customer No.") then
                    "Customer Name" := Customer.Name
                else
                    "Customer Name" := UnknownCustLbl;
            end;
        }
    }

    keys
    {
        key(Pk; "No.", "Customer No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    trigger OnInsert()
    begin
        //Rec."Document Status" := Rec."Document Status"::Open;
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    var
        SentLine: Record "Sent Lines";
    begin
        SentLine.SetRange("Document No.", Rec."No.");
        if SentLine.FindSet() then
            SentLine.DeleteAll();
    end;

    trigger OnRename()
    begin

    end;

}