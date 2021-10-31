# Function for authenticating to Trakt.tv
function New-TraktAuth {
    [CmdletBinding()]
    param (
        # Client Id
        [Parameter(Mandatory)]
        [string]
        $ClientId
    )
    
    begin {
        $baseUri = 'https://trakt.tv/oauth/authorize?response_type=code&'
        $clientIdUri = 'client_id=9b36d8c0db59eff5038aea7a417d73e69aea75b41aac771816d2ef1b3109cc2f' # Replace with real client id
        $redirectUri = '&redirect_uri=urn:ietf:wg:oauth:2.0:oob'

    }
    
    process {
        Invoke-RestMethod -Uri $baseUri$clientIdUri$redirectUri
    }
    
    end {
        
    }
}

# Function for getting the user's history
function Get-TraktWatched {
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter(AttributeValues)]
        [ParameterType]
        $ParameterName
    )
    
    begin {
        $Headers = @{
            "Content-Type" = "application/json"
            "Authorization" = "Bearer "
            "trakt-api-version" = 2
            "trakt-api-key"="clientId"
        }
    }
    
    process {
        $watchedHistory = Invoke-RestMethod -Uri $baseUri$clientIdUri$redirectUri -Headers
        
    }
    
    end {
        return $watchedHistory
    }
}