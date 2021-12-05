cls
$x = Get-Content -Raw inputs
[int[]]$calls = $x[0].Split(',')

[collections.arraylist]$boards= @()
$x -split "`r?`n`r?`n" | foreach { 
   $null = $boards.AddRange((,($_ -split "`r?`n"|%{ ,($_ -split '\D+' |? {$_}) })))
}

$global:wins = @()
$global:winorder = @()

:outer foreach ($num in $calls) {

    foreach ($bi in 0..($boards.Count-1)) {
        if ($global:wins -notcontains $bi) {
            $b = $boards[$bi]
            foreach ($row in 0..4) {
                foreach ($col in 0..4) {
                    if ($b[$row][$col] -eq $num) {
                        $b[$row][$col] = -1
                    }
                }
            }
        }
    }

    foreach ($bi in 0..($boards.Count-1)) {
        $b = $boards[$bi]
        if ($global:wins -notcontains $bi) {
            foreach ($col in 0..4) {
            
                if (($b[0][$col] -eq -1) -and ($b[1][$col] -eq -1) -and ($b[2][$col] -eq -1) -and ($b[3][$col] -eq -1) -and ($b[4][$col] -eq -1)) {
                    $global:wins += $bi; $global:winorder += ,($bi, $num)
                }
            }

            foreach ($row in 0..4) {
                if (($b[$row][0] -eq -1) -and ($b[$row][1] -eq -1) -and ($b[$row][2] -eq -1) -and ($b[$row][3] -eq -1) -and ($b[$row][4] -eq -1)) {
                   $global:wins += $bi; $global:winorder += ,($bi, $num)
                }
            }
        }
    }
}

$global:winorder[-1][1] * ($boards[$global:winorder[-1][0]]|%{$_}|?{$_ -ne -1}|measure -sum|% sum)