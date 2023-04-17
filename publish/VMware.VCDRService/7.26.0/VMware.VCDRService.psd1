#
# Module manifest for module 'VMware.VCDRService' Core & Desktop
#
# Generated by: build.ps1
#
# Generated on: 04/16/2023 21:16:09
#
@{
  # Version number of this module.
  ModuleVersion        = '7.26.0'

  # Supported PSEditions
  CompatiblePSEditions = 'Desktop', 'Core'

  # Minimum version of the Windows PowerShell engine required by this module
  PowerShellVersion = '5.1'
  # Type files (.ps1xml) to be loaded when importing this module
  TypesToProcess = @("Types.ps1xml")
   
  # Script module or binary module file associated with this manifest.
  RootModule           = 'VMware.VCDRService.psm1'

  # ID used to uniquely identify this module
  GUID                 = '151f6501-a080-4b44-851f-3626c97ea1a3'

  # Author of this module
  Author               = 'VMware'

  # Company or vendor of this module
  CompanyName          = 'VMware, Inc.'

  # Copyright statement for this module
  Copyright            = '2023(c) VMware Inc. All rights reserved.'

  # Description of the functionality provided by this module
  Description          = 'PowerCLI VMware Cloud Disaster Recovery module'
  
  # Processor architecture (None, X86, Amd64) required by this module
  # ProcessorArchitecture = ''

  # Modules that must be imported into the global environment prior to importing this module
  RequiredModules = @(
    @{"ModuleName"="VMware.VimAutomation.Sdk";"ModuleVersion"="12.7.0.20067606"}
    @{"ModuleName"="VMware.VimAutomation.Common";"ModuleVersion"="12.7.0.20067789"}
    @{"ModuleName"="VMware.Vim";"ModuleVersion"="7.0.3.19601056"}
    @{"ModuleName"="VMware.VimAutomation.Core";"ModuleVersion"="12.7.0.20091293"}
  )

  # Script files (.ps1) that are run in the caller's environment prior to importing this module.
  # ScriptsToProcess = @()

  # Type files (.ps1xml) to be loaded when importing this module
  #TypesToProcess = @("Types.ps1xml")

  # Format files (.ps1xml) to be loaded when importing this module
  # FormatsToProcess = @()

  # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
  # NestedModules = @()

  # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
  # FunctionsToExport    = @()

  # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
  CmdletsToExport      = @("Connect-VCDRService","Disconnect-VCDRService","Get-VCDRInstance","Get-DefaultVCDRInstance","Set-DefaultVCDRInstance", "Get-VCDRCloudFileSystem", "Get-VCDRProtectedSite", "Get-VCDRProtectionGroup", "Get-VCDRSnapshot", "Get-VCDRProtectedVm", "get-VCDRRecoverySddc","Get-VmFromVCDR","Remove-HFSFilter","Get-HFSFilter")

  # Variables to export from this module
  VariablesToExport    = '*'

  # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
  AliasesToExport      = @("Connect-VCDRServer",  "Disconnect-VCDRServer")

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
      LicenseUri = 'https://github.com/vmware/vmware-powercli-for-vmware-cloud-disaster-recovery/blob/main/LICENSE'

      # A URL to the main website for this project.
      ProjectUri = 'https://github.com/vmware/vmware-powercli-for-vmware-cloud-disaster-recovery'

      # A URL to an icon representing this module.
      IconUri      = 'https://raw.githubusercontent.com/vmware/PowerCLI-Example-Scripts/1710f7ccbdd9fe9a3ab3f000e920fa6e8e042c63/resources/powercli-psgallery-icon.svg'

      # ReleaseNotes of this module
      ReleaseNotes = 'VMware Cloud Disaster Recovery PowerShell CmdLets'

      # Prerelease string of this module 
      Prerelease   = 'beta-2'

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
