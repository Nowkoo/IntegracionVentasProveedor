page 60302 "Sent Order"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Sent Headers";
    InsertAllowed = false;
    //ModifyAllowed = false;

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
                SubPageLink = "Document No." = field("No."), "Customer No." = field("Customer No.");
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
            action(Finish)
            {
                Caption = 'Confirm order';
                ToolTip = 'Marks all the lines in this order as ready.';
                trigger OnAction()
                var
                    SentLine: Record "Sent Lines";
                begin
                    Rec.Ready := true;
                    Rec.Modify();
                    //CurrPage.Update();
                    /* SentLine.SetRange("Document No.", Rec."No.");
                    if SentLine.FindSet() then
                        repeat
                            SentLine.Ready := true;
                            SentLine.Modify();
                        until SentLine.Next() = 0; */
                end;
            }
        }
    }
}