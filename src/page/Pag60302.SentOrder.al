page 60302 "Sent Order"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Sent Headers";
    InsertAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("no"; Rec."No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(customerName; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            part(sentOrderLines; "Sent Order Subform")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = field("No.");
                Editable = true;
                Enabled = true;
                UpdatePropagation = Both;
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