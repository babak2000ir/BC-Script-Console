page 50101 "Script List"
{
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Script Header";
    CardPageId = "Scripting Page";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
                field("Action"; Rec."Action")
                {
                    ToolTip = 'Specifies the value of the Action field.';
                    ApplicationArea = All;
                }
                field("Table ID"; Rec."Table ID")
                {
                    ToolTip = 'Specifies the value of the Table ID field.';
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        CurrPage.Update(false);
                    end;
                }
                field("Table Name"; Rec."Table Name")
                {
                    ToolTip = 'Specifies the value of the Table Name field.';
                    ApplicationArea = All;
                }
                field("Run Trigger Code"; Rec."Run Trigger Code")
                {
                    ToolTip = 'Specifies the value of the Run Trigger Code field.';
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
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}