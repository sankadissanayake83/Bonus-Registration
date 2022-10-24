/// <summary>
/// PageExtension "MNB Customer List" (ID 50140) extends Page "Customer List".
/// </summary>
pageextension 50140 "MNB Customer List" extends "Customer List"
{
    layout
    {
        addlast(Control1)
        {
            field("MNB Bonus"; rec."MNB Bonuses")
            {
                Caption = 'Bonuses';
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        addlast(navigation)
        {
            action(MNBBonuses)
            {
                Caption = 'MNB Bonuses';
                ApplicationArea = All;
                ToolTip = 'Open the List of Bonuses Assigned to the Customer.';
                Image = Discount;
                RunObject = page "MNB Bonus List";
                RunPageLink = "Customer No." = field("No.");
            }
        }
    }

}