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
            group(GroupName)
            {
            }
            usercontrol(UniversalLookupTable; "Universal Lookup Table")
            {
                ApplicationArea = all;

                trigger MyEvent(pData: Text)
                begin
                    Message(pData);
                end;
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    CurrPage.UniversalLookupTable.MyProcedure('This message is from BC');
                end;
            }
        }
    }
}