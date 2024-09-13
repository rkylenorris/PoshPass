$env:AESKey = ""

function Set-EnvEncryptionKey {
    [CmdletBinding()]
    param (
        # byte array key
        [Parameter(Mandatory, ParameterSetName="Key", ValueFromPipeline=$true)]
        [byte[]]
        $Key,
        # Path to .key file containing byte array values
        [Parameter(Mandatory, ParameterSetName="File", ValueFromPipeline=$false)]
        [string]
        $KeyPath
    )

    begin {
        if($PSCmdlet.ParameterSetName -eq "File"){
            [byte[]]$Key = Get-Content $KeyPath
        }
    }

    process {
        $env:AESKey = $Key
    }

    end {

    }
}

function Get-EnvEncryptionKey {
    [CmdletBinding()]
    param (

    )

    begin {

    }

    process {
        return $env:AESKey
    }

    end {

    }
}