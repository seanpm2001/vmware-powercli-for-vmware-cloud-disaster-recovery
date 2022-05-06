#
# Module manifest for module 'VMware.VCDRService' Core
#
# Generated by: build.ps1
# 
# Generated on: 05/06/2022 11:32:41
#
@{
  # Version number of this module.
  ModuleVersion        = '7.23.0.0'

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
      # RequireLicenseAcceptance = False

      # External dependent modules of this module
      # ExternalModuleDependencies = @()

    } # End of PSData hashtable

  } # End of PrivateData hashtable

  # HelpInfo URI of this module
  # HelpInfoURI = ''

  # Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
  # DefaultCommandPrefix = ''

} 
