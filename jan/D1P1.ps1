[int[]]$arrInputs = Get-Content -Path "input"

$count=0

for ($i=0; $i -lt $arrInputs.length; $i++){
	if($arrInputs[$i-1] -lt $arrInputs[$i]){
		$count++
	}
}

echo $count
