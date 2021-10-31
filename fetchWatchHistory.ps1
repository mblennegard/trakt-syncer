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

function Get-LoginToWeb {
    [CmdletBinding()]
    param (
        # URL
        [Parameter(Mandatory)]
        [string]
        $Url,
        # Web Session
        [WebRequestSession]
        $WebSession,
        # Username
        [Parameter(Mandatory)]
        [string]
        $Username,
        # Password
        [Parameter(Mandatory)]
        [string]
        $Password
    )
    
    begin {
        
    }
    
    process {
        $response.Forms[0].Fields["id_userLoginId"] = $secretValue.Username
        $response.Forms[0].Fields["id_password"] = $secretValue.Password
        $response = Invoke-WebRequest -Uri $Url -WebSession $webSession
    }
    
    end {
        return $response
    }
}
