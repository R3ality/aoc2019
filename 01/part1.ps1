#$moduleMasses = 1969 # test input, expecting result 654
#$moduleMasses = 100756 # test input, expecting result 33583
$moduleMasses = Get-Content 'input.txt' -Encoding UTF8

$moduleMasses | ForEach-Object { $totalFuelReq += [math]::Floor($_/3)-2 }
Write-Host 'Total fuel requirement:' $totalFuelReq