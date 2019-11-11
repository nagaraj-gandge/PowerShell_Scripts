Function Get-NonEmptyPassword {
    param([string]$PasswdInput)
        $Prompt =  ("`nEnter the Value for $PasswdInput")        
        $decPassword = (Get-Variable Password -ErrorAction SilentlyContinue).Value
        If ($decPassword -eq $Null -Or $decPassword -eq "") {
            $securePassword = Read-Host $Prompt -AsSecureString 
            $decPassword = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($securePassword))
        }
        $x =1
        while ([String]::IsNullOrWhiteSpace($decPassword)){
        if($x -lt 3){
            write-host "`nYou must enter a Value..!`n" -ForegroundColor Cyan
            $securePassword = Read-Host $prompt -AsSecureString 
            $decPassword = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($securePassword))
            $x =$x+1
            }
            else {
            Write-Host "`nMaximum Attempts done Exiting..!`n" -f Red
            exit 1
            }
         }
         Write-Host "`nDecrepted value of entered password is " $decPassword
		  Write-Host "`n "
     return $decPassword
}

$Password = Get-NonEmptyPassword('Password')