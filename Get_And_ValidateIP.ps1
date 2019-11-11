Function Get_And_ValidateIP(){
    Param ([String] $resource)
    $Prompt=("`nEnter valid $resource Address")
    $x = 1
	
    while($x -le 3)
    {
        $IP = Read-Host $Prompt

        if($IP -match "^([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}$")
        {
            #Write-Host "Correct Format" -f Green
            $x = 0    
            break
        }
        else 
        {
           Write-Host "`nInvalid $resource Address Format ..!`n" -f Cyan
           # [String]$IP = Read-Host $Prompt
           $x += 1

           if($x -gt 3){
           Write-Host "`nInvalid Inputs-***Exiting***`n" -f Red
           exit 
           }
        }
    } 
Write-Host "`n Entered IP Address is " $IP -f Green
Write-Host "`n Entered value is a valid Format for IPAddress`n" -f Green
    return $IP 

}
$IPAddress= Get_And_ValidateIP('IP')