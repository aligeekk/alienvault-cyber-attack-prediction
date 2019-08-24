class instance {
    [string]$description
    [string]$created
    [string]$modified
    [string]$adversary
    [string]$name
    [int]$js
    [int]$html
    [int]$doc
    [int]$iframe
    [int]$script
    [int]$php
    [int]$vbscripts
    [int]$downloader
    [int]$dropper
    [int]$crypt
    [int]$exploit
    [int]$riskware
    [int]$malware
    [int]$trojan
    [int]$injector
    [int]$redirector
    [int]$virus
    [int]$android
    [int]$autorun
    [int]$fake
    [int]$spy
    [int]$adware
    [int]$phish
    [int]$hidelink
    [int]$stealer
    [int]$java
    [int]$pdf
    [int]$blackhole
    [int]$backdoor
    [int]$unix
    [int]$linux
    [int]$rootkit
    [int]$sms
    [int]$bundle
    [int]$packed
    [int]$toolbar
    [int]$worm
    [int]$hack
    [int]$ransom
    [int]$keylogger
    [int]$perl
    [int]$joke
    [int]$crack
    [int]$camubot
    [int]$brazil
    [int]$ibm
    [int]$mirai
    [int]$sonicwall
    [int]$gafgyt
    [int]$table
    [int]$ddos
    [int]$apache
    [int]$code
    [int]$huawei
    [int]$dlink
    [int]$zyxel
    [int]$unit42
    [int]$vbscript
    [int]$first
    [int]$reactor
    [int]$smokeloader
    [int]$banker
    [int]$anubis
    [int]$mobile
    [int]$sophos
    [int]$Underminer
    [int]$Bootkit
    [int]$cryptominer
    [int]$trendmicro
    [int]$china
    [int]$APAC
    [int]$Gh0st
    [int]$Dnstunserver
    [int]$NBDDOS
    [int]$GTalkTrojan
    [int]$AspxSpy
    [int]$GSecDump
    [int]$QuarksPwDump
    [int]$HTran
    [int]$sofacy
    [int]$nato
    [int]$zebrocy
    [int]$gamefish
    [int]$apt28
    [int]$xagent
    [int]$delphi
    [int]$ukraine
    [int]$coreshell
    [int]$asia
    [int]$apt
    [int]$kaspersky
    [int]$plugx
    [int]$office
    [int]$windows
    [int]$ssl
    [int]$fireeye
    [int]$carbanak
    [int]$vnc
    [int]$mimikatz
    [int]$word
    [int]$pos
    [int]$trustwave
    [int]$msword
    [int]$osx
    [int]$proxy
    [int]$p2p
    [int]$client
    [int]$hijacker
    [int]$russia
    [int]$africa
    [int]$PinchDuke
    [int]$GeminiDuke
    [int]$CosmicDuke
    [int]$MiniDuke
    [int]$CozyDuke
    [int]$OnionDuke
    [int]$SeaDuke
    [int]$HammerDuke
    [int]$CloudDuke
    [int]$emissary
    [int]$jakarta
    [int]$dealerschoice
    [int]$flash
    [int]$ukrainian
    [int]$mac
    [int]$komplex
    [int]$cmstar
    [int]$bbsrat
    [int]$mongolian
    [int]$mongolia
    [int]$military
    [int]$url
    [int]$xor
    [int]$uzbekistan
    [int]$government
    [int]$russian
    [int]$ics
    [int]$industrial
    [int]$spearphishing
    [int]$FareIT
    [int]$pony
    [int]$HawkEye
    [int]$recon
    [int]$scan
    [int]$scanning
    [int]$port
    [int]$automated
    [int]$reconnaissance
    [int]$range
    [int]$search
    [int]$test
    [int]$fuzzing
    [int]$nmap
    [int]$portmap
    [int]$service
    [int]$ip
    [int]$domain
    [int]$info
    [int]$osr
    [int]$attempt
    [int]$web
    [int]$access
    [int]$webscrape
    [int]$scraping
    [int]$scrape
    [int]$fuzz
    [int]$webscraper
    [int]$gathering
    [int]$fileDownload
    [int]$openSource
    [int]$infoGathering
    [int]$triage
    [int]$webserver
    [int]$bruteforce
    [int]$guess
    [int]$passwordGuess
    [int]$ipScan
    [int]$portScan
    [int]$portScanner
    [int]$solarWinds
    [int]$acas
    [int]$angryIp
    [int]$netcat
    [int]$openVas
    [int]$nessus
    [int]$coreImpact
    [int]$qualys
    [int]$nikto
    [int]$dnswalk
    [int]$dirWalk
    [int]$webscan
    [int]$p0f
    [int]$wireshark
}

# test to see that class instantiates
# gather class property names as a list of strings
$testInstance = [instance]::new()
$tags = ($testInstance | Get-Member | Where-Object MemberType -eq Property).name

# import raw data
$inputCsv = Import-Csv uncleanData.csv

$results = @()

for ($i = 0; $i -lt $inputCsv.Count; $i++) {
    # Print progress
    if ($i % 1000 -eq 0) {
        Write-Host $i
    }

    $tempInstance = [instance]::new()
    $tempInstance.description = $inputCsv[$i].description
    $tempInstance.created = $inputCsv[$i].created
    $tempInstance.modified = $inputCsv[$i].modified
    $tempInstance.adversary = $inputCsv[$i].adversary
    $tempInstance.name = $inputCsv[$i].name

    foreach ($tag in $tags) {
        if ($inputCsv[$i].tags -match $tag) {
            $tempInstance.$tag = 1
        }
    }

    $results += $tempInstance
}

$results | export-csv -NoTypeInformation cleanData.csv
