pageextension 50100 "Ext. Sales Order Subform" extends "Sales Order Subform"
{
    layout
    {
        addlast(content)
        {
            usercontrol(SetFieldFocus; SetFieldFocus)
            {
                ApplicationArea = All;
                trigger Ready()
                begin
                    CurrPage.SetFieldFocus.SetFocusOnField('No.');
                end;
            }
        }
        modify("No.")
        {
            trigger OnAfterValidate()
            begin
                CurrPage.SetFieldFocus.SetFocusOnField('Quantity');
            end;
        }
        modify(Quantity)
        {
            trigger OnAfterValidate()
            begin
                CurrPage.SetFieldFocus.SetFocusOnField('Unit Price');
            end;
        }
        modify("Unit Price")
        {
            trigger OnAfterValidate()
            begin
                CurrPage.SetFieldFocus.SetFocusOnField('Qty. to Ship');
            end;
        }
        modify("Qty. to Ship")
        {
            trigger OnAfterValidate()
            begin
                if (Rec."Qty. to Ship" > 0) then
                    CurrPage.SetFieldFocus.SetFocusOnField('Planned Delivery Date');
            end;
        }
    }
}