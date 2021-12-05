﻿cls
[int[]]$calls = '4,77,78,12,91,82,48,59,28,26,34,10,71,89,54,63,66,75,15,22,39,55,83,47,81,74,2,46,25,98,29,21,85,96,3,16,60,31,99,86,52,17,69,27,73,49,95,35,9,53,64,88,37,72,92,70,5,65,79,61,38,14,7,44,43,8,42,45,23,41,57,80,51,90,84,11,93,40,50,33,56,67,68,32,6,94,97,13,87,30,18,76,36,24,19,20,1,0,58,62'.Split(',')

$x = Get-Content -Raw inputs

$boards = $x -split "`r?`n`r?`n" | foreach { 
   ,($_ -split "`r?`n"|foreach { ,($_ -split '\D+' |? {$_}) })
}

:outer foreach ($num in $calls) {
    foreach ($b in $boards) {
        foreach ($row in 0..4) {
            foreach ($col in 0..4) {
                if ($b[$row][$col] -eq $num) {
                    $b[$row][$col] = -1
                }
            }
        }
    }

    foreach ($b in $boards) {
        foreach ($col in 0..4) {
            if (($b[0][$col] -eq -1) -and ($b[1][$col] -eq -1) -and ($b[2][$col] -eq -1) -and ($b[3][$col] -eq -1) -and ($b[4][$col] -eq -1)) {
                $global:win = $b
                $global:lastnum = $num
                break outer               
            
            }
        }

        foreach ($row in 0..4) {
            if (($b[$row][0] -eq -1) -and ($b[$row][1] -eq -1) -and ($b[$row][2] -eq -1) -and ($b[$row][3] -eq -1) -and ($b[$row][4] -eq -1)) {
                $global:win = $b
                $global:lastnum = $num
                break outer
            }
        }
    }
}

$global:lastnum * ($global:win|%{$_}|?{$_ -ne -1}|measure -sum|% sum)