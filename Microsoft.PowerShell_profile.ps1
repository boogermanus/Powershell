Clear-Host

# Welcome Message
"[$(Get-Date)]"
"Welcome " + $env:Username
""
#########################
# Set Window Properties #
#########################
"Setting Properties"
$Host.UI.RawUI.WindowTitle="Powershell - $env:computername"
Set-PSReadlineOption -BellStyle None

##########################
#Importing Custom Modules#
##########################
"Importing Custom Modules"
# "  -- PSAKE"
# import-module "c:\users\jordan.woodruff\Documents\PowershellScripts\psake.psm1"
#not needed on SQL2012
#"  -- SQL"
#add-pssnapin sqlservercmdletsnapin100
#" -- posh-git"
Import-Module posh-git

###############
# Set Aliases #
###############
function Get-ChildItemAll { Get-ChildItem -Attributes ReadOnly,Hidden,System,Directory,Archive,Device,Normal,Temporary,SparseFile ,ReparsePoint ,Compressed ,Offline ,NotContentIndexed ,Encrypted ,IntegrityStream ,NoScrubData }
"Setting Aliases"
Set-Alias epf Edit-Profile
Set-Alias n++ 'c:\Program Files\Notepad++\notepad++.exe'
Set-Alias pushl push-location
Set-Alias popl pop-location
Set-Alias eh edit-hosts
Set-Alias paint 'c:\program files\Paint.NET\PaintDotNet.exe'
Set-Alias sql 'C:\Program Files (x86)\Microsoft SQL Server Management Studio 18\Common7\IDE\Ssms.exe'
Set-Alias ll Get-ChildItemAll

##########################
# Setup Custom Functions #
##########################
"Creating Custom Functions"
$_stopWatch = [system.diagnostics.stopwatch]::StartNew()

function start-watch {
	$_stopWatch.Start()
}

function stop-watch {
	$_stopWatch.Stop()
	$_stopWatch
}

function reset-watch {
	$_stopWatch.Reset()
}
function Edit-Profile {
   n++ $profile
}

$GitPromptSettings.DefaultPromptPath = ""

function prompt
{
	$loc = get-location
	$drive = $loc.Path.split('\')[0]
	$directory = $loc.Path.split('\')[$loc.Path.split('\').Length - 1]
	$data = "PS " + $drive + ":" + $directory
	$data += & $GitPromptScriptBlock
	$data
}

function edit-hosts
{
	n++ 'C:\windows\system32\drivers\etc\hosts'
}

function new-comb
{
	$guidArray = [Guid]::NewGuid().ToByteArray()
	
	$baseDate = new-object System.DateTime 1900,1,1
	$now = [DateTime]::Now
	$days = new-object System.TimeSpan ($now.Ticks - $baseDate.Ticks)
	$msecs = new-object System.TimeSpan ($now.Ticks - (new-object System.DateTime $now.Year,$now.Month,$now.Day).Ticks)
	
	$daysArray = [BitConverter]::GetBytes($days.Days)
	$msecsArray = [BitConverter]::GetBytes(($msecs.TotalMilliseconds/3.333333))
	
	[Array]::Reverse($daysArray)
	[Array]::Reverse($msecsArray)
	
	
	[Array]::Copy($daysArray, $daysArray.Length - 2, $guidArray, ($guidArray.Length - 6),2)
	[Array]::Copy($msecsArray, $msecsArray.Length - 4, $guidArray, ($guidArray.Length) - 4,4)
	
	$newGuid = new-object System.Guid (,$guidArray)
	
	$newGuid.tostring().toupper()
}

function md5($filePath)
{
	$fileInfo = get-item $filePath
	
	$md5 = new-object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
	$hash = [System.BitConverter]::ToString($md5.ComputeHash([System.IO.FILE]::ReadAllBytes($fileInfo.FullName))).Replace('-','')
	
	$hash;
}

function start-jobhere([scriptblock]$block)
{
  start-job -argumentlist (get-location),$block { set-location $args[0]; invoke-expression $args[1] }
}

##########################
# Setting Custome Path   #
##########################
"Setting Custom Path"
#$env:path += ';C:\Program Files\TortoiseHg;C:\Program Files\ngrok;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\'

$location = get-location
# start in c:\code by default
if($location.Path.Contains('System32') -or $location.Path.Contains('jordan.woodruff') -or $location.Path.Contains)
{
	push-location c:\code
}

##########################
# Stopping Services      #
##########################
#"Stopping Services"

##########################
# Mapping Drives         #
##########################
