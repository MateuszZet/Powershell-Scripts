﻿Get-ComputerInfo -Property CsManufacturer, CsName, CSModel, CsSystemFamily, CsSystemSKUNumber, OsName, OsVersion, OsArchitecture, OsSerialNumber, CsUserName, CsProcessors, CsPhyicallyInstalledMemory, BiosSeralNumber, BiosFirmwareType, CsName, CsNetworkAdapters, CsDomain;
Get-WmiObject Win32_VideoController | Format-Table @{Label="Graphic Cards"; Expression={$_.name}}
Get-WmiObject Win32_LogicalDisk | Format-Table DeviceId, @{Label="Size (GB)"; Expression={ "{0:N2}" -f ($_.size/1gb)}}, @{Label="FreeSpace (GB)"; Expression={"{0:N2}" -f ($_.freespace/1gb)}}