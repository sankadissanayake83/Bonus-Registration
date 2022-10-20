/// <summary>
/// Unknown BonusReg.Permission (ID 50140).
/// </summary>
permissionset 50140 "BonusReg.Permission"
{
    Assignable = true;
    Caption = 'Bonus Reg. Permission Set', MaxLength = 30;
    Permissions =
        table "MNB Bonus Header" = X,
        tabledata "MNB Bonus Header" = RMID;
}
