﻿[CmdletBinding()]
Param(
     
    [Parameter(Mandatory = $false)] [string] $Version ="7.23.0.0"
)
#Set-StrictMode -Version 3
$ErrorActionPreference = "Stop"
 
$CONFIGURATION = "Release"
$FRAMEWORK = "netcoreapp3.1"
$LEGACYFRAMEWORK="4.7"
$PLATFORM = "AnyCPU"
$BASEDIR = "."
$VCDRSERVICE_DIRNAME = "VMware.VCDRService"
$VCDRSERVICELEGACY_DIRNAME = "VMware.VCDRService_legacy"
$VCDRSERVICE_SRC = "$BASEDIR\c#.netcode\$VCDRSERVICE_DIRNAME"
$VCDRSERVICE_LEGACY_SRC = "$BASEDIR\c#.netcode\$VCDRSERVICELEGACY_DIRNAME"
$VCDRSERVICE_BASEDIR = "$BASEDIR\VMware.VCDRService"
$VCDRSERVICE_PWSH_SOURCE = "$BASEDIR\src"
$VCDRSERVICE = "$VCDRSERVICE_BASEDIR\$VERSION"

# Create the C# client
#NSWAG https://github.com/RicoSuter/NSwag has to be installed
#region NSWAG 
$NSWAG_OUTPUTFILE = "/output:.\c#.netcode\VMware.VCDRService\Client.cs"
$NSWAG_INPUTFILE = "/input:.\NSwag\vcdr.yaml"

$CLASSNAME = "/classname:VCDRServer"
$NAMESPACE = "/namespace:VMware.VCDRService"
$INJECTHTTPCLIENT = "/injectHttpClient:true"
$GENERATEBASEURLPROPERTY = "/generateBaseUrlProperty:false"
$USEBASEURL = "/useBaseUrl:true" 
$GENERATESYNCMETHODS = "/generateSyncMethods:false"
& nswag openapi2csclient $CLASSNAME $NAMESPACE $INJECTHTTPCLIENT $GENERATESYNCMETHODS $USEBASEURL $GENERATEBASEURLPROPERTY $NSWAG_INPUTFILE $NSWAG_OUTPUTFILE
#endregion NSWAG

# start NET BUILD 
#region build
Push-Location -Path $VCDRSERVICE_SRC
& dotnet build
& msbuild -t:Rebuild -p:Configuration=$CONFIGURATION -p:Platform=$PLATFORM
Copy-Item -path ".\*.cs" -Destination "..\$VCDRSERVICELEGACY_DIRNAME" -Verbose
Set-Location -Path ..\$VCDRSERVICELEGACY_DIRNAME
& msbuild VMware.VCDRService_legacy.csproj /p:Configuration=$CONFIGURATION /p:Platform=$PLATFORM /p:TargetFrameworkVersion=$LEGACYFRAMEWORK -t:Rebuild
Pop-Location
#endregion build

#Create Directories and copy files
#region CopyFiles
if (Test-Path -Path $VCDRSERVICE_BASEDIR) {
    Remove-Item -path $VCDRSERVICE_BASEDIR -recurse -force
} 
New-Item -Path $VCDRSERVICE -ItemType Directory
New-Item -Path "$VCDRSERVICE\netcore" -ItemType Directory
New-Item -Path "$VCDRSERVICE\net" -ItemType Directory
Copy-Item -path "$VCDRSERVICE_SRC\bin\$CONFIGURATION\$FRAMEWORK\*.dll" -Destination "$VCDRSERVICE\netcore"
Copy-Item -path "$VCDRSERVICE_LEGACY_SRC\bin\$CONFIGURATION\*.dll" -Destination "$VCDRSERVICE\net" 
Copy-Item -path "$VCDRSERVICE_PWSH_SOURCE\VMware.VCDRService.psm1" -Destination "$VCDRSERVICE\net" 
Copy-Item -path "$VCDRSERVICE_PWSH_SOURCE\VMware.VCDRService.psm1" -Destination "$VCDRSERVICE\netcore"  
Copy-Item -Path "$BASEDIR\LICENSE"  -Destination "$VCDRSERVICE" 
Copy-Item -Path "$BASEDIR\open_source_licenses.txt"  -Destination "$VCDRSERVICE" 
#endregion CopyFiles

