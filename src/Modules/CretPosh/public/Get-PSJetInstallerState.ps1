<#
    .SYNOPSIS
        Retrieves the current state of CretPosh Installer.

    .DESCRIPTION
        Retrieves the current state of CretPosh Installer. If no state is set,
        it initializes the state by calling Initialize-CretPoshInstallerState function.

    .EXAMPLE
        $state = Get-CretPoshInstallerState

        Description
        -----------
        Retrieves the current state and stores it in the $state variable.

    .OUTPUTS
        PSCustomObject
        Returns a custom object representing the current state of the installer.
#>
function Get-CretPoshInstallerState {
    if (-Not $Script:CretPoshInstallerState) {
        Initialize-CretPoshInstallerState
    }

    return $Script:CretPoshInstallerState
}
