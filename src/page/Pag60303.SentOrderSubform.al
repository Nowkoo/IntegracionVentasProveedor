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
                    ApplicationArea = All;
                    Editable = false;
                } */
                field("No."; Rec."Vendor Item No.")
                {
                    ApplicationArea = All;
                    Editable = Rec.Ready = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    Editable = Rec.Ready = false;
                }
                field(Ready; Rec.Ready)
                {
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