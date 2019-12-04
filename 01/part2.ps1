#$moduleMasses = 100756 # test input, expecting result 50346
$moduleMasses = Get-Content 'input.txt' -Encoding UTF8

$moduleMasses | ForEach-Object {
    $fuelMass = [math]::Floor($_/3)-2
    $totalFuelReq += $fuelMass
    #Write-Host 'Additional fuel req' $totalFuelReq
    while ($fuelMass -gt 0) {
        $fuelMass = [math]::Floor($fuelMass/3)-2
        if ($fuelMass -gt 0) {
            $totalFuelReq += $fuelMass
            #Write-Host 'Additional fuel req' $fuelMass
        }
    }
}
Write-Host 'Total fuel requirement:' $totalFuelReq