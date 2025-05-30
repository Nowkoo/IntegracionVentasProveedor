page 60301 "Sent Headers API"
{
    PageType = API;
    APIVersion = 'v1.0';
    APIPublisher = 'mycompany';
    APIGroup = 'sentorders';
    EntityName = 'sentheader';
    EntitySetName = 'sentheaders';
    DelayedInsert = true;
    SourceTable = "Sent Headers";
    ODataKeyFields = SystemId;


    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(id; Rec.SystemId)
                {
                    ApplicationArea = All;
                }
                field("no"; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(customerName; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }

                field(documentStatus; Rec."Document Status")
                {
                    ApplicationArea = All;
                }
                part(sentOrderLines; "Sent Lines API")
                {
                    ApplicationArea = All;
                    Caption = 'Sent Lines';
                    SubPageLink = "Document No." = field("No.");
                    EntityName = 'sentOrderLine';
                    EntitySetName = 'sentOrderLines';
                }
            }
        }
    }
}


/* page 60301 "Sent Lines API"
{
    PageType = API;
    APIVersion = 'v1.0';
    APIPublisher = 'mycompany';
    APIGroup = 'sentlines';
    EntityName = 'sentline';
    EntitySetName = 'sentlines';
    DelayedInsert = true;
    SourceTable = "Sent Lines";
    ODataKeyFields = SystemId;


    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(id; Rec.SystemId)
                {
                    ApplicationArea = All;
                }
                field(documentNo; Rec."Document No.")
                {
                    ApplicationArea = All;
                }
                field(lineNo; Rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field(no; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field(vendorItemNo; Rec."Vendor Item No.")
                {
                    ApplicationArea = All;
                }
                field(ready; Rec.Ready)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
 */
