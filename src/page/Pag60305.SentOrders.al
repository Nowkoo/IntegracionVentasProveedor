page 60305 "Sent Orders"
{
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
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }
}