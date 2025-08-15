<#
    .SYNOPSIS
        Gets application data paths related to CretPosh Installer.

    .DESCRIPTION
        The function retrieves and constructs paths for application data folders and state files,
        which are used in the CretPosh Installer to store and retrieve states.

    .EXAMPLE
        $appData = Get-CretPoshInstallerAppData

        Description
        -----------
        Retrieves application data paths and stores them in the $appData variable.

    .OUTPUTS
        PSCustomObject
        Returns a custom object with properties specifying paths to various app data.
#>
function Get-CretPoshInstallerAppData {
    $folderPath = Join-Path -Path $env:LOCALAPPDATA -ChildPath 'CretPosh\Installer'
    $stateJsonPath = Join-Path -Path $folderPath -ChildPath 'state.json'

    return @{
        FolderPath = $folderPath
        StateJsonPath = $stateJsonPath
    }
}