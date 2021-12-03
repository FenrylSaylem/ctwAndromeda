$result = get-content inputs | foreach {   ($_ -split ' ')}
$gammaRate = $epsilonRate = 0
$pos = [int[]]::new(12)
$halfRes=$result.Length/2


for($i=0; $i -le $result.Length; $i++ ){
    $binNrSplit = [int[]](($result[$i] -split '') -ne '')
    for($j=0; $j -le $binNrSplit.Length; $j++){
        if($binNrSplit[$j]){ $pos[$j]++ }
    }
}

for($i=$pos.Length; $i -ge 1; $i--){
    $exp = $pos.Length - $i
    if($pos[$i-1] -gt $halfRes){
        $gammaRate += [Math]::Pow(2,$exp)
    }
    if($pos[$i-1] -lt $halfRes){
        $epsilonRate += [Math]::Pow(2,$exp)
    }
}

Write-Host $($gammaRate*$epsilonRate)
