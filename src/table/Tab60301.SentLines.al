table 60301 "Sent Lines"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(3; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(4; "Description"; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }

        field(5; "Quantity"; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;
        }
        field(6; "Vendor Item No."; Text[50])
        {
            DataClassification = CustomerContent;
            TableRelation = Item;

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
            Caption = 'Ready';
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
        //calcular número de línea
        if SentLine.FindLast() then
            Rec."Vendor Line No." := SentLine."Vendor Line No." + 10000
        else
            Rec."Vendor Line No." := 0;

        //si item no. está vacío, es una línea creada por el proveedor y la marcamos como new para que el cliente lo sepa
        if Rec."No." = '' then
            Rec.new := true;

        //el pedido deja de estar preparado
        if SentHeader.Get(Rec."Document No.", Rec."Customer No.") and (SentHeader."Order Status" = SentHeader."Order Status"::Ready) then begin
            SentHeader."Order Status" := SentHeader."Order Status"::Modified;
            //SentHeader.Ready := false;
            SentHeader.Modify();
        end;
    end;
}