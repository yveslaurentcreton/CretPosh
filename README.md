# CretPosh - PowerShell Jet Tools

CretPosh is a PowerShell module that extends the functionality of PowerShell with additional, essential commands not available in the standard library. Designed for IT professionals, CretPosh aims to enhance productivity by providing powerful, efficient tools.

## Installation Instructions

To install the CretPosh module, execute the following command in PowerShell:

```powershell
Install-Module -Name CretPosh -Force
```

While CretPosh is compatible with Windows PowerShell, we recommend using PowerShell 7 or later for optimal performance.

### Environment Setup

To ensure a robust setup, we provide a setup script that updates PowerShellGet, installs WinGet, Windows Terminal, and the latest version of PowerShell. Additionally, the script installs CretPosh in both Windows PowerShell and PowerShell 7 or later. Run the script with administrative privileges using this command:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; irm "https://github.com/yveslaurentcreton/CretPosh/releases/latest/download/cretPosh.ps1" | iex
```

## Contributing to CretPosh

We welcome contributions from the community! If you have ideas for new scripts or improvements, please contribute by opening an issue or submitting a pull request on our GitHub repository.
