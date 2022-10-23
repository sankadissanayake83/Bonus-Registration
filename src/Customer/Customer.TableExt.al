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
}