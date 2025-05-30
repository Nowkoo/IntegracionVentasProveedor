page 60304 "Sent Lines API"
{
    PageType = API;
    APIVersion = 'v1.0';
    APIPublisher = 'mycompany';
    APIGroup = 'sentorders';
    EntityName = 'sentOrderLine';
    EntitySetName = 'sentOrderLines';
    DelayedInsert = true;
    SourceTable = "Sent Lines";
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("id"; Rec.SystemId)
                {
                    Caption = 'Document No.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("documentNo"; Rec."Document No.")
                {
                    Caption = 'Document No.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("lineNo"; Rec."Line No.")
                {
                    Caption = 'Line No.';
                    ApplicationArea = All;
                }
                field("no"; Rec."No.")
                {
                    Caption = 'No.';
                    ApplicationArea = All;
                    TableRelation = Item;
                }
                field("vendorItemNo"; Rec."Vendor Item No.")
                {
                    Caption = 'No.';
                    ApplicationArea = All;
                    TableRelation = Item;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                    ApplicationArea = All;
                }
                field(quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                    ApplicationArea = All;
                }
                field(ready; Rec.Ready)
                {
                    Caption = 'Ready';
                    ApplicationArea = All;
                }
                field(vendorLineNo; Rec."Vendor Line No.")
                {
                    Caption = 'Vendor Line No.';
                    ApplicationArea = All;
                }
                field(new; Rec.New)
                {
                    Caption = 'New';
                    ApplicationArea = All;
                }
            }
        }
    }
}
