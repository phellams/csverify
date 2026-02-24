import-module -name .\

BeforeAll {

}

Describe "csverify.cmdlets" {
  
    it "New-CheckSum Should Return a string" {
        Set-Location .\test\test-checksums
        (New-CheckSum -Path .\).GetType().Name | should -be "String"
        Set-location ..\..\
    }
    it "Read-CheckSum Should Return a string" {
        Set-Location .\test\test-checksums
        (New-CheckSum -Path .\).GetType().Name | should -be "String"
        Set-location ..\..\
    }
    it "New-VerificationFile Should Return a string" {
        Set-Location .\test\test-checksums
        (New-VerificationFile -rootpath .\ -OutputPath .\tools).GetType().Name | should -be "Object[]"
        Get-ItemProperty .\tools\VERIFICATION.txt | should -not -be $null
        Set-location ..\..\
    }
    it "Test-Verification Should Return a string" {
        Set-Location .\test\test-checksums
        (Test-Verification -path .\ ).GetType().Name | should -be "Object[]"
        Set-location ..\..\
    }

}