#region CommonDescriptor
$TemplateHeaderPSD1=@"
#
# Module manifest for module 'VMware.VCDRService' Core
#
# Generated by: build.ps1
# 
# Generated on: $(Get-Date)
#
@{

"@ 
#remaining descriptor contents
$TemplatePSD1=@"

  # Script module or binary module file associated with this manifest.
  RootModule           = 'VMware.VCDRService.psm1' 

  # ID used to uniquely identify this module
  GUID                 = '151f6501-a080-4b44-851f-3626c97ea1a3'

  # Author of this module
  Author               = 'VMware'

  # Company or vendor of this module
  CompanyName          = 'VMware, Inc.'

  # Copyright statement for this module
  Copyright            = '2022(c) VMware Inc. All rights reserved.'

  # Description of the functionality provided by this module
  Description          = 'PowerCLI VMware Cloud Disaster Recovery module'

  # Processor architecture (None, X86, Amd64) required by this module
  # ProcessorArchitecture = ''

  # Script files (.ps1) that are run in the caller's environment prior to importing this module.
  # ScriptsToProcess = @()

  # Type files (.ps1xml) to be loaded when importing this module
  # TypesToProcess = @()

  # Format files (.ps1xml) to be loaded when importing this module
  # FormatsToProcess = @()

  # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
  # NestedModules = @()

  # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
  FunctionsToExport    = @("Connect-VCDRServer", "Disconnect-VCDRServer", "Get-VCDRCloudFileSystems", "Get-VCDRProtectedSites", "Get-VCDRProtectionGroups", "Get-VCDRSnapshot", "Get-VCDRProtectedVm", "get-VCDRRecoverySddc")

  # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
  CmdletsToExport      = @("Connect-VCDRServer", "Disconnect-VCDRServer", "Get-VCDRCloudFileSystems", "Get-VCDRProtectedSites", "Get-VCDRProtectionGroups", "Get-VCDRSnapshot", "Get-VCDRProtectedVm", "get-VCDRRecoverySddc")

  # Variables to export from this module
  VariablesToExport    = '*'

  # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
  AliasesToExport      = @()

  # DSC resources to export from this module
  # DscResourcesToExport = @()

  # List of all modules packaged with this module
  # ModuleList = @()

  # List of all files packaged with this module
  # FileList = @()

  # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
  PrivateData          = @{

    PSData = @{

      # Tags applied to this module. These help with module discovery in online galleries.
      # Tags = @()

      # A URL to the license for this module.
      # LicenseUri = ''

      # A URL to the main website for this project.
      # ProjectUri = ''

      # A URL to an icon representing this module.
      IconUri      = 'https://raw.githubusercontent.com/vmware/PowerCLI-Example-Scripts/1710f7ccbdd9fe9a3ab3f000e920fa6e8e042c63/resources/powercli-psgallery-icon.svg'
  

      # ReleaseNotes of this module
      ReleaseNotes = 'Beta Version of the VCDR PowerShell CmdLets'

      # Prerelease string of this module
      Prerelease   = 'Beta'

      # Flag to indicate whether the module requires explicit user acceptance for install/update/save
      # RequireLicenseAcceptance = $false

      # External dependent modules of this module
      # ExternalModuleDependencies = @()

    } # End of PSData hashtable

  } # End of PrivateData hashtable

  # HelpInfo URI of this module
  # HelpInfoURI = ''

  # Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
  # DefaultCommandPrefix = ''

} 
"@
#endregion CommonDescriptor

#region VMware.VCDRService.psm1
# VMware.VCDRService.psm1 Net selector
@'
#
# Script module for module 'VMware.VCDRService'
#
Set-StrictMode -Version Latest

