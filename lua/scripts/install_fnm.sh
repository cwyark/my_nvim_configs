#!/bin/sh

# Minimal install script for fnm
# - Detect OS and arch
# - Get latest release tag from GitHub
# - Download matching prebuilt asset (zip) and install binary into ~/.local/bin

err() { printf "%s\n" "$1" >&2; }

# Detect OS
UNAME_S=$(uname -s)
case "$UNAME_S" in
Linux*) OS=linux ;;
Darwin*) OS=darwin ;;
*)
  err "Unsupported OS: $UNAME_S"
  exit 1
  ;;
esac

# Detect arch
UNAME_M=$(uname -m)
case "$UNAME_M" in
x86_64 | amd64) ARCH=x86_64 ;;
aarch64 | arm64) ARCH=arm64 ;;
*)
  err "Unsupported architecture: $UNAME_M"
  exit 1
  ;;
esac

DEST_DIR="${HOME}/.local/bin"
mkdir -p "$DEST_DIR"

REPO_OWNER="Schniz"
REPO_NAME="fnm"
API_URL="https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/releases/latest"

# fetch tag
if command -v curl >/dev/null 2>&1; then
  TAG_NAME=$(curl -fsSL "$API_URL" | grep -m1 '"tag_name":' | sed -E 's/.*"tag_name": "([^"]+)".*/\1/')
elif command -v wget >/dev/null 2>&1; then
  TAG_NAME=$(wget -qO- "$API_URL" | grep -m1 '"tag_name":' | sed -E 's/.*"tag_name": "([^"]+)".*/\1/')
else
  err "Neither curl nor wget is available"
  exit 1
fi

if [ -z "${TAG_NAME:-}" ]; then
  err "Failed to determine latest release tag"
  exit 1
fi

VER=${TAG_NAME#v}
BASE_URL="https://github.com/$REPO_OWNER/$REPO_NAME/releases/download/$TAG_NAME"

TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT
DOWNLOAD_PATH="$TMPDIR/asset.zip"

DL_CMD="curl -fsSL -o"
if ! command -v curl >/dev/null 2>&1; then
  if command -v wget >/dev/null 2>&1; then
    DL_CMD="wget -qO"
  else
    err "Neither curl nor wget is available"
    exit 1
  fi
fi

echo "Detected: OS=$OS ARCH=$ARCH (release $TAG_NAME)"

# Build candidate name
case "$ARCH" in
x86_64)
  ASSET_NAME="fnm-linux.zip"
  ;;
arm64)
  ASSET_NAME="fnm-arm64.zip"
  ;;
*)
  err "Unsupported arch mapping: $ARCH"
  exit 1
  ;;
esac

URL="$BASE_URL/$ASSET_NAME"

echo "Downloading $URL"
if [ "$DL_CMD" = "curl -fsSL -o" ]; then
  curl -fL "$URL" -o "$DOWNLOAD_PATH"
else
  wget -q -O "$DOWNLOAD_PATH" "$URL"
fi

if [ ! -s "$DOWNLOAD_PATH" ]; then
  err "Download failed: $URL"
  exit 1
fi

# unzip and find fnm binary
if command -v unzip >/dev/null 2>&1; then
  unzip -q "$DOWNLOAD_PATH" -d "$TMPDIR"
  BIN_PATH=$(find "$TMPDIR" -type f -name 'fnm' -print -quit || true)
else
  err "zip archive downloaded but unzip is not installed"
  exit 1
fi

if [ -z "${BIN_PATH:-}" ] || [ ! -s "$BIN_PATH" ]; then
  err "fnm binary not found after extracting asset"
  ls -la "$TMPDIR" || true
  exit 1
fi

DEST="$DEST_DIR/fnm"
cp "$BIN_PATH" "$DEST"
chmod +x "$DEST"

echo "fnm installed to $DEST"
if ! printf ":%s:" "$PATH" | grep -q ":$DEST_DIR:"; then
  echo "Note: add $DEST_DIR to your PATH, e.g. export PATH=\"$DEST_DIR:\$PATH\""
fi

exit 0
