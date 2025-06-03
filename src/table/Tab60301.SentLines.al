table 60301 "Sent Lines"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(3; "No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(4; "Description"; Text[100])
        {
            DataClassification = CustomerContent;
        }

        field(5; "Quantity"; Decimal)
        {
            DataClassification = CustomerContent;

        }
        field(6; "Vendor Item No."; Text[50])
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                Item: Record Item;
            begin
                if Item.Get(Rec."Vendor Item No.") then
                    Description := Item.Description;
            end;
        }
        field(7; "Ready"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(8; "Vendor Line No."; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(9; "New"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(10; "Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Pk; "Document No.", "Vendor Line No.", "Customer No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        SentLine: Record "Sent Lines";
        SentHeader: Record "Sent Headers";
    begin
        if SentLine.FindLast() then
            Rec."Vendor Line No." := SentLine."Vendor Line No." + 10000
        else
            Rec."Vendor Line No." := 0;

        if Rec."No." = '' then
            Rec.new := true;
    end;

    trigger OnModify()
    begin

    end;

    /* trigger OnDelete()
    var
        SentHeader: Record "Sent Headers";
        SentLine: Record "Sent Lines";
    begin
        if SentHeader.Get(Rec."Document No.") then begin
            SentLine.
        end;
    end;
 */
    trigger OnRename()
    begin

    end;

}