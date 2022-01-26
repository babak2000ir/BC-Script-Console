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
                    CurrPage.UniversalLookupTable.ShowRecords(UniversalLookupMgmt.GetTableRecord(Database::Customer, 50, 1));
                end;
            }

        }
    }

    var
        UniversalLookupMgmt: Codeunit "Universal Lookup Mgmt.";
}