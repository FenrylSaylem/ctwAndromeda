[int[]]$arrInputs = Get-Content -Path "input"

$count=0

for ($i=3; $i -lt $arrInputs.length; $i++){
	if($arrInputs[$i-3]+$arrInputs[$i-2]+$arrInputs[$i-1] -lt $arrInputs[$i-2]+$arrInputs[$i-1]+$arrInputs[$i]){
		$count++
	}
}

echo $count
