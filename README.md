# Arise Package Manager

Arise is a simple yet powerful package manager for Ubuntu, created by Juled aka L0rdDarkk.

## Features

- **Installation:** Easily install packages on your Ubuntu system using the `install` command.
- **Update:** Keep your package list up to date with the `update` command.
- **Removal:** Uninstall unwanted packages using the `remove` command.
- **List:** View a list of installed packages with the `list` command.
- **Search:** Find packages matching a search term using the `search` command.
- **Upgrade:** Upgrade all installed packages with the `upgrade` command.
- **Autoremove:** Remove unused packages with the `autoremove` command.
- **System Info:** Display basic system information with the `info` command.
- **Interactive Mode:** Navigate through options interactively with the `interactive` command.
- **Package Version:** Display version information for a specific package using the `version` command.

## Getting Started

### Prerequisites

- Ubuntu operating system
- Bash shell
- sudo privileges

### Installation

```bash
# Clone the repository
git clone https://github.com/your-username/arise-package-manager.git

# Change to the project directory
cd arise-package-manager

# Make the script executable
chmod +x arise.sh

# Run Arise interactively
./arise.sh interactive
