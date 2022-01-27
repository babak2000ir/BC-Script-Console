page 50103 "Universal Lookup List"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Name/Value Buffer";

    layout
    {
        area(Content)
        {
            usercontrol(UniversalLookupTable; "Universal Lookup Table")
            {
                ApplicationArea = all;

                trigger IsReady()
                begin
                    CurrPage.UniversalLookupTable.ShowRecords(UniversalLookupMgmt.GetTableRecord(gTableId, 50, 1));
                end;
            }

        }
    }

    procedure SetTableId(ptableId: Integer)
    begin
        gTableId := ptableId;
    end;

    var
        UniversalLookupMgmt: Codeunit "Universal Lookup Mgmt.";
        gTableId: Integer;
}