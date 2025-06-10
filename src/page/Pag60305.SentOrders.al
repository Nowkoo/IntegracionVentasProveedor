page 60305 "Sent Orders"
{
    Caption = 'Pedidos enviados';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Sent Headers";
    CardPageId = "Sent Order";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("no"; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(customerName; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }
                /* field(ready; Rec.Ready)
                {
                    ApplicationArea = All;
                } */
                field(status; Rec."Order Status")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            /* action(ViewReady)
            {
                Caption = 'View Ready';
                ToolTip = 'Displays the orders marked as ready.';
                trigger OnAction()
                var
                    SentHeader: Record "Sent Headers";
                begin
                    SentHeader.SetFilter("No.", GetReadyOrdersFilter(SentHeader));
                    CurrPage.SetTableView(SentHeader);
                    CurrPage.Update();
                end;
            } */
        }
    }

    /* trigger OnOpenPage()
    var
        SentHeader: Record "Sent Headers";
        Filter: Text;
    begin
        SentHeader.SetRange("Document Status", SentHeader."Document Status"::Open);
        SentHeader.SetRange(Ready, false);
        Filter := GetSentOrdersFilter(SentHeader);
        SentHeader.SetFilter("No.", Filter);
        CurrPage.SetTableView(SentHeader);
        CurrPage.Update();
    end;

    local procedure GetSentOrdersFilter(var SentHeader: Record "Sent Headers"): Text
    var
        Filter: Text;
    begin
        if SentHeader.FindSet() then
            repeat
                if Filter = '' then
                    Filter := SentHeader."No."
                else
                    Filter := Filter + '|' + SentHeader."No.";
            until SentHeader.Next() = 0;
        exit(Filter);
    end;

    local procedure GetReadyOrdersFilter(var SentHeader: Record "Sent Headers"): Text
    var
        Filter: Text;
    begin
        SentHeader.SetRange(Ready, true);
        if SentHeader.FindSet() then
            repeat
                if Filter = '' then
                    Filter := SentHeader."No."
                else
                    Filter := Filter + '|' + SentHeader."No.";
            until SentHeader.Next() = 0;
        exit(Filter);
    end; */
}