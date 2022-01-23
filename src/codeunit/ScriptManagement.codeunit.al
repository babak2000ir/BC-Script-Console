codeunit 50100 "Script Management"
{
    trigger OnRun()
    begin

    end;

    procedure ExecuteScript(pScriptHeader: Record "Script Header")
    var
        lScriptLine: Record "Script Line";
        lRecRef: RecordRef;
    begin
        lRecRef.Open(pScriptHeader."Table ID");

        case pScriptHeader.Action of
            pScriptHeader.Action::Insert:
                begin
                    lRecRef.Init();
                    ExecuteAssignLines(pScriptHeader."Entry No.", lRecRef);
                    lRecRef.Insert(pScriptHeader."Run Trigger Code");
                end;
            pScriptHeader.Action::Modify:
                begin
                    lRecRef.Reset();
                    ExecuteFilterLines(pScriptHeader."Entry No.", lRecRef);
                    if lRecRef.FindSet() then begin
                        repeat
                            ExecuteAssignLines(pScriptHeader."Entry No.", lRecRef);
                            lRecRef.Modify(pScriptHeader."Run Trigger Code");
                        until lRecRef.Next() = 0;
                    end
                end;
            pScriptHeader.Action::Delete:
                begin
                    lRecRef.Reset();
                    ExecuteFilterLines(pScriptHeader."Entry No.", lRecRef);
                    lRecRef.DeleteAll(pScriptHeader."Run Trigger Code");
                end;
        end;
    end;

    local procedure ExecuteAssignLines(pScriptHeaderEntryNo: Integer; pRecRef: RecordRef)
    var
        lScriptLine: Record "Script Line";
        lFieldRef: FieldRef;
    begin
        lScriptLine.Reset();
        lScriptLine.SetRange("Script Header Entry No.", pScriptHeaderEntryNo);
        lScriptLine.SetRange("Filter Type", lScriptLine."Filter Type"::":=");
        if lScriptLine.FindSet() then begin
            repeat
                lFieldRef := pRecRef.Field(lScriptLine."Field ID");
                if lScriptLine.Validate then
                    lFieldRef.Validate(lScriptLine."Param 1")
                else
                    lFieldRef.Value(lScriptLine."Param 1");
            until lScriptLine.Next() = 0;
        end;
    end;

    local procedure ExecuteFilterLines(pScriptHeaderEntryNo: Integer; pRecRef: RecordRef)
    var
        lScriptLine: Record "Script Line";
        lFieldRef: FieldRef;
    begin
        lScriptLine.Reset();
        lScriptLine.SetRange("Script Header Entry No.", pScriptHeaderEntryNo);
        lScriptLine.SetFilter("Filter Type", '<>%1', lScriptLine."Filter Type"::":=");

        if lScriptLine.FindSet() then begin
            repeat
                lFieldRef := pRecRef.Field(lScriptLine."Field ID");

                case lScriptLine."Filter Type" of
                    lScriptLine."Filter Type"::SetRange:
                        begin
                            if lScriptLine."Param 2" <> '' then
                                lFieldRef.SetRange(lScriptLine."Param 1", lScriptLine."Param 2")
                            else
                                lFieldRef.SetRange(lScriptLine."Param 1");

                        end;
                    lScriptLine."Filter Type"::SetFilter:
                        begin
                            lFieldRef.SetFilter(lScriptLine."Param 1", lScriptLine."Param 2");
                        end;
                end;
            until lScriptLine.Next() = 0;
        end;
    end;

    procedure OpenFieldLookup(pScriptHeader: Record "Script Header"; pScriptLine: Record "Script Line")
    var
        lFields: Record Field;
        lTableMetadata: Record "Table Metadata";
        lTableRelationMetadata: Record "Table Relations Metadata";
    begin
        if lFields.Get(pScriptHeader."Table ID", pScriptLine."Field ID") then begin
            //Message('%1,%2', lFields.RelationFieldNo, lFields.RelationTableNo);
            if lTableMetadata.Get(pScriptHeader."Table ID") then begin
                //message('%1,%2,%3', lTableMetadata.LookupPageID);
                if page.RunModal(lTableMetadata.LookupPageID) = action::LookupOK begin

                end;
            end;
        end;
    end;

    procedure UniversalLookup(pFields: Record Field)
    var
        lRecordRef: RecordRef;
        lFieldRef: FieldRef;
        lNameValue: record "Name/Value Buffer" temporary;
        lNameValueLookup: page "Name/Value Lookup";
        lField1, lField2 : text;
    begin
        if pFields.RelationTableNo <> 0 then begin
            lRecordRef.Open(pFields.RelationTableNo);
            if lRecordRef.FindSet(false, false) then
                repeat
                    lField1 := '';
                    lField2 := '';
                    if pFields.RelationFieldNo <> 0 then begin
                        //load field
                        lFieldRef := lRecordRef.Field(pFields.RelationFieldNo);
                        if key <> relationFieldNo //also load key

                    else
                            //load key
                            //Load next field
                            lNameValue.AddNewEntry();
                    end;
                until lRecordRef.Next() = 0;

        end;
    end;
}