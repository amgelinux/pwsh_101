# Cambiar el fondo y el lockscreen
# https://github.com/juangranados/powershell-scripts/tree/main/Change%20Lock%20Screen%20and%20Desktop%20Background%20in%20Windows%2010%20Pro
function setlockscreen {
	Param(
        [Parameter(Mandatory=$false,Position=0)] 
        [ValidateNotNullOrEmpty()]
        [string]$LockScreenSource,
        [Parameter(Mandatory=$false,Position=1)] 
        [ValidateNotNullOrEmpty()]
        [string]$BackgroundSource,
        [Parameter(Mandatory=$false,Position=2)] 
        [ValidateNotNullOrEmpty()]
        [string]$LogPath
    )

	if (-not [string]::IsNullOrWhiteSpace($LogPath)) {
		Start-Transcript -Path "$($LogPath)\$($env:COMPUTERNAME).log" | Out-Null
	}

	$ErrorActionPreference = "Stop"

	$RegKeyPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP"

	$DesktopPath = "DesktopImagePath"
	$DesktopStatus = "DesktopImageStatus"
	$DesktopUrl = "DesktopImageUrl"
	$LockScreenPath = "LockScreenImagePath"
	$LockScreenStatus = "LockScreenImageStatus"
	$LockScreenUrl = "LockScreenImageUrl"

	$StatusValue = "1"
	$DesktopImageValue = "C:\Windows\System32\Desktop.jpg"
	$LockScreenImageValue = "C:\Windows\System32\LockScreen.jpg"

	if (!$LockScreenSource -and !$BackgroundSource)  {
		Write-Host "Either LockScreenSource or BackgroundSource must has a value."
	}
	else {
		if(!(Test-Path $RegKeyPath)) {
			Write-Host "Creating registry path $($RegKeyPath)."
			New-Item -Path $RegKeyPath -Force | Out-Null
		}
		if ($LockScreenSource) {
			Write-Host "Copy Lock Screen image from $($LockScreenSource) to $($LockScreenImageValue)."
			Copy-Item $LockScreenSource $LockScreenImageValue -Force
			Write-Host "Creating registry entries for Lock Screen"
			New-ItemProperty -Path $RegKeyPath -Name $LockScreenStatus -Value $StatusValue -PropertyType DWORD -Force | Out-Null
			New-ItemProperty -Path $RegKeyPath -Name $LockScreenPath -Value $LockScreenImageValue -PropertyType STRING -Force | Out-Null
			New-ItemProperty -Path $RegKeyPath -Name $LockScreenUrl -Value $LockScreenImageValue -PropertyType STRING -Force | Out-Null
		}
		if ($BackgroundSource) {
			Write-Host "Copy Desktop Background image from $($BackgroundSource) to $($DesktopImageValue)."
			Copy-Item $BackgroundSource $DesktopImageValue -Force
			Write-Host "Creating registry entries for Desktop Background"
			New-ItemProperty -Path $RegKeyPath -Name $DesktopStatus -Value $StatusValue -PropertyType DWORD -Force | Out-Null
			New-ItemProperty -Path $RegKeyPath -Name $DesktopPath -Value $DesktopImageValue -PropertyType STRING -Force | Out-Null
			New-ItemProperty -Path $RegKeyPath -Name $DesktopUrl -Value $DesktopImageValue -PropertyType STRING -Force | Out-Null
		}  
	}
	
	if (-not [string]::IsNullOrWhiteSpace($LogPath)){Stop-Transcript}
}


# Relaunch the script with administrator privileges
Function RequireAdmin {
	If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
		Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`" $PSCommandArgs" -Verb RunAs
		Exit
	}
}


RequireAdmin
setlockscreen -BackgroundSource "C:\Users\angel\Pictures\imagen2.jpg"

2..220 | %{echo "192.168.40.$_"; ping -n 1 192.168.40.$_ | select-string ttl}