$binaryModuleFileName = 'VMware.VCDRService.psd1'

# Set up some helper variables to make it easier to work with the module
$PSModule = $ExecutionContext.SessionState.Module
$PSModuleRoot = $PSModule.ModuleBase

# Import the appropriate nested binary module based on the current PowerShell version
$binaryModuleRoot = $PSModuleRoot

if (($PSVersionTable.Keys -contains "PSEdition") -and ($PSVersionTable.PSEdition -ne 'Desktop')) {
   $binaryModuleRoot = Join-Path -Path $PSModuleRoot -ChildPath 'netcore'
}
else {
   $binaryModuleRoot = Join-Path -Path $PSModuleRoot -ChildPath 'net'
}

$binaryModulePath = Join-Path -Path $binaryModuleRoot -ChildPath $binaryModuleFileName
$binaryModule = Import-Module -Name $binaryModulePath -PassThru

# When the module is unloaded, remove the nested binary module that was loaded with it
$PSModule.OnRemove = {
   Remove-Module -ModuleInfo $binaryModule
}
'@|set-content  "$VCDRSERVICE\VMware.VCDRService.psm1" 
#endregion VMware.VCDRService.psm1

#region CoreDescriptor
#descriptor for Standard Core
$VariableTemplateCorePSD1=@" 
  # Version number of this module.
  ModuleVersion        = '$Version'

  # Supported PSEditions
  CompatiblePSEditions = 'Core'

  # Assemblies that must be loaded prior to importing this module
  RequiredAssemblies   = @("VMware.VCDRService.dll")

  # Minimum version of the Windows PowerShell engine required by this module
  PowerShellVersion = '6.0.4'
"@
$TemplateHeaderPSD1+$VariableTemplateCorePSD1+$TemplatePSD1|set-content  -path "$VCDRSERVICE\netcore\VMware.VCDRService.psd1"
#endregion CoreDescriptor

#region NetDescriptor
#descriptor for Standard .Net
$VariableTemplateNetPSD1=@"
  # Version number of this module.
  ModuleVersion        = '$Version'

  # Supported PSEditions
  CompatiblePSEditions = 'Desktop'

  # Assemblies that must be loaded prior to importing this module
  RequiredAssemblies   = @("VMware.VCDRService.dll")


  # Minimum version of the Windows PowerShell engine required by this module
  PowerShellVersion = '3.0'

  # Minimum version of the Windows PowerShell host required by this module
  PowerShellHostVersion = ''

  # Minimum version of the .NET Framework required by this module
  DotNetFrameworkVersion = '4.5'

  # Minimum version of the common language runtime (CLR) required by this module
  CLRVersion = '4.0'
"@

$TemplateHeaderPSD1+$VariableTemplateNetPSD1+$TemplatePSD1|set-content  -path "$VCDRSERVICE\net\VMware.VCDRService.psd1"
#endregion NetDescriptor

#region NetSelectorDescriptor
#descriptor for .Net selector
$VariableTemplateCoreNetPSD1=@"
  # Version number of this module.
  ModuleVersion        = '$Version'

  # Supported PSEditions
  CompatiblePSEditions = 'Desktop', 'Core'
"@
  
$TemplateHeaderPSD1+$VariableTemplateCoreNetPSD1+$TemplatePSD1|set-content  "$VCDRSERVICE\VMware.VCDRService.psd1" 
#endregion NetSelectorDescriptor
$ZipFolder= "publish"
if ( -not (Test-Path $ZipFolder)) {  
  #PowerShell Create directory if not exists
  New-Item $ZipFolder -ItemType Directory
}

$DestZip="$ZipFolder\VMware.VCDRService-"+$Version.replace( ".","-") +".zip"
Compress-Archive -Path @(".\VMware.VCDRService",".\install.ps1","LICENSE","NOTICE","open_source_licenses.txt") -DestinationPath $DestZip


Write-Host 
Write-Host "Done."
Write-Host
write-host "To install execute .\install.ps1 -Install CurrentUser"