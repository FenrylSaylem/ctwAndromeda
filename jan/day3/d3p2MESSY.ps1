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
        for($j=0; $j -lt $oxy.Length; $j++){
            $binNrSplit = [int[]](($oxy[$j] -split '') -ne '')
            if($binNrSplit[$count]){$oxy[$j]=0 }
        }
    }
    $oxy=$oxy -ne 0
    $count++
}


$count=0
$pos = [int[]]::new(12)

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

Write-Host $($([Convert]::ToInt32($co2,2))*$([Convert]::ToInt32($oxy,2)))
