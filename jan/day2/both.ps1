$result = get-content inputs | foreach {   ($_ -split ' ') }
$forward = $dir = $aim = $depth = 0


for($i=0; $i -le $result.Length; $i+=2 ){
    $vl=$result[$i+1]
    switch($result[$i]){
        'forward' { 
                    $forward += $vl
                    $depth += $aim*$vl
                   }
        'down' {
                    $dir += $vl
                    $aim += $vl
                }
        'up' { 
                    $dir -= $vl
                    $aim -= $vl
                }
    }
}

write-host "Part 1:" $($dir*$forward)
write-host "Part 2:" $($forward*$depth)
