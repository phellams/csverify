using module .\modules\colortune\Get-ColorTune.psm1
using module .\Read-CheckSum.psm1
using module .\New-CheckSum.psm1

Function New-VerificationFile {
    <#
    .SYNOPSIS
        Generates a new VERIFICATION.txt file

    .DESCRIPTION
        Generates a new VERIFICATION.txt file

    .PARAMETER rootpath
        The root path to generate the verification file for

    .PARAMETER OutputPath
        The output path to generate the verification file to

    .EXAMPLE
        New-VerificationFile -rootpath ./dist/choco -OutputPath ./dist/choco

        Generates a new VERIFICATION.txt file for the ./dist/choco folder

    .EXAMPLE
        New-VerificationFile -rootpath ./dist/choco -OutputPath ./dist/choco/tools

        Generates a new VERIFICATION.txt file for the ./dist/choco/tools folder
    #>
    [cmdletbinding()]
    [OutputType("pscustomobject")]
    param(
        [Parameter(Mandatory=$false,position=0)]
        [String]$rootpath,
        [Parameter(Mandatory=$false, position=1)]
        [String]$OutputPath
    )
   
    [console]::write("-─◉ generating new VERIFICATION file $($global:_csverify.prop.invoke($rootpath))`n")
    
    $rootpath = $(Get-ItemProperty $rootpath).FullName
    $outPath = $(Get-ItemProperty $OutputPath).FullName

    # Check if file exists if it does, delete it and create a new one with the same name and path
    $verification_fullname = [system.io.path]::combine($outPath, 'VERIFICATION.txt')
    if (Test-Path -Path $verification_fullname) {
        [console]::write("  └─◉ $(Get-ColorTune -Text "VERIFICATION file already exists" -color yellow) $($global:_csverify.prop.invoke($verification_fullname))`n")
        [console]::write("     └─◉ deleting existing VERIFICATION file...`n")
        Remove-Item -Path $verification_fullname | Out-Null
    }
   
    New-CheckSum -Path $rootpath | Out-File -FilePath $verification_fullname -Encoding utf8
    
    [console]::write("  └─◉ $(Get-ColorTune -Text "VERIFICATION file created" -color green) $($global:_csverify.prop.invoke($verification_fullname))`n")
    
    Read-CheckSum -File $verification_fullname
}

Export-ModuleMember -Function New-VerificationFile