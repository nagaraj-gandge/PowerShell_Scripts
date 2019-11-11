Function Get-NonEmptyString(){
    Param ([String] $userInput, [String]$name = "Username")
    $Prompt=("`nEnter the Value for $userInput")
    $x = 1
	
	$Output = (Get-Variable $name -ErrorAction SilentlyContinue).Value
	If ($Output -eq $Null -Or $Output -eq "") {
		$Output = Read-Host $Prompt
	}
    
    While([String]::IsNullOrWhiteSpace($Output)){
       if($x -lt 3){
           write-host "`nYou must enter a Value..!`n" -ForegroundColor Cyan
           $Output = Read-Host $prompt
           $x =$x+1
           }
           else{
           Write-Host "`nMaximum Attempts done Exiting..!`n" -f Red
           exit 1
           }
        }
		Write-Host "Input String is " $Output
    return $Output
}

$Username = get-NonEmptyString('Username')