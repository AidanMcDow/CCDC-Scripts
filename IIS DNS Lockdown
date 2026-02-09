# 1. Prevent Non-Domain Devices from Adding Themselves
$Zones = Get-DnsServerZone | Where-Object { $_.IsReverseLookupZone -eq $false -and $_.ZoneType -eq "Primary" }
foreach ($Zone in $Zones) {
    Write-Host "Setting Secure Updates only for Zone: $($Zone.ZoneName)"
    Set-DnsServerPrimaryZone -Name $Zone.ZoneName -DynamicUpdate Secure
}

# 2. Disable DNS Recursion
Set-DnsServerRecursion -EnableRecursion $false
Write-Host "DNS Recursion Disabled."

# 3. Enable DNS Cache Locking
Set-DnsServerCache -CacheLockingPercent 96
Write-Host "DNS Cache Locked"

# 4. Enable Response Rate Limiting
Set-DnsServerResponseRateLimiting -Mode Enable
Write-Host "Response Rate Limiting Enabled."


# 6. Enable Scavenging of Stale Records
Set-DnsServerScavenging -ScavengingState $true -ScavengingInterval 7.00:00:00
Write-Host "Stale Record Scavenging Enabled (7-day interval)."
