/// <summary>
/// permissionset BonusReg.Permission (ID 50140).
/// </summary>
permissionset 50140 "BonusReg.Permission"
{
    Assignable = true;
    Caption = 'Bonus Reg. Permission Set';
    Permissions =
        table "MNB Bonus Header" = X,
        tabledata "MNB Bonus Header" = RMID,
        tabledata "MNB Bonus Line" = RMID;
}