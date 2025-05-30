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

        }
        field(3; "Document Status"; Enum "Sent Document Status")
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Pk; "No.")
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