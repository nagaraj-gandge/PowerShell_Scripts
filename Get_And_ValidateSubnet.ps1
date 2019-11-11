Function Get_And_ValidateSubnet(){
    Param ([String] $resource)
    
    $Prompt=("`nEnter valid $resource (Ex: 255.xxx.xxx.xxx)")
    $x = 1

    $HasFileArgs = $False
	$netMask = (Get-Variable $Resource -ErrorAction SilentlyContinue).Value
	If ($netMask -ne $Null -And $netMask -ne "") {
		$HasFileArgs = $True
	}

    while($x -le 3)
    {
        If (-Not $HasFileArgs) {
            $netMask = Read-Host $Prompt
        }

        try{
            # Subnet Validation: Convert to binary value and check all 1 are at the left side
            if([Convert]::ToString(([IPAddress][String](([IPAddress]$netmask).Address)).Address, 2).split('0', [System.StringSplitOptions]::RemoveEmptyEntries).count -eq 1)
            {
                return $netMask 
            }
            Throw
        }
        catch{
            Write-Host "`nInvalid $resource Address Format ..!`n" -f Cyan
            $HasFileArgs = $False
            $x += 1
        }
        if($x -gt 3){
           Write-Host "`nMaximum Attempts done Exiting..!`n" -f Red
           exit 1
        }
   }
   
}

$SubnetMask = Get_And_ValidateSubnet('SubnetMask')