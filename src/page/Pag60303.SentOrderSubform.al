page 60303 "Sent Order Subform"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Sent Lines";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                /* field("Document No."; Rec."Document No.")
                {
                    Caption = 'Document No.';
                    ApplicationArea = All;
                    Editable = false;
                } */
                field("No."; Rec."Vendor Item No.")
                {
                    Caption = 'No.';
                    ApplicationArea = All;
                    TableRelation = Item;
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Description';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                    ApplicationArea = All;
                }
                field(Ready; Rec.Ready)
                {
                    Caption = 'Ready';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }
}