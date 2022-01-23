table 50101 "Script Line"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Script Header Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Field ID"; Integer)
        {
            DataClassification = ToBeClassified;

            trigger OnLookup()
            var
                ScriptHeader: Record "Script Header";
                FieldLookup: page "Fields Lookup";
                FieldRecord: Record Field;
            begin
                if ScriptHeader.Get(rec."Script Header Entry No.") and (ScriptHeader."Table ID" <> 0) then begin
                    FieldRecord.Reset();
                    FieldRecord.SetRange(TableNo, ScriptHeader."Table ID");
                    FieldLookup.SetTableView(FieldRecord);
                    FieldLookup.LookupMode(true);
                    if FieldLookup.RunModal() = Action::LookupOK then begin
                        FieldLookup.GetRecord(FieldRecord);
                        "Field ID" := FieldRecord."No.";
                        "Field Name" := FieldRecord.FieldName;
                    end;
                end;
            end;

            trigger OnValidate()
            begin
                if "Field ID" = 0 then
                    "Field Name" := '';
            end;
        }
        field(11; "Field Name"; Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(20; "Filter Type"; Option)
        {
            OptionMembers = SetRange,SetFilter,":=";
        }
        field(21; Validate; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Param 1"; Text[250])
        {
            DataClassification = ToBeClassified;

            trigger OnLookup()
            var
                ScriptHeader: Record "Script Header";
            begin
                if ScriptHeader.Get(rec."Script Header Entry No.") and (ScriptHeader."Table ID" <> 0) then begin
                    ScriptMgmt.OpenFieldLookup(ScriptHeader, Rec);
                end;
            end;
        }
        field(31; "Param 2"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Script Header Entry No.", "Line No.")
        {
            Clustered = true;
        }
    }

    var
        ScriptMgmt: Codeunit "Script Management";
}