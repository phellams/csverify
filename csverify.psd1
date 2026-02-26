@{

    RootModule             = "csverify.psm1"
    ModuleVersion     = '0.3.7'
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
        'New-CheckSum',
        'Read-CheckSum',
        'New-VerificationFile',
        'Test-Verification'
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
            IconUri                    = 'https://raw.githubusercontent.com/phellams/phellams-general-resources/main/logos/csverify/dist/png/csverify-128x128.png'
            ReleaseNotes               = 'https://gitlab.com/phellams/csverify/-/blob/main/Releases'
            # CHOCOLATE ---------------------
            ChocoDescription = 'A PowerShell module for advanced file and folder searching with configuration management.'
            ChocoTitle       = 'csverify - Powershell Checksum Verification Module.'
            LicenseUrl       = 'https://choosealicense.com/licenses/mit'
            ProjectUrl       = 'https://gitlab.com/phellams/csverify'
            IconUrl          = 'https://raw.githubusercontent.com/phellams/phellams-general-resources/main/logos/csverify/dist/png/csverify-128x128.png'
            Docsurl          = 'https://pages.gitlab.io/sgkens/ptoml'
            MailingListUrl   = 'https://gitlab.com/phellams/csverify/issues'
            projectSourceUrl = 'https://gitlab.com/phellams/csverify'
            bugTrackerUrl    = 'https://gitlab.com/phellams/csverify/issues'
            Summary          = 'Powershell Module Designed to assist in ensuring the integrity of a codebase by generating and verifying a VERIFICATION.txt file, created for poweshell packages distributed via chocolatey, can be used to verify the integrity of any codebase.'
            # CHOCOLATE ---------------------
            # Prerelease               = 'prerelease'
        }
    }
    HelpInfoURI            = 'https://gitlab.com/sgkens/commitfusion/blob/main/README.md'
    DefaultCommandPrefix   = ''
}

