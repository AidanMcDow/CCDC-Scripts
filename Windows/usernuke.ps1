#Input users to keep
$AllowedUsers = @("Administrator", "Guest", "YourMainAccount", "ITAdmin")

$AllLocalUsers = Get-LocalUser

foreach ($User in $AllLocalUsers) {
    if ($AllowedUsers -notcontains $User.Name) {
        Write-Host "Removing user: $($User.Name)" -ForegroundColor Yellow
        try {
            Remove-LocalUser -Name $User.Name -ErrorAction Stop
            Write-Host "Successfully removed $($User.Name)" -ForegroundColor Green
        }
        catch {
            Write-Warning "Could not remove $($User.Name). Reason: $($_.Exception.Message)"
        }
    }
    else {
        Write-Host "Skipping allowed user: $($User.Name)" -ForegroundColor Cyan
    }
}
