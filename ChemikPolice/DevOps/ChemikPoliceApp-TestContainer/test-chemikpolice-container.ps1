$count = 0
do {
    $count++
    Write-Output "[$env:STAGE_NAME] Testing chemikpolice container [Attempt: $count]"
    
    $testStart = Invoke-WebRequest -Uri http://localhost:32769
    
    if ($testStart.statuscode -eq '200') {
        $started = $true
    } else {
        Start-Sleep -Seconds 1
    }
    
} until ($started -or ($count -eq 3))

if (!$started) {
    exit 1
}