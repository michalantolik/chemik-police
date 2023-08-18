$count = 0
do {
    $count++
    Write-Output "[$env:STAGE_NAME] Testing chemikpolice app running in container [Attempt: $count]"
    Write-Output "[$env:STAGE_NAME] Running command: 'Invoke-WebRequest -Uri http://host.docker.internal:32769'"

    $testStart = Invoke-WebRequest -Uri http://host.docker.internal:32769
    
    if ($testStart.statuscode -eq '200') {
        $started = $true
        Write-Output "[$env:STAGE_NAME] StatusCode == 200 --> chemcikpolice app is running fine"
    } else {
        Start-Sleep -Seconds 1
    }
    
} until ($started -or ($count -eq 3))

if (!$started) {
    Write-Output "[$env:STAGE_NAME] StatusCode != 200 --> chemcikpolice app failed to run !!!"
    exit 1
}
