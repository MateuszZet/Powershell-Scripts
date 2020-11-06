#Script for closing open programms based on what is in $array

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

$array = @("chrome", "firefox", "iexplore", "opera" ,"OUTLOOK", "KeePass" , "ONENOTE", "EXCEL", "excel", "WINWORD", "POWERPNT", "lync", "MicrosoftEdgeCP", "MicrosoftEdge", "Receiver" , "Calculator", "mstsc", "redirector", "AuthManSvr", "concentr", "wfica32" )

#closing or force kill processes from array
foreach ($process_name in $array){
    
    $process = Get-Process $process_name -ErrorAction SilentlyContinue
    
    if($process){
        $process.CloseMainWindow()
        Write-Output $process "Trying to CLOSE`n" 
        Sleep 2
        if(!$process.HasExited) {
            Stop-Process $process  -Force
            Write-Output $process "are FORCE killed`n" 
        }
    }
    
    
}

#closing all explorer.exe widnows
(New-Object -comObject Shell.Application).Windows() | foreach-object {Write-Output $_ "has been CLOSED`n"; $_.quit()} 