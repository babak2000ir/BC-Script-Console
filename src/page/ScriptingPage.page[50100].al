page 50100 "Scripting Page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Script Header";

    layout
    {
        area(Content)
        {
            group(SelectATable)
            {
                Caption = 'Select a Table';
                field("Table ID"; rec."Table ID")
                {
                    ApplicationArea = All;
                }
                field("Table Name"; rec."Table Name")
                {
                    ApplicationArea = All;
                }
            }
            part("Script Line List Part"; "Script Line List Part")
            {
                SubPageLink = "Script Header Entry No." = field("Entry No.");
                ApplicationArea = all;
            }
            group(TableAction)
            {
                Caption = 'Select Table Action';
                field(Action; Rec.Action)
                {
                    ApplicationArea = All;
                }
                field("Run Trigger Code"; rec."Run Trigger Code")
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
            action(RunScript)
            {
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = ExecuteBatch;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    ScriptMgmt.ExecuteScript(Rec);
                end;
            }
        }
    }

    var
        ScriptMgmt: Codeunit "Script Management";
}