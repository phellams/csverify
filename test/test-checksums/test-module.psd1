# Basic Module Manifest
# Generated on: 8/11/2023

@{
    RootModule             = 'test-module.psm1'
    ModuleVersion     = '0.1.0'
    CompatiblePSEditions   = @()
    GUID                   = 'c7e7262e-8c66-4c0d-9454-9927449c2927'
    Author                 = 'Garvey k. Snow'
    CompanyName            = 'sgkens'
    Copyright              = '2023 Garvey k. Snow. All rights reserved.'
    Description            = 'Powershell Module Designed to assist in ensuring the integrity of a codebase by generating and verifying a VERIFICATION.txt file, created for poweshell packages distributed via chocolatey, can be used to verify the integrity of any codebase.'
    PowerShellVersion      = '7.0'
    PowerShellHostName     = ''
    PowerShellHostVersion  = ''
    DotNetFrameworkVersion = ''
    ClrVersion             = ''
    ProcessorArchitecture  = ''
    RequiredModules        = @()
    RequiredAssemblies     = @()
    ScriptsToProcess       = @()
    TypesToProcess         = @()
    FormatsToProcess       = @()
    NestedModules          = @()
    FunctionsToExport      = @(
        'cmdlet-1'
    )
    CmdletsToExport        = @()
    VariablesToExport      = @()
    AliasesToExport        = @()
    DscResourcesToExport   = @()
    ModuleList             = @()
    FileList               = @()
    PrivateData            = @{
        PSData = @{
            Tags                       = @('automation', 'checksum', 'hash', 'module', 'powershell', 'powershellcore', 'tool', 'utility', 'utility-module')
            LicenseUri                 = 'https://choosealicense.com/licenses/mit'
            ProjectUri                 = 'https://gitlab.com/phellams/csverify'
            IconUri                    = 'https://raw.githubusercontent.com/sgkens/resources/main/modules/CommitFusion/dist/v2/commitfusion-icon-x128.png'
            ReleaseNotes               = 'https://gitlab.com/phellams/csverify/-/blob/main/Releases'
            # CHOCOLATE ---------------------
            ChocoDescription = 'A PowerShell module for advanced file and folder searching with configuration management.'
            ChocoTitle       = 'csverify - Powershell Checksum Verification Module.'
            LicenseUrl       = 'https://choosealicense.com/licenses/mit'
            ProjectUrl       = 'https://github.com/phellams/csverify'
            IconUrl          = 'https://raw.githubusercontent.com/phellams/phellams-general-resources/main/logos/csverify/csverify-logo-128x128.png'
            Docsurl          = 'https://pages.gitlab.io/sgkens/ptoml'
            MailingListUrl   = 'https://github.com/phellams/csverify/issues'
            projectSourceUrl = 'https://github.com/phellams/csverify'
            bugTrackerUrl    = 'https://github.com/phellams/csverify/issues'
            Summary          = 'Powershell Module Designed to assist in ensuring the integrity of a codebase by generating and verifying a VERIFICATION.txt file, created for poweshell packages distributed via chocolatey, can be used to verify the integrity of any codebase.'
            # CHOCOLATE ---------------------
            # Prerelease               = 'prerelease'
        }
    }    
}   