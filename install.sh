#!/usr/bin/env sh
# vexctl installer — downloads the latest release from github.com/vextura/releases
# Usage: curl -fsSL https://raw.githubusercontent.com/vextura/releases/main/install.sh | sh
# Or pin a version: VERSION=v1.0.0 curl -fsSL ... | sh

set -e

REPO="vextura/releases"
BINARY="vexctl"
INSTALL_DIR="${INSTALL_DIR:-/usr/local/bin}"

# ---------- helpers ----------

die() { echo "error: $*" >&2; exit 1; }

need() {
  command -v "$1" >/dev/null 2>&1 || die "required tool not found: $1"
}

need curl
need tar

# ---------- detect platform ----------

OS=$(uname -s | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)

case "$OS" in
  linux)  OS="linux"   ;;
  darwin) OS="darwin"  ;;
  *)      die "unsupported OS: $OS" ;;
esac

case "$ARCH" in
  x86_64 | amd64)  ARCH="amd64" ;;
  arm64  | aarch64) ARCH="arm64" ;;
  *)                die "unsupported architecture: $ARCH" ;;
esac

# ---------- resolve version ----------

if [ -z "$VERSION" ]; then
  VERSION=$(curl -fsSL "https://api.github.com/repos/${REPO}/releases/latest" \
    | grep '"tag_name"' | head -1 | sed 's/.*"tag_name": *"\([^"]*\)".*/\1/')
fi

[ -n "$VERSION" ] || die "could not determine latest version"

echo "Installing vexctl ${VERSION} (${OS}/${ARCH}) → ${INSTALL_DIR}/${BINARY}"

# ---------- download & install ----------

# Tag is v1.0.0 but GoReleaser strips the v from archive filenames → vexctl_1.0.0_...
VER="${VERSION#v}"
ARCHIVE="vexctl_${VER}_${OS}_${ARCH}.tar.gz"
URL="https://github.com/${REPO}/releases/download/${VERSION}/${ARCHIVE}"

TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT

curl -fsSL "$URL" -o "${TMP}/${ARCHIVE}"
tar -xzf "${TMP}/${ARCHIVE}" -C "$TMP"

install -m 755 "${TMP}/vexctl" "${INSTALL_DIR}/${BINARY}"

echo "vexctl installed successfully."
"${INSTALL_DIR}/${BINARY}" --version

