$Program = Get-Content 'input.txt' -Encoding UTF8

function Get-ProgInput($Noun = 12, $Verb = 2) {
    $arr = $Program.split(',') | ForEach-Object { [int]$_ } # Convert input to int array
    $arr[1] = $Noun; $arr[2] = $Verb
    return $arr
}

function Get-ProgOutput($Prog = (Get-ProgInput)) {
    for ($i=0; $i -le $Prog.Count; $i++) {
        $op = [int]$Prog[$i]
        if ($op -eq 99) { break }
        elseif ($op -in 1..2) {
            $a = $Prog[$Prog[$i+1]]
            $b = $Prog[$Prog[$i+2]]
            $pos = $Prog[$i+3]

            if ($op -eq 1) { $res = $a + $b }
            else { $res = $a * $b }

            $Prog[$pos] = $res
            $i += 3
        }
    }
    return $Prog[0]
}

for ($i=0; $i -le 99; $i++) {
    for ($j=0; $j -le 99; $j++) {
        $output = Get-ProgOutput(Get-ProgInput -Noun $i -Verb $j)
        if ($output -eq 19690720) {
            Write-Host 'Answer is' (100 * $i + $j)
            exit 0
        }
    }
}
