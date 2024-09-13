
function New-AESKey {
    [CmdletBinding()]
    param (
        # directory to save key to
        [Parameter(Mandatory=$false)]
        [string]
        $Directory=".\",
        # File name-name of project, name only no ext
        [Parameter(Mandatory=$false)]
        [string]
        $FileName="AES",
        # byte length for key
        [Parameter(Mandatory=$false)]
        [ValidateSet(16, 24, 32)]
        [int]
        $ByteLength=32,
        # return key array
        [Parameter(Mandatory=$false)]
        [switch]
        $ReturnKey
    )

    begin {
        if(-not(Test-Path $Directory)){
            throw [System.IO.FileNotFoundException] "Directory does not exist"
            return
        }
        $path = Join-Path $Directory "$($FileName).key"
        if((Test-Path $path) -and -not($force)){
            $continue = Read-Host "$path already exists, overwrite? (Y/N):"
            if($continue -eq "N"){
                return
            }
        }
    }

    process {
        [byte[]]$key = 0..255 | Get-Random -Count $ByteLength
        $key | Out-File $path
        if($ReturnKey){
            return $key
        }
    }

    end {

    }
}