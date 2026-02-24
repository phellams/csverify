using module modules\colortune\Get-ColorTune.psm1
using module .\Read-CheckSum.psm1
using module .\New-CheckSum.psm1

Function Test-Verification{
    <#
    .SYNOPSIS
        Tests the verification file

    .DESCRIPTION
        Tests the verification file

    .PARAMETER path
        The path to the verification file

    .EXAMPLE
        Test-Verification -path ./dist/choco/tools/VERIFICATION.txt

        Tests the verification file for the ./dist/choco/tools/VERIFICATION.txt file

    .EXAMPLE
        Test-Verification -path ./dist/choco/tools/VERIFICATION.txt

        Tests the verification file for the ./dist/choco/tools/VERIFICATION.txt file    
    #>
    [cmdletbinding()]
    [OutputType("System.Collections.ArrayList")]
    param(
        [Parameter(Mandatory=$true)]
        [String]$path
    )
    try {
        $path = $(Get-ItemProperty $path).FullName
        $verification_file_fullname = [system.io.path]::combine($path,'tools', 'VERIFICATION.txt')
        [console]::write("-─◉ testing VERIFICATION file $($global:_csverify.prop.invoke($verification_file_fullname))`n")
        $checksum = Read-CheckSum -FromString (New-CheckSum -Path $path)
        $checksum_verify = Read-CheckSum -File $verification_file_fullname
    }
    catch [System.Exception] {
        [console]::write("  └─◉ $(Get-ColorTune -Text "souce path not found" -color red) $Path $($_.Exception.Message)`n")
    }

    $verification_results = @()
    [console]::write("  └─◉ running $($global:_csverify.prop.invoke("checksum")) verification`n")
    
    foreach($item in $checksum){
        if($item.Path -eq $checksum_verify.Where({$_.Path -eq $item.Path}).Path){
            if($item.hash -eq $checksum_verify.where({$_.hash -eq $item.hash}).hash){
                $verification_results += [pscustomobject]@{
                    status = "$(Get-ColorTune -Text "Verified" -color Green)"
                    hash = "$(Get-ColorTune -Text "$($item.hash)" -color Green)"
                    sath = $item.Path
                    size = $item.Size
                }
            }
            else{ 
                $verification_results += [pscustomobject]@{
                    status = "$(Get-ColorTune -Text "Failed" -color Red)"
                    hash = "$(Get-ColorTune -Text "$($item.hash)" -color Red)"
                    path = $item.Path
                    size = $item.Size   
                }
            }
        }else{
                 $verification_results += [pscustomobject]@{
                    status = "$(Get-ColorTune -Text "Not Listed" -color Red)"
                    hash = "$(Get-ColorTune -Text "$($item.hash)" -color Red)"
                    path = $item.Path
                    Size = $item.Size   
                }           
        }
    }
    [int]$failed = $verification_results.where({ $_.Status -match "Failed" }).count
    if ($failed -ne 0) {
        foreach ($f in $verification_results.where({ $_.Status -match "Failed" })) {
            [console]::write(" $($global:_csverify.failedataWriter.invoke($f.Path))`n") 
        }
        throw [system.exception]::new("─◉ VERIFICATION failed ($(Get-ColorTune -Text "$failed failed" -color red) of $($CheckSum.count) files)")
    }else{
        [console]::write("  └─◉ $(Get-ColorTune -Text "verification successful" -color green)`n") 
        [console]::write("     └─◉ total files checked $(Get-ColorTune -Text "$($CheckSum.count)" -color green)`n")
        [console]::write("      $($global:_csverify.kvString.invoke("ReadFromRootFolder", $checksum_verify.count))`n")
        [console]::write("  └─◉ result $(Get-ColorTune -Text "$($CheckSum.count)" -color green) files verified-($(Get-ColorTune -Text "$($checksum_verify.count)" -color green) of $($CheckSum.count) files)`n")
    }
    return $verification_results | Format-Table -AutoSize
}
Export-ModuleMember -Function Test-Verification