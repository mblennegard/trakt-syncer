function Get-SecretFromJson {
    [CmdletBinding()]
    param (
        # # Path to secrets.json file
        # [Parameter(Mandatory)]
        # [string]
        # $PathToSecretsFile,
        # Secret key to fetch
        [Parameter(Mandatory)]
        [string]
        $SecretKey
    )
    
    begin {
        
    }
    
    process {
        $secretValue = (Get-Content -Path .\secrets.json | ConvertFrom-Json).$SecretKey
    }
    
    end {
        return $secretValue
    }
}
