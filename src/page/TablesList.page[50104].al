page 50104 "Tables List"
{
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = AllObjWithCaption;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Object ID"; Rec."Object ID")
                {
                    ToolTip = 'Specifies the object ID.';
                    ApplicationArea = All;
                }
                field("Object Name"; Rec."Object Name")
                {
                    ToolTip = 'Specifies the name of the object.';
                    ApplicationArea = All;
                }
                field("Object Caption"; Rec."Object Caption")
                {
                    ToolTip = 'Specifies the caption of the object.';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(OpenLookup)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = ViewWorksheet;

                trigger OnAction();
                begin
                    UniversalLookupMgmt.OpenLookup(rec."Object ID");
                end;
            }
        }
    }

    trigger OnInit()
    begin
        rec.SetRange("Object Type", rec."Object Type"::Table);
    end;

    var
        UniversalLookupMgmt: Codeunit "Universal Lookup Mgmt.";
}