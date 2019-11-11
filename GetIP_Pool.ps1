Function GetIPPools{
    Param ([string]$FirstIP, [string]$LastIP)
    $FirstIP= Read-Host "Enter the value for Start IP Address"
    $LastIP= Read-Host "Enter the value for End IP Address"
    $x = $FirstIP.Split(".")
    $y = $LastIP.Split(".")
    $IPPools = @()

    # This works for 24 Subnet Prefix
    If (([int]$x[2] -eq [int]$y[2]))
    {
        While ([int]$x[3] -le [int]$y[3])
        {
            $SplitIPAddress = $x -join ('.')
            $IPPools += $SplitIPAddress
            [int]$x[3] += 1
        }
        Return $IPPools
    }
    Return $null
}
GetIPPools