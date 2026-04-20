# Vextura Releases

Public release artifacts for the Vextura Workflow Platform.

| Artifact | Description |
|----------|-------------|
| `vexctl_*` archives | Unified CLI — Linux, macOS, Windows (amd64 + arm64) |
| `checksums.txt` | SHA-256 checksums for all release archives |

## Install vexctl

```sh
curl -fsSL https://raw.githubusercontent.com/vextura/releases/main/install.sh | sh
```

Or pin a specific version:

```sh
VERSION=v1.0.0 curl -fsSL https://raw.githubusercontent.com/vextura/releases/main/install.sh | sh
```

The script auto-detects your OS and architecture (Linux/macOS, amd64/arm64).

## Manual download

All release archives are attached to each [GitHub Release](https://github.com/vextura/releases/releases).

```
vexctl_v1.0.0_linux_amd64.tar.gz
vexctl_v1.0.0_linux_arm64.tar.gz
vexctl_v1.0.0_darwin_amd64.tar.gz
vexctl_v1.0.0_darwin_arm64.tar.gz
vexctl_v1.0.0_windows_amd64.zip
vexctl_v1.0.0_windows_arm64.zip
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
