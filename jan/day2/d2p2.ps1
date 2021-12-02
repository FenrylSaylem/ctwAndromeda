$result = get-content inputs | foreach {   ($_ -split ' ')}
$forward = 0
$down = 0
$up = 0
$aim = 0
$depth = 0


for($i=0; $i -le $result.Length; $i+=2 ){
    switch($result[$i]){
        'forward' { 
                    $forward += $result[$i+1];
                    $depth += $aim* $result[$i+1]
                   }
        'down' {
                    $down += $result[$i+1];
                    $aim += $result[$i+1]
                }
        'up' { 
                    $up += $result[$i+1]
                    $aim -= $result[$i+1]
                }
    }
}

$finalPos=$forward*$depth

echo $finalPos
