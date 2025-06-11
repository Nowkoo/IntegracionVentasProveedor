page 60301 "Sent Headers API"
{
    PageType = API;
    APIVersion = 'v1.0';
    APIPublisher = 'mycompany';
    APIGroup = 'sentorders';
    EntityName = 'sentOrderHeader';
    EntitySetName = 'sentOrderHeaders';
    DelayedInsert = true;
    SourceTable = "Sent Headers";
    ODataKeyFields = SystemId;

    //https://<base URL>:<port>/<serverinstance>/api/<API publisher>/<API group>/<API version>
    //Para consultar company id: http://version24:7048/BC/api/mycompany/sentorders/v1.0/companies
    //Para consultar los headers: http://version24:7048/BC/api/mycompany/sentorders/v1.0/companies(fe88f800-f5f9-ef11-9346-7c1e52404148)/sentheaders

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
                field(documentStatus; Rec."Document Status")
                {
                    ApplicationArea = All;
                }
                field(customerNo; Rec."Customer No.")
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