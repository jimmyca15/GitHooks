
Param(
    [parameter(Mandatory=$true)]
    [string]
    $remote,
    
    [parameter(Mandatory=$true)]
    [string]
    $url
)


Write-Host "Hello From PowerShell"

$allowedRemotesFile = Get-Item ./hooks/AllowedRemotes.config -ErrorAction SilentlyContinue

if ($allowedRemotesFile -eq $null) {
    Write-Warning "Could not find AllowedRemotes.config"
    exit 1
}

$contents = Get-Content $allowedRemotesFile

foreach ($content in $contents) {
    if ($content -eq $url) {
        Write-Verbose "Remote url ($url) found in allowed remotes"
        exit 0
    }
}

Write-Error "Could not find remote url ($url) in allowed remotes"
exit 1