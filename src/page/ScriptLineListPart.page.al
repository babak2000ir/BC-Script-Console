page 50102 "Script Line List Part"
{
    PageType = ListPart;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Script Line";
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Script Header Entry No."; rec."Script Header Entry No.")
                {
                    ApplicationArea = All;
                }
                field("Line No."; rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field("Field ID"; rec."Field ID")
                {
                    ApplicationArea = All;
                }
                field("Field Name"; rec."Field Name")
                {
                    ApplicationArea = All;
                }
                field("Filter Type"; Rec."Filter Type")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        SetEditables();
                    end;
                }
                field(Validate; Rec.Validate)
                {
                    ApplicationArea = All;
                    Enabled = ValidateIsEnabled;
                }
                field("Param 1"; Rec."Param 1")
                {
                    ApplicationArea = All;
                    CaptionClass = Param1Caption;
                }
                field("Param 2"; Rec."Param 2")
                {
                    ApplicationArea = All;
                    Enabled = Param2IsEnabled;
                    CaptionClass = Param2Caption;
                }
            }
        }
    }

    trigger OnInit()
    begin
        ValidateIsEnabled := false;
        Param2IsEnabled := true;
    end;

    trigger OnAfterGetCurrRecord()
    begin
        SetEditables();
    end;

    local procedure SetEditables()
    begin
        if rec."Filter Type" in [rec."Filter Type"::SetFilter, rec."Filter Type"::SetRange] then begin
            ValidateIsEnabled := false;
            rec.Validate := false;
        end else begin
            ValidateIsEnabled := true;
        end;

        if rec."Filter Type" = rec."Filter Type"::SetFilter then begin
            Param2IsEnabled := false;
            rec."Param 2" := '';
        end else begin
            Param2IsEnabled := true;
        end;

        case rec."Filter Type" of
            rec."Filter Type"::SetRange:
                begin
                    Param1Caption := 'FromValue';
                    Param2Caption := 'ToValue';
                end;
            rec."Filter Type"::SetFilter:
                begin
                    Param1Caption := 'Filter String';
                    Param2Caption := 'Value';
                end;
            rec."Filter Type"::":=":
                begin
                    Param1Caption := 'Value';
                    Param2Caption := '';
                end;
        end
    end;

    var
        [InDataSet]
        ValidateIsEnabled: Boolean;
        [InDataSet]
        Param2IsEnabled: Boolean;
        Param1Caption: Text;
        Param2Caption: Text;
}