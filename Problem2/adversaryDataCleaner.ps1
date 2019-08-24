class result {
    [int]$reconInLast10
    [int]$reconInLast30
    [int]$reconInLast60
    [int]$reconInLast90
    [int]$reconInLast120
    [int]$reconInLast150
    [int]$reconInLast180
    [int]$reconInLast210
    [int]$reconInLast240
    [int]$reconInLast270
    [int]$reconInLast300
    [int]$reconInLast330
    [int]$reconInLast360
    [int]$reconInLast390
    [int]$reconInLast420
    [int]$reconInLast450
    [int]$reconInLast480
    [int]$reconInLast510
    [int]$reconInLast540
    [int]$reconInLast570
    [int]$reconInLast600
    [int]$attackType
}

$alldata = import-csv .\final_combined.csv

#Modify this for a different adversary ID
$adversaryData = $allData | where adversary -eq 7b0835dc-5d4d-4e40-8c8f-e92a47d71eb7
$adversaryData | Export-Csv -NoTypeInformation adversary1_raw.csv

$attacks = $adversaryData | where classInfo -eq 1
$recon = $adversaryData | where classInfo -eq 0

$results = @()
foreach ($a in $attacks) {
    $result = [result]::new()
    
    if ($a.exploit -eq 1) {$result.attackType = 1}
    if ($a.malware -eq 1) {$result.attackType = 2}
    if ($a.rootkit -eq 1) {$result.attackType = 3}
    if ($a.ddos -eq 1) {$result.attackType = 4}
    if ($a.trojan -eq 1) {$result.attackType = 5}


    foreach ($r in $recon) {
        $numDays = ([datetime]::Parse($a.created) - [datetime]::Parse($r.created)).totalDays
        if ($numDays -gt 0 -and $numDays -lt 10) {$result.reconInLast10 = 1}
        elseif ($numDays -gt 9 -and $numDays -lt 30) {$result.reconInLast30 = 1}
        elseif ($numDays -gt 29 -and $numDays -lt 60) {$result.reconInLast60 = 1}
        elseif ($numDays -gt 59 -and $numDays -lt 90) {$result.reconInLast90 = 1}
        elseif ($numDays -gt 89 -and $numDays -lt 120) {$result.reconInLast120 = 1}
        elseif ($numDays -gt 119 -and $numDays -lt 150) {$result.reconInLast150 = 1}
        elseif ($numDays -gt 149 -and $numDays -lt 180) {$result.reconInLast180 = 1}
        elseif ($numDays -gt 179 -and $numDays -lt 210) {$result.reconInLast210 = 1}
        elseif ($numDays -gt 209 -and $numDays -lt 240) {$result.reconInLast240 = 1}
        elseif ($numDays -gt 239 -and $numDays -lt 270) {$result.reconInLast270 = 1}
        elseif ($numDays -gt 269 -and $numDays -lt 300) {$result.reconInLast300 = 1}
        elseif ($numDays -gt 299 -and $numDays -lt 330) {$result.reconInLast330 = 1}
        elseif ($numDays -gt 329 -and $numDays -lt 360) {$result.reconInLast360 = 1}
        elseif ($numDays -gt 359 -and $numDays -lt 390) {$result.reconInLast390 = 1}
        elseif ($numDays -gt 389 -and $numDays -lt 420) {$result.reconInLast420 = 1}
        elseif ($numDays -gt 419 -and $numDays -lt 450) {$result.reconInLast450 = 1}
        elseif ($numDays -gt 449 -and $numDays -lt 480) {$result.reconInLast480 = 1}
        elseif ($numDays -gt 479 -and $numDays -lt 510) {$result.reconInLast510 = 1}
        elseif ($numDays -gt 509 -and $numDays -lt 540) {$result.reconInLast540 = 1}
        elseif ($numDays -gt 539 -and $numDays -lt 570) {$result.reconInLast570 = 1}
        elseif ($numDays -gt 569 -and $numDays -lt 600) {$result.reconInLast600 = 1}
    }
    $results += $result
}

$results | export-csv -NoTypeInformation adversary1_data.csv
