// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 "Inbound Sales Doc List scr" extends "Inbound Sales Document List nH"
{
    actions
    {
        addlast(processing)
        {
            action(DeleteBatch)
            {
                Caption = 'Script - Delete Selected Batch';
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    InboundSalesDoc: Record "Inbound Sales Header nH";
                    InboundSalesLine: Record "Inbound Sales Line nH";
                    InboundSalesFee: Record "Inbound Sales Fee nH";
                begin
                    SetSelectionFilter(InboundSalesDoc);
                    InboundSalesDoc.FindSet();
                    repeat
                        InboundSalesFee.reset;
                        InboundSalesFee.SetRange("Header ID", InboundSalesDoc.ID);
                        InboundSalesFee.DeleteAll(false);

                        InboundSalesLine.reset;
                        InboundSalesLine.SetRange("Header ID", InboundSalesDoc.ID);
                        InboundSalesLine.DeleteAll(false);

                        InboundSalesDoc.Delete(false);
                    until InboundSalesDoc.Next() = 0;
                end;
            }
        }
    }

}