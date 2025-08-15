<#
    .SYNOPSIS
        Registers a new scheduled task in Windows Task Scheduler for the CretPosh installer.

    .DESCRIPTION
        The `Register-CretPoshInstallerScheduledTask` function creates a new scheduled task 
        that triggers the CretPosh installer to run at logon with a delay of 15 seconds.
        The task is created under the "\CretPosh\" path with the name obtained from the `Get-InvocationScript` function or provided explicitly.
        If a task with the same name already exists, the function will not create a new one.
        PowerShell scripts executed by the task are run with the Bypass execution policy and with the highest privileges.

    .PARAMETER InstallerScript
        The path to the installer script. Optional; if not specified, the path is obtained using `Get-InvocationScript`.

    .EXAMPLE
        Register-CretPoshInstallerScheduledTask

        Description
        -----------
        Registers a new scheduled task for the CretPosh installer with the specified properties.

    .NOTES
        - Ensure that the user has the appropriate permissions to create a scheduled task in Windows.
        - Tasks will be run with the highest privileges and bypass PowerShell's execution policy.
#>
function Register-CretPoshInstallerScheduledTask {
    param (
        [string]$InstallerScript
    )

    if (-not $InstallerScript) {
        $InstallerScript = Get-InvocationScript
    }

    $taskPath = "\CretPosh\"
    $taskName = Get-Item $InstallerScript | Select-Object -ExpandProperty BaseName
    $installerScheduledTask = (Get-ScheduledTask -TaskPath $taskPath -TaskName $taskName -ErrorAction SilentlyContinue)

    if ($null -eq $installerScheduledTask)
    {
        $trigger = New-ScheduledTaskTrigger -AtLogOn
        $trigger.Delay = "PT15S"
        $action = New-ScheduledTaskAction -Execute "pwsh.exe" -Argument "-ExecutionPolicy Bypass -Command `"& '$InstallerScript'`""
        
        $installerScheduledTask = Register-ScheduledTask -TaskPath $taskPath -TaskName $taskName -Trigger $trigger -Action $action -RunLevel Highest -Force
    }
}