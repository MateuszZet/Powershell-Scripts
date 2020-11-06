## (2 to 5 line) This is checking if Provider is FileSystem written in different ways. You can uncomment one of options##
#Get-PSDrive -PSProvider FileSystem |
#Get-PSDrive | ?{$_.Provider.Name.Equals( "FileSystem")} |
#Get-PSDrive | Where-Object {$_.Provider.Name -eq "FileSystem"} |
Get-PSDrive | Where-Object {$_.Provider.Name.Equals( "FileSystem")} |
ForEach-Object{$Total_free=0; $Total_used=0; $counter=0; Write-Host $_."THIS IS RUN ONCE AT BEGIN - Counter is"  $counter; "`n"}{
$counter++;
$Total_free=$Total_free+$_.free; $Total_used=$Total_used+$_.used;
Write-Host "THIS IS RUN"  $counter "TIME(S) - Counter is" $counter;
Write-Host -ForegroundColor Green  $_.Root "FREE space is" ($_.Free/1gb) "GB"; 
Write-Host -ForegroundColor Red  $_.Root "USED space is" ($_.Used/1gb) "GB";
Write-Host -ForegroundColor White  $_.Root "TOTAL space is" ($_.Used/1gb + $_.Free/1gb) "GB"`n;
}{
Write-Host "This IS RUN ONCE AT THE END - Counter is" $counter
Write-Host -ForegroundColor Green -BackgroundColor Black "TOTAL FREE SPACE is" ($Total_free/1gb) "GB"; 
Write-Host -ForegroundColor Red -BackgroundColor Black "TOTAL USED SPACE is" ($Total_used/1gb) "GB"; 
Write-Host -ForegroundColor White -BackgroundColor Black "TOTAL SPACE is" ($Total_free/1gb + $Total_used/1gb) "GB";} 

            