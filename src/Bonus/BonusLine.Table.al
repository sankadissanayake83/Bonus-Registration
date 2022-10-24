/// <summary>
/// Table MNB Bonus Line (ID 50141).
/// </summary>
table 50141 "MNB Bonus Line"
{
    DataClassification = CustomerContent;
    Caption = 'Bonus Line';

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Document No.';
            TableRelation = "MNB Bonus Header";
        }
        field(2; "Type"; Enum "MNB Bonus Line Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Type';
        }
        field(3; "Item No."; Code[10])
        {
            TableRelation = if (type = filter(Item)) Item;
            DataClassification = CustomerContent;
            Caption = 'Item No.';
        }
        field(4; "Bonus Perc."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Bonus Percentage';
            MinValue = 0;
            MaxValue = 100;
        }
    }

    keys
    {
        key(PK1; "Document No.", Type, "Item No.")
        {
            Clustered = true;
        }
    }
    trigger OnDelete()
    begin
        TestStatus()
    end;

    trigger OnInsert()
    begin
        TestStatus();
    end;

    trigger OnModify()
    begin
        TestStatus();
    end;

    trigger OnRename()
    begin
        TestStatus();
    end;

    var
        StatusCannotBeReleasedErr: Label 'Status Cannot Be %1', Comment = '%1 - Status field value';

    local procedure TestStatus()
    var
        BonusHeader: Record "MNB Bonus Header";
    begin
        if BonusHeader.Get(Rec."Document No.") then
            if BonusHeader.Status = BonusHeader.Status::Released then
                Error(StatusCannotBeReleasedErr, BonusHeader.Status);
    end;

}