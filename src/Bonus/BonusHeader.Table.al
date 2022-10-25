/// <summary>
/// Table BonusHeader.Table (ID 50140).
/// </summary>
table 50140 "MNB Bonus Header"
{
    Caption = 'Bonus';
    DataClassification = ToBeClassified;
    DrillDownPageId = "MNB Bonus List";
    LookupPageId = "MNB Bonus List";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                TestStatus();
            end;
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer;
            DataClassification = ToBeClassified;
        }
        field(3; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if "Ending Date" < "Starting Date" then
                    "Ending Date" := "Starting Date";
            end;
        }
        field(4; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if "Ending Date" < "Starting Date" then
                    "Starting Date" := "Ending Date";
            end;
        }
        field(5; "Status"; Enum "MNB Bonus Header Status")
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnDelete()
    begin
        TestStatus();
        DeleteLines();
    end;

    var
        StatusCannotBeReleasedErr: Label 'Status Cannot Be %1', Comment = '%1 - Status field value';

    local procedure TestStatus()
    begin
        if Status = Status::Released then
            Error(StatusCannotBeReleasedErr, Status);
    end;

    var
        BonusLine: Record "MNB Bonus Line";

    local procedure DeleteLines()
    begin
        BonusLine.SetRange("Document No.", "No.");
        BonusLine.DeleteAll(true);
    end;
}
