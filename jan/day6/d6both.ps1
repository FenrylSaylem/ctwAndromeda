[long[]]$start = @(0,0,0,0,0,0,0,0,0)
[long[]](Get-Content inputs | foreach {   ($_ -split ',') }) | %{
    $start[$_] += 1
}

function Runner {
    [CmdletBinding()]
    param(
        [long[]]$start,
        [int]$days=80
    )

    for ($d=0; $d -lt $days; $d++) {
        $zeroCount = $start[0]
        (1..8).foreach{ $start[$_-1] = $start[$_] }
        $start[6] += $zeroCount
        $start[8] = $zeroCount
    }
    $start
}

(Runner $start | Measure-Object -Sum).Sum

(Runner $start -Days (256-80) | Measure-Object -Sum).Sum
