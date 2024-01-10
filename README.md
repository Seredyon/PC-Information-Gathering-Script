# PC Information Gathering Script

## Overview

This script is designed to gather comprehensive information about a Windows PC and save it to a text file. The collected information includes details about the operating system, hardware, network configuration, power settings, system events, USB devices, certificates, running services, user accounts, running processes, and additional details about GPU, RAM, system drive, motherboard, BIOS, network configuration, display, and installed software.

## Prerequisites

- The script requires the availability of the `wmic` command.
- The script utilizes PowerShell for certain information gathering tasks.

## Usage

1. Save the script to a file with a `.bat` extension.
2. Execute the script by double-clicking on it or running it from the command line.

## Output

The script generates a text file named `PC_Info.txt` containing the gathered information. The file is moved to the user's desktop for easy access.

## Script Details

The script is divided into several sections, each focusing on a specific category of information. Here's a breakdown:

### System Information

- Displays general information about the operating system, including OS name, version, system manufacturer, model, processor, total physical memory, and system boot time.

### Disk Information

- Lists details about disk drives, including caption, size, and media type.

### Network Adapters

- Provides information about network adapters, including caption and MAC address.

### Network Interfaces and IP Addresses

- Displays IP configuration details, such as IPv4 address, subnet mask, default gateway, and DNS servers.

### Battery Information

- Generates a battery report using the `powercfg` command.

### System Events Information

- Retrieves information about system events using the `wevtutil` command.

### USB Devices Information

- Lists details about connected USB devices.

### Certificate Information

- Displays information about certificates using the `certutil` command.

### List of Running Services

- Shows a list of running services using the `net start` command.

### User Information

- Provides details about user accounts, including name, full name, lockout status, disabled status, and last logon time.

### List of Running Processes

- Displays a list of running processes using the `tasklist` command.

### Session Information

- Runs a PowerShell script to get information about the current user's session, including the username.

### Additional Information

- Includes additional information about GPU, RAM, system drive, motherboard, BIOS, network configuration, display, and installed software.

## Notes

- The script uses a temporary PowerShell script (`GetSessionInfo.ps1`) for certain information gathering tasks.

- The `C:\ProgramData\PC_Info.txt` file is created and then moved to the user's desktop for convenience.

- The script attempts to hide the console window upon completion for a cleaner user experience.

Please make sure to review and customize the script according to your needs before executing it on any system.
