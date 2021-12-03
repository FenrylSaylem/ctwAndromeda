$count = 0
$pos = [int[]]::new(12)
$halfRes=$result.Length/2

$oxy=get-content inputs | foreach {   ($_ -split ' ')}
$co2=get-content inputs | foreach {   ($_ -split ' ')}

function MajX($arrMaj,$x){

    for($i=0; $i -le $arrMaj.Length; $i++ ){
        $binNrSplit = [int[]](($arrMaj[$i] -split '') -ne '')
        if($binNrSplit[$x]){ $pos[$x]++ }
    }
}

while($oxy.Length -gt 1){
    MajX -arrMaj $oxy -x $count
    if($pos[$count] -ge $oxy.Length/2){
        for($i=0; $i -lt $oxy.Length; $i++){
            $binNrSplit = [int[]](($oxy[$i] -split '') -ne '')
            if(!($binNrSplit[$count])){ $oxy[$i]=0 }
        }
    }elseif($pos[$count] -lt $oxy.Length/2){
        for($j=0; $j -le $oxy.Length; $j++){
            $binNrSplit = [int[]](($oxy[$j] -split '') -ne '')
            if($binNrSplit[$count]){$oxy[$j]=0 }
        }
    }
    $oxy=$oxy -ne 0
    $count++
}


$count=0


while($co2.Length -gt 1){
    MajX -arrMaj $co2 -x $count
    if($pos[$count] -lt $co2.Length/2){
        for($i=0; $i -lt $co2.Length; $i++){
            $binNrSplit = [int[]](($co2[$i] -split '') -ne '')
            if(!($binNrSplit[$count])){ $co2[$i]=0 }
        }
    }elseif($pos[$count] -ge $co2.Length/2){
        for($j=0; $j -lt $co2.Length; $j++){
            $binNrSplit = [int[]](($co2[$j] -split '') -ne '')
            if($binNrSplit[$count]){ $co2[$j]=0 }
        }
    }
    $co2=$co2 -ne 0
    $count++
}

function bintodec($varBin){
    for($i=$pos.Length; $i -ge 1; $i--){
    $exp = $pos.Length - $i
    if($pos[$i-1] -gt $halfRes){
        $gammaRate += [Math]::Pow(2,$exp)
    }
    if($pos[$i-1] -lt $halfRes){
        $epsilonRate += [Math]::Pow(2,$exp)
    }
}
}

Write-Host $co2
Write-Host $oxy
