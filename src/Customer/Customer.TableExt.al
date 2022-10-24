/// <summary>
/// MNB Customer 50140 Customer Table Extension
/// </summary>
tableextension 50140 "MNB Customer" extends Customer
{
    fields
    {
        field(50140; "MNB Bonuses"; Integer)
        {
            caption = 'Bonuses';
            FieldClass = FlowField;
            CalcFormula = count("MNB Bonus Header" where("Customer No." = field("No.")));
            Editable = false;
        }
    }

    trigger OnBeforeDelete()
    begin
        TestIfBonusExists();
    end;

    var
        AtLeaseOneBonusForOneCustomerExistsErr: Label 'At Least One Bonuse for Customer %1 Exists.', Comment = '%1 - Custmer Name';

    local procedure TestIfBonusExists()
    var
        BonusHeader: Record "MNB Bonus Header";
    begin
        BonusHeader.SetRange("Customer No.", Rec."No.");
        if not BonusHeader.IsEmpty then
            error(AtLeaseOneBonusForOneCustomerExistsErr, Rec.Name);
    end;

}