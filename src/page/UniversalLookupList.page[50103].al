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

                end;
            }
        }
    }

    var
        myInt: Integer;
}