page 60305 "Sent Orders"
{
    Caption = 'Sent Orders';
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
}