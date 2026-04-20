# Vextura Releases

Public release artifacts for the Vextura Workflow Platform.

| Artifact | Description |
|----------|-------------|
| `vexctl_*` archives | Unified CLI — Linux, macOS, Windows (amd64 + arm64) |
| `install.sh` | Installer script |
| `checksums.txt` | SHA-256 checksums for all release archives |

## Install vexctl

```sh
curl -fsSL https://github.com/vextura/releases/releases/latest/download/install.sh | sudo sh
```

> `sudo` is required to write to `/usr/local/bin`. To install without sudo, set a user-writable directory:
> ```sh
> INSTALL_DIR=$HOME/.local/bin curl -fsSL https://github.com/vextura/releases/releases/latest/download/install.sh | sh
> ```

Or pin a specific version:

```sh
curl -fsSL https://github.com/vextura/releases/releases/download/v1.0.2/install.sh | sudo sh
```

The script auto-detects your OS and architecture (Linux/macOS, amd64/arm64) and will print a clear error if it cannot write to the install directory.

## Manual download

All release archives are attached to each [GitHub Release](https://github.com/vextura/releases/releases).

```
vexctl_1.0.2_linux_amd64.tar.gz
vexctl_1.0.2_linux_arm64.tar.gz
vexctl_1.0.2_darwin_amd64.tar.gz
vexctl_1.0.2_darwin_arm64.tar.gz
vexctl_1.0.2_windows_amd64.zip
vexctl_1.0.2_windows_arm64.zip
install.sh
checksums.txt
```

## Usage

```sh
vexctl --help
vexctl workflow list
vexctl execution list
vexctl sdk onboard --smithy antifraud.smithy --out ./sdk/antifraud
vexctl health
```

Full documentation: contact your Vextura onboarding engineer or see the onboarding kit you received.
