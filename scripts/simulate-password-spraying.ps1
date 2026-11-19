$TestPassword = Read-Host "Enter one incorrect password for all 10 lab accounts"

$StartTime = Get-Date
Write-Host "Started:" $StartTime.ToString("o")

foreach ($Number in 1..10) {
    $UserName = "labuser{0:D2}" -f $Number

    Write-Host "`nTesting: SOCLAB\$UserName"

    net.exe use '\\192.168.56.10\IPC$' $TestPassword "/user:SOCLAB\$UserName" /persistent:no

    if ($LASTEXITCODE -eq 0) {
        net.exe use '\\192.168.56.10\IPC$' /delete /y
        Write-Warning "Unexpected successful connection. Stopping the simulation."
        break
    }

    Start-Sleep -Seconds 3
}

Remove-Variable TestPassword

Write-Host "Finished:" (Get-Date).ToString("o")
