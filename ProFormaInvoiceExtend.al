codeunit 50123 EventHandler
{
    [EventSubscriber(ObjectType::Report, Report::"Standard Sales - Pro Forma Inv", OnAfterLineOnPreDataItem, '', false, false)]
    local procedure PFInvOnAfterLineOnPreDataItem(var SalesLine: Record "Sales Line")
    begin
        SalesLine.SetRange(Type);
    end;

    [EventSubscriber(ObjectType::Report, Report::"Standard Sales - Pro Forma Inv", OnBeforeGetItemForRec, '', false, false)]
    local procedure PFInvOnBeforeGetItemForRec(var IsHandled: Boolean)
    begin
        IsHandled := true;
    end;
}

reportextension 50123 StandardSalesProFormaInvExt extends "Standard Sales - Pro Forma Inv"
{
    dataset
    {
        modify(Line)
        {
            trigger OnBeforeAfterGetRecord()
            begin
                if Item.Get(Line."No.") then;
            end;
        }
    }
}
