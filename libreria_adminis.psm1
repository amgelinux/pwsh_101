# Relaunch the script with administrator privileges
Function RequireAdmin {
	If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
		Start-Process powershell "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`" $PSCommandArgs" -Verb RunAs
		Exit
	}
}
#Read more: https://www.sharepointdiary.com/2015/01/run-powershell-script-as-administrator-automatically.html#ixzz7mJhBXVpF



function getIP {
    $direccionip=$(Get-NetIPAddress -AddressFamily IPv4 -AddressState 'Preferred' | 
    Where-Object {$_.InterfaceAlias -like "Ether*"} | 
    select-object -expandproperty IPAddress)
    return $direccionip
}


function getIP_variacion1 {
    write-host $(Get-NetIPAddress -AddressFamily IPv4 -AddressState 'Preferred' | 
    Where-Object {$_.PrefixOrigin -ne 'WellKnown'} |
    Select-Object -ExpandProperty IPAddress)
}

function getIP_variacion2 {
    $objeto1=$(Get-NetIPAddress | WHERE-OBJECT { $_.IPAddress -like "192.168.40.*" })
    write-host $objeto1.IPAddress
    write-host $(Get-NetIPAddress | WHERE-OBJECT { $_.IPAddress -like "192.168.40.*" }).IPAddress
}

# Nombre PC
function getNombrePC {
    return $(Get-ComputerInfo).CsCaption    
}


# Memoria instalada
function getCantidadMemoria {
    $NumeroKBytes = $(Get-ComputerInfo).CsPhysicallyInstalledMemory
    $NumeroGigas = $NumeroKBytes / 1024 / 1024
    return $("$NumeroGigas GB")
}

function getEspacioLibre {
    # Get-PSdrive | Foreach-Object {Write-Host $_.Name}
    #$(Get-PSDrive | where-object {$_.Name -eq "C"})
    return $($(Get-PSDrive | where-object {$_.Name -eq "C"} | select-object -ExpandProperty Free) / 1024 / 1024 / 1024)
}

function CogerUsuario ($param1) {
    Get-LocalUser | where-object {$_.Name -like "*$param1*" } | Select-Object -ExpandProperty Name
}