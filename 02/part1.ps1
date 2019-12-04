$program = Get-Content 'input.txt' -Encoding UTF8
#$program = '1,1,1,4,99,5,6,0,99' # test input, expecting result 30,1,1,4,2,5,6,0,99

$arr = $program.split(',') | ForEach-Object { [int]$_ } # Convert input to int array
$arr[1] = 12; $arr[2] = 2

for ($i=0; $i -le $arr.Count; $i++) {
    $op = [int]$arr[$i]
    if ($op -eq 99) {
        Write-Host 'Exiting with opcode:' $op
        break
    }
    elseif ($op -in 1..2) {
        $a = $arr[$arr[$i+1]]
        $b = $arr[$arr[$i+2]]
        $pos = $arr[$i+3]

        if ($op -eq 1) { $res = $a + $b }
        else { $res = $a * $b }

        $arr[$pos] = $res
        $i += 3
    }
    else { Write-Host 'Skipping unknown opcode:' $op }
}

Write-Host 'State:' ($arr -join ',') -ForegroundColor Cyan
Write-Host 'Answer:' $arr[0] -ForegroundColor Cyan