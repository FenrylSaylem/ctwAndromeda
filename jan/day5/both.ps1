$lines = Get-Content inputs

$board1 = [Collections.Generic.Dictionary[string, int]]::new()
$board2 = [Collections.Generic.Dictionary[string, int]]::new()

foreach ($line in $lines) {

    [int]$x1, [int]$y1, [int]$x2, [int]$y2 = $line -split ' -> ' -split ','

    if     ($x1 -eq $x2) { foreach ($y in $y1..$y2) { $board1["$x1, $y"] += 1; $board2["$x1, $y"] += 1 } }
    elseif ($y1 -eq $y2) { foreach ($x in $x1..$x2) { $board1["$x, $y1"] += 1; $board2["$x, $y1"] += 1 } }

    else {
        if ($x1 -gt $x2) { $x1, $y1, $x2, $y2 = $x2, $y2, $x1, $y1  }
        
        $x,$y = $x1,$y1

        if ($y1 -lt $y2) {
            while ($x -le $x2) {
                $board2["$x, $y"] += 1
                $x+=1
                $y+=1
            }
        } else {
            while ($x -le $x2) {            
                $board2["$x, $y"] += 1
                $x+=1
                $y-=1
            }
        }
    }
}

write-host "Part 1"
write-host ($board1.GetEnumerator().where{$_.value -gt 1} | measure |% count)
write-host "Part 2"
write-host ($board2.GetEnumerator().where{$_.value -gt 1} | measure |% count)