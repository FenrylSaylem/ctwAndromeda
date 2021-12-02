[int[]]$arrInputs = Get-Content -Path input.txt

$count=0
$lastNum

for ($i=0; $i -lt $arrInputs.length; $i++){
    $curNum=$arrInputs[$i-2]+$arrInputs[$i-1]+$arrInputs[$i]
    if($lastNum){
	    if($lastNum -lt $curNum){
		    $count++ 
	    }
    }
    $lastNum = $curNum
}

echo $count
