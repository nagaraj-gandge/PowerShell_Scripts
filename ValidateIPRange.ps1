Function ValidateIPRange() {
    Param(
        [String]$FirstIP,
        [String]$SecondIP,
        [String]$Subnet,
        [String]$Gateway
    )
$FirstIP = Read-Host "Enter the value for Start IP Address"
$SecondIP = Read-Host "Enter the value for End IP Address"
$Subnet = Read-Host "Enter the value for SubnetMask Address"
$Gateway = Read-Host "Enter the value for Gateway IP Address"
   
 # Initial String variables to IP Address Type
    $genericBroadcast = [IPAddress] "255.255.255.255"
    $decStartIP = ([IPAddress][String]([IPAddress]$FirstIP).Address).Address
    $decEndIP   = ([IPAddress][String]([IPAddress] $SecondIP).Address).Address
    $sn = [IPAddress]$subnet
    $gw = [IPAddress]$Gateway
    $decSubnet  = ([IPAddress][String]($sn.Address)).Address
    $decGateway = ([IPAddress][String]($gw.Address)).Address
    
    $networkAddress = [IPAddress] ($sn.Address -band $gw.Address)
    $broadcastAddress = [IPAddress] ($genericBroadcast.Address -bxor $sn.Address -bor $gw.Address)
    
    $decNetIP = ([IPAddress][String]($networkAddress.Address)).Address
    $decBroadCastIP = ([IPAddress][String]($broadcastAddress.Address)).Address
    
    $ErrorMsg = ""
    $isSuccess = $True
    
    If ($decStartIP -le $decNetIP -Or $decStartIP -ge $decBroadCastIP) {
        $ErrorMsg += "`n Start IP $FirstIP does not belong to network of gateway($gateway) Subnet($subnet)`n"
        $isSuccess = $False
    }
    
    If ($decEndIP -le $decNetIP -Or $decEndIP -ge $decBroadCastIP) {
        $ErrorMsg += "`n End IP $SecondIP does not belong to network of gateway($gateway) Subnet($subnet)"
        $isSuccess = $False
    }
    
    If ($decStartIP -ge $decEndIP) {
        $ErrorMsg += "`n Start IP $FirstIP is greater than End IP $SecondIP"
        $isSuccess = $False
    }
    
    return $isSuccess, $ErrorMsg
}

ValidateIPRange 