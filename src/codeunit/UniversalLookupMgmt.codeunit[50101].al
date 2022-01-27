codeunit 50101 "Universal Lookup Mgmt."
{
    procedure OpenLookup(ptableId: Integer)
    var
        lUniversalLookupPage: Page "Universal Lookup List";
    begin
        clear(lUniversalLookupPage);
        lUniversalLookupPage.setTableId(ptableId);
        lUniversalLookupPage.Run();
    end;

    procedure GetTableRecord(pTableId: Integer; pPageSize: Integer; pPageIndex: Integer): JsonObject
    var
        lRecRef: RecordRef;
        lStartRecord: BigInteger;
        lRecordExist: Boolean;
        lRecordCount: Integer;
        lCounter: Integer;
        lJOResponseHeader: JsonObject;
        lJAResponseLines: JsonArray;
    begin
        lRecRef.OPEN(pTableId);
        if lRecRef.FINDSET then begin
            lStartRecord := pPageIndex * pPageSize;
            lRecordCount := lRecRef.COUNT;
            if lRecordCount <= lStartRecord - 1 then
                lRecordExist := false
            else
                if lStartRecord = 0 then
                    lRecordExist := true
                else
                    lRecordExist := lRecRef.NEXT(lStartRecord) <> 0;

            lJOResponseHeader.Add('numberOfRecords', lRecordCount);
            lJOResponseHeader.Add('fields', GetFieldsData(pTableId));

            for lCounter := 1 to pPageSize do begin
                if lRecordExist then begin
                    lJAResponseLines.Add(GetEntityJson(lRecRef));
                end;
                lRecordExist := lRecRef.NEXT <> 0;
            end;

            lJOResponseHeader.Add('records', lJAResponseLines);
        end;

        exit(lJOResponseHeader);
    end;

    local procedure GetEntityJson(var pRecRef: RecordRef): JsonObject
    var
        lFields: Record "Field";
        lJOResponse: JsonObject;
        lFieldRef: FieldRef;
    begin
        lFields.RESET();
        lFields.SETRANGE(TableNo, pRecRef.Number);
        if lFields.FINDSET() then
            repeat
                if lFields.Enabled and (lFields.ObsoleteState = lFields.ObsoleteState::No) then begin
                    lFieldRef := pRecRef.Field(lFields."No.");
                    lJOResponse.Add(lFieldRef.Name, format(lFieldRef.Value(), 0, 9));
                end;
            until lFields.NEXT() = 0;
        exit(lJOResponse);
    end;

    local procedure GetFieldsData(pTableId: Integer): JsonArray
    var
        lFields: Record "Field";
        lJAResponse: JsonArray;
        lJOPart: JsonObject;
    begin
        lFields.RESET();
        lFields.SETRANGE(TableNo, pTableId);
        if lFields.FINDSET() then
            repeat
                if lFields.Enabled and (lFields.ObsoleteState = lFields.ObsoleteState::No) then begin
                    Clear(lJOPart);
                    lJOPart.Add('fieldName', lFields.FieldName);
                    lJOPart.Add('fieldType', lFields."Type Name");
                    lJAResponse.Add(lJOPart);
                end;
            until lFields.NEXT() = 0;
        exit(lJAResponse);
    end;

    // procedure AddRelationalFieldXML(var RecRef: RecordRef; CombinedFieldName: Text[1024]);
    // var
    //     FieldLookup: Record "Field";
    //     RelationRecRef: RecordRef;
    //     FieldRef: FieldRef;
    //     RelationKeyFieldRef: FieldRef;
    //     RelationFieldRef: FieldRef;
    //     FieldName: Text[1024];
    //     RelationFieldName: Text[1024];
    //     FieldNo: Integer;
    //     Position: Integer;
    // begin
    //     Position := STRPOS(CombinedFieldName, ';');
    //     if Position = 0 then
    //         exit;

    //     FieldName := COPYSTR(CombinedFieldName, 1, Position - 1);
    //     FieldName := FieldNameMapping(RecRef.NUMBER, FieldName);

    //     RelationFieldName := COPYSTR(CombinedFieldName, Position + 1);

    //     FieldNo := GetFieldNoByName(RecRef.NUMBER, FieldName);
    //     GetFieldLookup(RecRef.NUMBER, FieldNo, FieldLookup);

    //     FieldRef := RecRef.FIELD(FieldNo);

    //     if not CheckField(FieldRef) then
    //         exit;

    //     if (FieldLookup.RelationTableNo <> 0) and (FORMAT(FieldRef.VALUE) <> '') then begin
    //         RelationRecRef.OPEN(FieldLookup.RelationTableNo);
    //         RelationFieldName := FieldNameMapping(RelationRecRef.NUMBER, RelationFieldName);
    //         if IsTableHasComplexPrimaryKey(RelationRecRef) then
    //             ERROR(Text11123313, RelationRecRef.NUMBER);

    //         FieldLookup.RESET();
    //         FieldLookup.SETRANGE(TableNo, RelationRecRef.NUMBER);
    //         FieldLookup.SETRANGE(FieldName, RelationFieldName);
    //         if not FieldLookup.FINDFIRST() then
    //             ERROR(Text11123312, RelationFieldName, RelationRecRef.NUMBER);

    //         RelationKeyFieldRef := RelationRecRef.FIELD(GetPrimaryKeyNo(RelationRecRef));
    //         RelationKeyFieldRef.VALUE := FieldRef.VALUE;
    //         if RelationRecRef.FIND then begin

    //             RelationFieldRef := RelationRecRef.FIELD(FieldLookup."No.");

    //             if not CheckField(RelationFieldRef) then
    //                 exit;

    //             CombinedFieldName :=
    //             STRSUBSTNO(
    //                     '%1;%2',
    //                     FieldName,
    //                     FieldLookup.FieldName);

    //             ResultNodeBuff.AddFieldElementByName(RelationFieldRef, CombinedFieldName);
    //         end;
    //     end else
    //         ResultNodeBuff.AddFieldElementByName(FieldRef, FieldNameMapping(RecRef.NUMBER, FieldRef.NAME));
    // end;

    // procedure IsRelationalField(FieldName: Text[1024]): Boolean;
    // var
    //     Position: Integer;
    // begin
    //     Position := STRPOS(FieldName, ';');
    //     exit(Position <> 0);
    // end;

    // procedure IsTableHasComplexPrimaryKey(var TableRef: RecordRef): Boolean;
    // var
    //     KeyRef: KeyRef;
    // begin
    //     KeyRef := TableRef.KEYINDEX(1);
    //     exit(KeyRef.FIELDCOUNT > 1);
    // end;

    // procedure GetFieldLookup(TableNumber: Integer; FieldNo: Integer; var FieldLookup: Record "Field");
    // begin
    //     FieldLookup.RESET();
    //     FieldLookup.SETRANGE(TableNo, TableNumber);
    //     FieldLookup.SETRANGE("No.", FieldNo);
    //     if not FieldLookup.FINDFIRST() then
    //         ERROR(Text11123312, FieldNo, TableNumber);
    // end;

    // procedure GetPrimaryKeyNo(var RecRef: RecordRef): Integer;
    // var
    //     KeyRef: KeyRef;
    //     KeyFieldRef: FieldRef;
    // begin
    //     KeyRef := RecRef.KEYINDEX(1);
    //     KeyFieldRef := KeyRef.FIELDINDEX(1);
    //     exit(KeyFieldRef.NUMBER);
    // end;

    // procedure GetEntityFields(var InXMLBuff: Record "SC - XML Buffer (dotNET)"; var OutXMLBuff: Record "SC - XML Buffer (dotNET)");
    // var
    //     AllObjRec: Record AllObj;
    //     FieldLookup: Record "Field";
    //     ResultNodeBuff: Record "SC - XML Buffer (dotNET)" temporary;
    //     Params: Record "SC - Parameters Collection" temporary;
    //     RecordRef: RecordRef;
    //     FieldRef: FieldRef;
    //     ObjectName: Text[30];
    //     RelatedTable: Text[1024];
    //     UseField: Boolean;
    // begin
    //     ObjectName := InXMLBuff.SelectSingleNodeText('//Table');

    //     ObjectName := TableNameMapping(ObjectName);

    //     AllObjRec.SetRange("Object Type", AllObjRec."Object Type"::Table);
    //     AllObjRec.SetRange("Object Name", ObjectName);
    //     AllObjRec.FindFirst;

    //     Params.InitParams(InXMLBuff, AllObjRec."Object ID");
    //     OnBeforeGetEntityFields(InXMLBuff, OutXMLBuff, Params);
    //     RecordRef.OPEN(AllObjRec."Object ID");

    //     FieldLookup.RESET();
    //     FieldLookup.SetRange(TableNo, RecordRef.NUMBER);
    //     FieldLookup.SetRange(ObsoleteState, FieldLookup.ObsoleteState::No);
    //     if FieldLookup.FINDSET() then
    //         repeat
    //             RelatedTable := '';
    //             FieldRef := RecordRef.field(FieldLookup."No.");

    //             UseField := CheckField(FieldRef);

    //             if UseField and (FieldLookup.RelationTableNo <> 0) then
    //                 if not IsTableHasComplexPrimaryKey(RecordRef) then begin
    //                     AllObjRec.RESET();
    //                     AllObjRec.SetRange("Object Type", AllObjRec."Object Type"::Table);
    //                     AllObjRec.SetRange("Object ID", FieldLookup.RelationTableNo);
    //                     if AllObjRec.FINDFIRST() then
    //                         RelatedTable := AllObjRec."Object Name";
    //                 end;

    //             if UseField then begin
    //                 OutXMLBuff.AddElement(ResultNodeBuff, 'Field', '');
    //                 ResultNodeBuff.AddFieldElement('Name', FieldNameMapping(FieldLookup.TableNo, FieldLookup.FieldName));
    //                 ResultNodeBuff.AddFieldElement('Caption', FieldLookup."Field Caption");
    //                 AddCaptionTranslationsToXml(ResultNodeBuff, FieldLookup);
    //                 ResultNodeBuff.AddFieldElement('Type', FieldTypeMapping(FORMAT(FieldLookup.Type)));
    //                 ResultNodeBuff.AddFieldElement('RelatedTable', RelatedTable);

    //                 OnAddEntityField(ResultNodeBuff, FieldLookup, Params);
    //             end;

    //             if FORMAT(FieldLookup.Type) = 'Option' then
    //                 AddOptionStringValuesToXML(ResultNodeBuff, FieldRef);

    //         until FieldLookup.NEXT() = 0;

    //     OnAfterGetEntityFields(InXMLBuff, OutXMLBuff, Params);
    //     AddItemAttributes(RecordRef, OutXMLBuff);
    // end;

    // procedure CheckField(var "Field": FieldRef): Boolean;
    // var
    //     FieldClass: Text[30];
    //     FieldType: Text[30];
    // begin
    //     if not Field.ACTIVE then
    //         exit(false);

    //     FieldType := FORMAT(Field.TYPE);

    //     if (FieldType = 'BLOB') or
    //         (FieldType = 'Binary') or
    //         (FieldType = 'TableFilter') or
    //     (FieldType = 'MediaSet') then
    //         exit(false);

    //     FieldClass := FORMAT(Field.CLASS);
    //     if (FieldClass <> 'Normal') and (FieldClass <> 'FlowField') then
    //         exit(false);

    //     exit(true);
    // end;

    // procedure GetCorrectTableNoFromRecRef(var RecRef: RecordRef): Integer;
    // var
    //     TableNumber: Integer;
    // begin
    //     TableNumber := RecRef.NUMBER;
    //     if TableNumber >= 2000100000 then
    //         TableNumber := GetTableNoByName(RecRef.NAME);
    //     exit(TableNumber);
    // end;

    // procedure GetTableNoByName(TableName: Text): Integer;
    // var
    //     AllObjWithCaption: Record 2000000058;
    // begin
    //     AllObjWithCaption.SetRange("Object Type", AllObjWithCaption."Object Type"::Table);
    //     AllObjWithCaption.SetRange("Object Name", TableName);
    //     if AllObjWithCaption.FINDFIRST() then
    //         exit(AllObjWithCaption."Object ID");
    // end;

    // procedure SetCurrentKeyByFieldName(var RecRef: RecordRef; KeyFieldName: Text[1024]; SortAscending: Boolean);
    // var
    //     KeyReference: KeyRef;
    //     KeyFieldReference: FieldRef;
    //     KeyIndex: Integer;
    //     TryToFindKey: Boolean;
    //     KeyFound: Boolean;
    // begin
    //     TryToFindKey := KeyFieldName <> '';

    //     while TryToFindKey do begin
    //         KeyIndex := KeyIndex + 1;
    //         KeyReference := RecRef.KEYINDEX(KeyIndex);
    //         if KeyReference.ACTIVE then begin
    //             KeyFieldReference := KeyReference.FIELDINDEX(1);
    //             if KeyFieldReference.NAME = KeyFieldName then
    //                 KeyFound := true;
    //         end;
    //         if KeyFound or (KeyIndex = RecRef.KEYCOUNT) then
    //             TryToFindKey := false;
    //     end;

    //     if KeyFound then begin
    //         RecRef.CURRENTKEYINDEX(KeyIndex);
    //         if not SortAscending then
    //             RecRef.ASCENDING(false);
    //     end;
    // end;

    // procedure GetFieldValueByName(var RecRef: RecordRef; FieldName: Text[1024]): Text[1024];
    // var
    //     FieldNo: Integer;
    // begin
    //     FieldNo := GetFieldNoByName(GetCorrectTableNoFromRecRef(RecRef), FieldName);
    //     If FieldNo <> 0 then
    //         exit(GetFieldValueByNo(RecRef, FieldNo));
    // end;

    // procedure GetFieldNoByName(TableNumber: Integer; Name: Text[1024]): Integer;
    // var
    //     FieldRec: Record "Field";
    // begin
    //     OnBeforeGetFieldNoByName(FieldRec, TableNumber, Name);
    //     FieldRec.SETRANGE(TableNo, TableNumber);
    //     FieldRec.SETRANGE(FieldName, Name);
    //     if FieldRec.FINDFIRST() then
    //         exit(FieldRec."No.");
    // end;

    // procedure GetFieldValueByNo(var RecRef: RecordRef; FieldNo: Integer): Text[1024];
    // var
    //     FieldRef: FieldRef;
    //     OptionValue: Integer;
    //     Type: Text[30];
    //     ReturnValue: Text[1024];
    // begin
    //     if RecRef.FIELDEXIST(FieldNo) then begin
    //         FieldRef := RecRef.FIELD(FieldNo);
    //         if CheckField(FieldRef) then
    //             Type := FORMAT(FieldRef.TYPE);
    //         case Type of
    //             'Option':
    //                 begin
    //                     OptionValue := FieldRef.VALUE;
    //                     ReturnValue := FORMAT(OptionValue);
    //                 end;
    //             'Date', 'Time', 'DateTime':
    //                 ReturnValue := FORMAT(FieldRef);
    //             else
    //                 ReturnValue := FORMAT(FieldRef, 0, 2);
    //         end;
    //     end;
    //     exit(ReturnValue);
    // end;

    // procedure CopyRecRefByFields(var FromRecRef: RecordRef; var ToRecRef: RecordRef);
    // var
    //     FromFieldRef: FieldRef;
    //     ToFieldRef: FieldRef;
    //     I: Integer;
    // begin
    //     for I := 1 to FromRecRef.FIELDCOUNT do begin
    //         FromFieldRef := FromRecRef.FIELDINDEX(I);
    //         if FORMAT(FromFieldRef.CLASS) = 'Normal' then begin
    //             ToFieldRef := ToRecRef.FIELD(FromFieldRef.NUMBER);
    //             ToFieldRef.VALUE(FromFieldRef.VALUE);
    //         end;
    //     end;
    // end;

    // procedure DuplicateRecRef(var FromRecRef: RecordRef; var ToRecRef: RecordRef);
    // begin
    //     ToRecRef := FromRecRef.DUPLICATE();
    // end;

    // local procedure GetParamsDescriptionNo(var Params: Record "SC - Parameters Collection");
    // begin
    //     Params.ItemDescriptionNo := 1;
    //     Params.VariantDescriptionNo := 1;
    // end;

    // procedure AutoSaveFields(var RecRef: RecordRef; var RootNodeBuff: Record "SC - XML Buffer (dotNET)"; var Params: Record "SC - Parameters Collection"): Boolean;
    // var
    //     ResultNodeBuff: Record "SC - XML Buffer (dotNET)" temporary;
    //     AttributeNodeBuff: Record "SC - XML Buffer (dotNET)" temporary;
    //     FieldReference: FieldRef;
    //     KeyFieldReference: FieldRef;
    //     KeyReference: KeyRef;
    //     FieldName: Text[1024];
    //     FieldValue: Text[250];
    //     FieldNo: Integer;
    //     i: Integer;
    //     CallModify: Boolean;
    //     MappedName: Text[1024];
    // begin
    //     if RootNodeBuff.SelectNodes('field', ResultNodeBuff) then
    //         while ResultNodeBuff.NextNode do begin
    //             if ResultNodeBuff.SelectSingleNode('@name', AttributeNodeBuff) then begin
    //                 if STRLEN(AttributeNodeBuff.InnerText) <= MAXSTRLEN(FieldName) then
    //                     FieldName := AttributeNodeBuff.InnerText
    //                 else
    //                     ERROR(Text11123302, AttributeNodeBuff.InnerText, MAXSTRLEN(FieldName));
    //             end else
    //                 ERROR(Text11123307);

    //             if ResultNodeBuff.SelectSingleNode('@value', AttributeNodeBuff) then
    //                 if STRLEN(AttributeNodeBuff.InnerText) <= MAXSTRLEN(FieldValue) then
    //                     FieldValue := AttributeNodeBuff.InnerText
    //                 else
    //                     ERROR(Text11123302, AttributeNodeBuff.InnerText, MAXSTRLEN(FieldValue));

    //             MappedName := FieldNameMapping(RecRef.NUMBER, FieldName);
    //             FieldNo := GetFieldNoByName(RecRef.NUMBER, MappedName);
    //             if FieldNo <> 0 then begin
    //                 FieldReference := RecRef.FIELD(FieldNo);

    //                 if FORMAT(FieldReference.CLASS) <> 'Normal' then
    //                     ERROR(Text11123304, FieldName, RecRef.NAME);

    //                 if not FieldReference.ACTIVE then
    //                     ERROR(Text11123305, FieldName, RecRef.NAME);

    //                 KeyReference := RecRef.KEYINDEX(1);
    //                 for i := 1 to KeyReference.FIELDCOUNT do begin
    //                     KeyFieldReference := KeyReference.FIELDINDEX(i);
    //                     if KeyFieldReference.NUMBER = FieldReference.NUMBER then
    //                         ERROR(Text11123308, FieldName, RecRef.NAME);
    //                 end;

    //                 if FieldValue <> '' then
    //                     if EVALUATE(FieldReference, FieldValue) then
    //                         CallModify := true
    //                     else
    //                         ERROR(Text11123306, FieldValue, FieldName, RecRef.NAME);

    //                 AddAutoSaveFieldList(FieldName, FieldValue, Params);
    //             end;
    //         end;

    //     if CallModify then
    //         RecRef.MODIFY;
    // end;

    // procedure FieldTypeMapping(NavFieldType: Text[50]): Text[50];
    // var
    //     DotNetFieldType: Text[50];
    // begin
    //     DotNetFieldType := NavFieldType;

    //     case NavFieldType of
    //         'Char', 'Code', 'Text', 'BigText', 'DateFormula':
    //             DotNetFieldType := 'String';
    //         'Option':
    //             DotNetFieldType := 'Enum';
    //     end;

    //     exit(DotNetFieldType);
    // end;

    // procedure IsCustomFieldNo(FieldNo: Integer): Boolean;
    // begin
    //     if FieldNo = 0 then
    //         exit(true);

    //     if FieldNo >= 50000 then
    //         if FieldNo <= 99999 then
    //             exit(true);
    // end;

    // procedure AddOptionStringValuesToXML(var ResultNodeBuff: Record "SC - XML Buffer (dotNET)"; FieldRef: FieldRef);
    // var
    //     OptionStringNodesBuff: Record "SC - XML Buffer (dotNET)" temporary;
    //     OptionStringNodeBuff: Record "SC - XML Buffer (dotNET)" temporary;
    //     OptionId: Integer;
    //     OptionStringValue: Text[1024];
    //     TempStringValue: Text[1024];
    // begin
    //     ResultNodeBuff.AddElement(OptionStringNodesBuff, 'EnumMembers', '');
    //     OptionStringValue := FieldRef.OptionMembers;
    //     TempStringValue := OptionStringValue;

    //     while STRLEN(TempStringValue) <> 0 do begin
    //         if STRPOS(TempStringValue, ',') <> 0 then begin
    //             OptionStringValue := COPYSTR(TempStringValue, 1, STRPOS(TempStringValue, ',') - 1);
    //             TempStringValue := COPYSTR(TempStringValue, 1 + STRPOS(TempStringValue, ','));
    //         end else begin
    //             OptionStringValue := TempStringValue;
    //             TempStringValue := '';
    //         end;

    //         if OptionStringValue <> '' then begin
    //             OptionStringNodesBuff.AddElement(OptionStringNodeBuff, 'EnumMember', '');
    //             OptionStringNodeBuff.AddFieldElement('Value', FORMAT(OptionId));
    //             OptionStringNodeBuff.AddFieldElement('Caption', FORMAT(OptionStringValue));
    //             AddOptionMemberTranslationsXml(OptionStringNodeBuff, FieldRef, OptionId)
    //         end;

    //         OptionId += 1;
    //     end;
    // end;





    // procedure AddAutoSaveFieldList(FieldName: Text[1024]; FieldValue: Text[250]; var Params: Record "SC - Parameters Collection");
    // begin
    //     Params.SetAutoSaveListValue(FieldName, FieldValue);
    // end;

    // procedure AddAutoSaveFieldsXML(var ResultNodeBuff: Record "SC - XML Buffer (dotNET)"; var Params: Record "SC - Parameters Collection");
    // var
    //     TempAutoSaveFieldList: Record "SC - Key Value" temporary;
    // begin
    //     if Params.AutoSaveFieldListIsEmpty then
    //         exit;

    //     Params.GetAutoSaveFieldList(TempAutoSaveFieldList);
    //     if TempAutoSaveFieldList.FINDSET() then
    //         repeat
    //             ResultNodeBuff.AddFieldElement(TempAutoSaveFieldList.Key, TempAutoSaveFieldList.Value);
    //         until TempAutoSaveFieldList.NEXT() = 0;
    // end;

    // procedure GetMaxStrLenValue(InValue: Text; RecRef: RecordRef; FieldName: Text[30]) OutValue: Text;
    // var
    //     FieldRef: FieldRef;
    //     CommonFunc: Codeunit "SC - Common Functions";
    //     FieldNo: Integer;
    // begin
    //     FieldNo := CommonFunc.GetFieldNoByName(RecRef.NUMBER(), FieldName);
    //     FieldRef := RecRef.FIELD(FieldNo);
    //     OutValue := COPYSTR(InValue, 1, FieldRef.LENGTH());
    //     RecRef.CLOSE();
    // end;

    // procedure AddCaptionTranslationsToXml(var ResultNodeBuff: Record "SC - XML Buffer (dotNET)"; FieldLookup: Record "Field");
    // var
    //     WinLanguage: Record "Windows Language";
    //     TranslatedField: Record "Field";
    //     DefaultServiceLangId: Integer;
    //     DefaultEngFieldCaption: Text[80];
    //     EngCaptionInitialized: Boolean;
    // begin
    //     DefaultServiceLangId := GlobalLanguage;
    //     WinLanguage.SetRange("STX File Exist", true);
    //     If WinLanguage.FindSet() then
    //         repeat
    //             GlobalLanguage(WinLanguage."Language ID");

    //             IF TranslatedField.get(FieldLookup.TableNo, FieldLookup."No.") then
    //                 If DefaultServiceLangId = 1033 then begin
    //                     IF FieldLookup."Field Caption" <> TranslatedField."Field Caption" then
    //                         ResultNodeBuff.AddFieldElement(StrSubstNo('%1_%2', 'Caption', WinLanguage."Language ID"), TranslatedField."Field Caption");
    //                 end else begin
    //                     If not EngCaptionInitialized then begin
    //                         GlobalLanguage(1033);
    //                         DefaultEngFieldCaption := TranslatedField."Field Caption";
    //                         EngCaptionInitialized := true;

    //                         If DefaultEngFieldCaption <> '' then
    //                             ResultNodeBuff.AddFieldElement(StrSubstNo('%1_%2', 'Caption', 1033), TranslatedField."Field Caption");
    //                         GlobalLanguage(WinLanguage."Language ID");
    //                     end;

    //                     IF not (TranslatedField."Field Caption" in [FieldLookup."Field Caption", DefaultEngFieldCaption]) then
    //                         ResultNodeBuff.AddFieldElement(StrSubstNo('%1_%2', 'Caption', WinLanguage."Language ID"), TranslatedField."Field Caption");
    //                 end;

    //         until WinLanguage.Next() = 0;

    //     GlobalLanguage(DefaultServiceLangId);
    // end;

    // procedure AddOptionMemberTranslationsXml(var OptionStringNodeBuff: Record "SC - XML Buffer (dotNET)"; FieldRef: FieldRef; OptionId: Integer)
    // var
    //     WinLanguage: Record "Windows Language";
    //     DefaultOptionCaption: Text;
    //     TranslatedOptionCaption: Text;
    //     DefEngOptionCaption: Text;
    //     DefaultServiceLangId: Integer;
    //     EngCaptionInitialized: Boolean;
    // begin
    //     WinLanguage.SetRange("STX File Exist", true);
    //     If WinLanguage.FindSet() then begin
    //         DefaultServiceLangId := GlobalLanguage;
    //         DefaultOptionCaption := FieldRef.OptionCaption;
    //         DefaultOptionCaption := SelectStr(OptionId + 1, DefaultOptionCaption);
    //         repeat
    //             GlobalLanguage(WinLanguage."Language ID");

    //             TranslatedOptionCaption := FieldRef.OptionCaption;
    //             TranslatedOptionCaption := SelectStr(OptionId + 1, TranslatedOptionCaption);

    //             if TranslatedOptionCaption <> '' then
    //                 If DefaultServiceLangId = 1033 then begin
    //                     IF DefaultOptionCaption <> TranslatedOptionCaption then
    //                         OptionStringNodeBuff.AddFieldElement(StrSubstNo('%1_%2', 'Caption', WinLanguage."Language ID"), FORMAT(TranslatedOptionCaption));
    //                 end else begin
    //                     If not EngCaptionInitialized then begin
    //                         GlobalLanguage(1033);
    //                         DefEngOptionCaption := FieldRef.OptionCaption;
    //                         DefEngOptionCaption := SelectStr(OptionId + 1, DefEngOptionCaption);
    //                         EngCaptionInitialized := true;
    //                         If DefEngOptionCaption <> '' then
    //                             OptionStringNodeBuff.AddFieldElement(StrSubstNo('%1_%2', 'Caption', 1033), FORMAT(DefEngOptionCaption));
    //                         GlobalLanguage(WinLanguage."Language ID");
    //                     end;

    //                     IF not (TranslatedOptionCaption in [DefEngOptionCaption, DefaultOptionCaption]) then
    //                         OptionStringNodeBuff.AddFieldElement(StrSubstNo('%1_%2', 'Caption', WinLanguage."Language ID"), FORMAT(TranslatedOptionCaption));
    //                 end;
    //         until WinLanguage.Next() = 0;
    //         GlobalLanguage(DefaultServiceLangId);
    //     end;
    // end;

    // procedure CompatbltyLevelGreaterOrEqual(Version: text[20]): Boolean
    // var
    //     Result: Integer;
    //     CompatibilityLevel: Text[20];
    // begin
    //     CompatibilityLevel := Context.GetCompatibilityLevel();
    //     Result := CompareVersions(CompatibilityLevel, Version);

    //     If Result < 0 then
    //         exit(false);

    //     exit(true);
    // end;

    // procedure CompareVersions(Version1: text[20]; Version2: Text[20]): Integer
    // var
    //     Arr1: array[3] of Integer;
    //     Arr2: array[3] of Integer;
    //     i: Integer;
    //     TempStr: Text;
    // begin
    //     TempStr := ConvertStr(Version1, '.', ',');
    //     evaluate(Arr1[1], SelectStr(1, TempStr));
    //     evaluate(Arr1[2], SelectStr(2, TempStr));
    //     evaluate(Arr1[3], SelectStr(3, TempStr));

    //     TempStr := ConvertStr(Version2, '.', ',');
    //     evaluate(Arr2[1], SelectStr(1, TempStr));
    //     evaluate(Arr2[2], SelectStr(2, TempStr));
    //     evaluate(Arr2[3], SelectStr(3, TempStr));

    //     while i < ArrayLen(Arr1) do begin
    //         i += 1;
    //         If Arr2[i] > Arr1[i] then
    //             exit(-1); // Version1 is smaller

    //         if Arr1[i] > Arr2[i] then
    //             exit(1);  // Version2 is greater
    //     end;
    //     exit(0); // Version1 = Version2
    // end;

    // procedure SupportsItemTypes(): Boolean
    // var
    //     RecRef: RecordRef;
    // begin
    //     RecRef.Open(Database::Item);
    //     exit(RecRef.FieldExist(10)); // Type
    // end;

    // procedure SupportsNonInventoryTypes(): Boolean
    // begin
    //     exit(SupportsItemTypes);
    // end;

    // procedure SetMappedDataValue(var RecRef: RecordRef; var Params: record "SC - Parameters Collection")
    // var
    //     WebshopDataMapping: Record "SC - Webshop Data Mapping";
    //     FromFieldRef: FieldRef;
    //     ToFieldRef: FieldRef;
    //     VarFieldRef: Variant;
    //     IntValue: Integer;
    //     DecValue: Decimal;
    //     TextValue: Text;
    //     DateValue: date;
    //     DateTimeValue: DateTime;
    //     BoolValue: Boolean;
    //     BoolValue2: Boolean;
    //     IsHandled: Boolean;
    //     ModifyRequired: Boolean;
    //     OptValue: Option;
    //     GuidValue: Guid;
    // begin
    //     if IsHandled then
    //         exit;

    //     IF RecRef.ISTEMPORARY then
    //         EXIT;

    //     WebshopDataMapping.SetRange("Webshop ID", Params.WebsiteId);
    //     WebshopDataMapping.SetRange("Table No.", RecRef.Number);
    //     if WebshopDataMapping.FindSet() then
    //         repeat
    //             ToFieldRef := RecRef.Field(WebshopDataMapping."Field No.");
    //             VarFieldRef := ToFieldRef.Value;
    //             case true of
    //                 VarFieldRef.IsCode,
    //                 VarFieldRef.IsText:
    //                     if WebshopDataMapping.Mapping then begin
    //                         FromFieldRef := RecRef.Field(WebshopDataMapping."Mapped Field No.");
    //                         ToFieldRef.Validate(FromFieldRef.Value);
    //                         FromFieldRef.Validate('');
    //                         ModifyRequired := true;
    //                     end else begin
    //                         TextValue := Format(VarFieldRef);
    //                         ModifyRequired := TextValue = '';
    //                         if ModifyRequired then
    //                             ToFieldRef.Validate(WebshopDataMapping."Default Value");
    //                     end;
    //                 VarFieldRef.IsInteger:
    //                     if WebshopDataMapping.Mapping then begin
    //                         FromFieldRef := RecRef.Field(WebshopDataMapping."Mapped Field No.");
    //                         ToFieldRef.Validate(FromFieldRef.Value);
    //                         FromFieldRef.Validate(0);
    //                         ModifyRequired := true;
    //                     end else begin
    //                         Evaluate(IntValue, Format(VarFieldRef));
    //                         ModifyRequired := IntValue = 0;
    //                         if ModifyRequired then
    //                             ToFieldRef.Validate(WebshopDataMapping."Integer Equivalent");
    //                     end;
    //                 VarFieldRef.IsDecimal:
    //                     if WebshopDataMapping.Mapping then begin
    //                         FromFieldRef := RecRef.Field(WebshopDataMapping."Mapped Field No.");
    //                         ToFieldRef.Validate(FromFieldRef.Value);
    //                         FromFieldRef.Validate(0);
    //                         ModifyRequired := true;
    //                     end else begin
    //                         Evaluate(DecValue, Format(VarFieldRef));
    //                         ModifyRequired := DecValue = 0;
    //                         if ModifyRequired then begin
    //                             Evaluate(DecValue, WebshopDataMapping."Default Value");
    //                             ToFieldRef.Validate(DecValue);
    //                         end
    //                     end;
    //                 VarFieldRef.IsDate:
    //                     if WebshopDataMapping.Mapping then begin
    //                         FromFieldRef := RecRef.Field(WebshopDataMapping."Mapped Field No.");
    //                         ToFieldRef.Validate(FromFieldRef.Value);
    //                         FromFieldRef.Validate(0D);
    //                         ModifyRequired := true;
    //                     end else begin
    //                         Evaluate(DateValue, Format(VarFieldRef));
    //                         ModifyRequired := DateValue = 0D;
    //                         if ModifyRequired then begin
    //                             Evaluate(DateValue, WebshopDataMapping."Default Value");
    //                             ToFieldRef.Validate(DateValue);
    //                         end;
    //                     end;
    //                 VarFieldRef.IsDateTime:
    //                     if WebshopDataMapping.Mapping then begin
    //                         FromFieldRef := RecRef.Field(WebshopDataMapping."Mapped Field No.");
    //                         ToFieldRef.Validate(FromFieldRef.Value);
    //                         FromFieldRef.Validate(0DT);
    //                         ModifyRequired := true;
    //                     end else begin
    //                         Evaluate(DateTimeValue, Format(VarFieldRef));
    //                         ModifyRequired := DateTimeValue = 0DT;
    //                         if ModifyRequired then begin
    //                             Evaluate(DateTimeValue, WebshopDataMapping."Default Value");
    //                             ToFieldRef.Validate(DateTimeValue);
    //                         end;
    //                     end;
    //                 VarFieldRef.IsBoolean:
    //                     if WebshopDataMapping.Mapping then begin
    //                         FromFieldRef := RecRef.Field(WebshopDataMapping."Mapped Field No.");
    //                         ToFieldRef.Validate(FromFieldRef.Value);
    //                         FromFieldRef.Validate(false);
    //                         ModifyRequired := true;
    //                     end else begin
    //                         Evaluate(BoolValue, Format(VarFieldRef));
    //                         Evaluate(BoolValue2, WebshopDataMapping."Default Value");
    //                         ModifyRequired := (BoolValue = false) and BoolValue <> BoolValue2;
    //                         if ModifyRequired then
    //                             ToFieldRef.Validate(BoolValue2);
    //                     end;
    //                 VarFieldRef.IsOption:
    //                     if WebshopDataMapping.Mapping then begin
    //                         FromFieldRef := RecRef.Field(WebshopDataMapping."Mapped Field No.");
    //                         ToFieldRef.Validate(FromFieldRef.Value);
    //                         FromFieldRef.Validate(0);
    //                         ModifyRequired := true;
    //                     end else begin
    //                         Evaluate(IntValue, Format(VarFieldRef, 0, 2));
    //                         ModifyRequired := (IntValue = 0) and (IntValue <> WebshopDataMapping."Integer Equivalent");
    //                         if ModifyRequired then begin
    //                             OptValue := WebshopDataMapping."Integer Equivalent";
    //                             ToFieldRef.Validate(OptValue);
    //                         end;
    //                     end;
    //                 VarFieldRef.IsGuid:
    //                     if WebshopDataMapping.Mapping then begin
    //                         FromFieldRef := RecRef.Field(WebshopDataMapping."Mapped Field No.");
    //                         ToFieldRef.Validate(FromFieldRef.Value);
    //                         FromFieldRef.Validate('{00000000-0000-0000-0000-000000000000}');
    //                         ModifyRequired := true;
    //                     end else begin
    //                         Evaluate(GuidValue, Format(VarFieldRef));
    //                         ModifyRequired := IsNullGuid(GuidValue);
    //                         if ModifyRequired then begin
    //                             Evaluate(GuidValue, WebshopDataMapping."Default Value");
    //                             ToFieldRef.Validate(GuidValue);
    //                         end
    //                     end;
    //             end;
    //             if ModifyRequired then
    //                 RecRef.Modify();
    //         until WebshopDataMapping.Next() = 0;

    // end;
}

