<#
    .SYNOPSIS
        Saves the current state of CretPosh Installer to a JSON file.

    .DESCRIPTION
        The function converts the state into JSON format and saves it to state.json.

    .EXAMPLE
        Save-CretPoshInstallerState

        Description
        -----------
        Saves the current state to state.json.
#>
function Save-CretPoshInstallerState {
    $appData = Get-CretPoshInstallerAppData
    $state = Get-CretPoshInstallerState
    $state | ConvertTo-Json | Set-Content -Path $appData.StateJsonPath -Force
}
