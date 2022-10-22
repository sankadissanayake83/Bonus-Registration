/// <summary>
/// Page MNB Bonus Subform (ID 50143).
/// </summary>
page 50143 "MNB Bonus Subform"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "MNB Bonus Line";
    Caption = 'Lines';

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    Tooltip = 'Specifies the type of the bonus assigned.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies item number for which bonus is assigned.';
                }
                field("Bonus Perc."; Rec."Bonus Perc.")
                {
                    ApplicationArea = All;
                    Tooltip = 'Specifies bonus percent.';
                }
            }
        }
    }

}