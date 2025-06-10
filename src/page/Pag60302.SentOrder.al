page 60302 "Sent Order"
{
    Caption = 'Sent Order';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Sent Headers";
    InsertAllowed = false;
    //ModifyAllowed = false;
    //No permitir añadir líneas con el mismo producto
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
                Caption = 'Sent Order Subform';
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
            action(MarkReady)
            {
                Caption = 'Mark as Ready';
                ToolTip = 'Marks the current order as ready until the customer updates the order';
                PromotedCategory = Process;
                Promoted = true;
                Image = Confirm;
                trigger OnAction()
                var
                    SentLine: Record "Sent Lines";
                begin
                    Rec."Order Status" := "Sent Order Status"::Ready;
                    //Rec.Ready := true;
                    Rec.Modify();

                    CurrPage.Close();

                    SentLine.SetRange("Document No.", Rec."No.");
                    if SentLine.FindSet() then
                        repeat
                            SentLine.Ready := true;
                            SentLine.Modify();
                        until SentLine.Next() = 0;
                end;
            }
        }
    }
}