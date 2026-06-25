![Platform](https://img.shields.io/badge/Platform-Windows-blue)
![Language](https://img.shields.io/badge/Language-Batch-green)
![License](https://img.shields.io/badge/License-MIT-yellow)
![Version](https://img.shields.io/badge/Version-1.2-orange)

# Disk Assistant CLI
> Powerful Windows command-line utility for disk management, diagnostics, maintenance, and storage protection.

## Overview
Disk Assistant CLI is an interactive Windows command-line toolkit designed to simplify common disk management and maintenance tasks. Built with batch scripting, it provides a convenient and user-friendly interface for managing storage devices directly from the terminal.

The tool allows users to format USB drives, securely erase internal disks, monitor drive health, manage write protection, run CHKDSK scans, repair system files, and perform system cleanup operations — all from a single interface.

## Features
* Format USB drives (**FAT32**, **NTFS**, **exFAT**) with automatic file system recommendations
* Erase and clean internal **HDDs** and **SSDs**
* Monitor drive health using **S.M.A.R.T. diagnostics**, with report export
* Built-in **CHKDSK** integration (quick check, repair, deep scan)
* Enable or disable disk **write protection**
* **Disk Space Analyzer** — view used/free space across all drives
* **Empty Folder Finder** — locate safely removable empty directories
* **System Repair Tools** — `SFC /SCANNOW` and `DISM /RestoreHealth`
* **Recycle Bin Cleaner**
* Remove temporary files, Windows Update cache, and perform quick system cleanup
* Detects possible secondary Windows installations before wiping a disk
* Prevent accidental operations on the system drive
* Bilingual interface (**English / Russian**)
* Includes **WinRE** instructions for complete disk wiping

## Requirements
* Windows 10 / Windows 11
* Administrator privileges
* Command Prompt (CMD)

## Usage
1. Download the latest release or clone the repository.
2. Run `Disk Assistant CLI.bat` as **Administrator**.
3. Follow the on-screen instructions.

```bat
Disk Assistant CLI.bat
```

## Warning
> ⚠️ Some operations are destructive and cannot be undone.
>
> Always verify the selected disk before proceeding.

## Project Structure
```text
.
├── Assets/
├── Disk Assistant CLI.bat
├── README.md
└── LICENSE
```

## Contributing
Contributions, bug reports, and feature requests are welcome.
Feel free to open an issue or submit a pull request.

## License
This project is licensed under the MIT License.
