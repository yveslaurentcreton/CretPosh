<#
    .SYNOPSIS
        Initializes the state of CretPosh Installer.

    .DESCRIPTION
        Sets up the application data folder and initializes state.json with default values.
        It is triggered internally if the state is not found when calling Get-CretPoshInstallerState.

    .NOTES
        This function does not typically need to be called directly.
#>
function Initialize-CretPoshInstallerState {
    $appData = Get-CretPoshInstallerAppData
    $folderPath = $appData.FolderPath
    $stateJsonPath = $appData.StateJsonPath

    # Ensure the folder exists
    if (-Not (Test-Path $folderPath -PathType Container)) {
        New-Item -Path $folderPath -ItemType Directory | Out-Null
    }

    # Ensure the state.json file exists, if not create it with default content
    if (-Not (Test-Path $stateJsonPath -PathType Leaf)) {
        $defaultState = @{
            step = $null  # Set default to $null and handle in Invoke-CretPoshInstaller
            restartComputer = $false
            autoRestartComputer = $false
        } | ConvertTo-Json
        Set-Content -Path $stateJsonPath -Value $defaultState -Force
    }

    $Script:CretPoshInstallerState = Get-Content -Path $appData.StateJsonPath | ConvertFrom-Json
}
