# Please Generation several lines of random data

function cmdlet-1 {
    [cmdletbinding()]
    param(
        [Parameter(Mandatory=$true,Position=1)]
        [String]$Path
    )
    process {
        $Path
    }
}
Export-ModuleMember -Function cmdlet-1