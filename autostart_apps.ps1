# This can be set in Task Sheduler to open any necessary programs and sites on etc. system start or just run it to start everything 

function Set-Elevation($name)
{
   # Create a new process object that starts PowerShell
   $newProcess = New-Object System.Diagnostics.ProcessStartInfo $name;
   # Indicate that the process should be elevated
   $newProcess.Verb = "runas";
   # Start the new process
   [System.Diagnostics.Process]::Start($newProcess) 
}

function Open-Web($browser, $site){
 $newProcess = Set-Elevation($browser);
}

function Start-Programs($name_array){

foreach ($p in $name_array){Write-Output "Starting $p"; Set-Elevation($p)}

}

$prog_array = @("OUTLOOK", "ONENOTE", "lync")
$browser_array = @("iexplore", "chrome", "opera", "firefox")
$site_array = @("https://www.google.com" , "https://www.wp.pl", "https://github.com")

Start-Programs($prog_array);
Open-Web($browser_array[0], $site_array[0]);
Open-Web($browser_array[1], $site_array[1]);
Open-Web($browser_array[1], $site_array[2]);