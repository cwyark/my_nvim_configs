#!/bin/sh

# Minimal install script for lazygit
# - Detect OS and arch
# - Get latest release tag from GitHub
# - Download matching prebuilt tar.gz or binary
# - Install lazygit into ~/.local/bin

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

# Detect arch and map to lazygit naming (x86_64 or arm64)
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

REPO_OWNER="jesseduffield"
REPO_NAME="lazygit"
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
# lazygit assets use the pattern: lazygit_<ver>_<os>_<arch>.tar.gz
FNAME_BASE="lazygit_${VER}_${OS}_${ARCH}"
BASE_URL="https://github.com/$REPO_OWNER/$REPO_NAME/releases/download/$TAG_NAME"

TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT
DOWNLOAD_PATH="$TMPDIR/asset"

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

CANDIDATES="$FNAME_BASE.tar.gz $FNAME_BASE.tgz $FNAME_BASE.zip $FNAME_BASE"
ASSET_NAME=""
for name in $CANDIDATES; do
  url="$BASE_URL/$name"
  echo "Trying $url"
  if [ "$DL_CMD" = "curl -fsSL -o" ]; then
    if curl -fsSL "$url" -o "$DOWNLOAD_PATH"; then
      ASSET_NAME="$name"
      break
    fi
  else
    if wget -q -O "$DOWNLOAD_PATH" "$url"; then
      ASSET_NAME="$name"
      break
    fi
  fi
done

if [ -z "${ASSET_NAME:-}" ]; then
  err "Could not download a matching lazygit asset for $OS/$ARCH (release $TAG_NAME)"
  exit 1
fi

# Extract and find binary
BIN_PATH=""
case "$ASSET_NAME" in
*.tar.gz | *.tgz)
  tar -xzf "$DOWNLOAD_PATH" -C "$TMPDIR"
  BIN_PATH=$(find "$TMPDIR" -type f -name lazygit -print -quit || true)
  ;;
*.zip)
  if command -v unzip >/dev/null 2>&1; then
    unzip -q "$DOWNLOAD_PATH" -d "$TMPDIR"
    BIN_PATH=$(find "$TMPDIR" -type f -name lazygit -print -quit || true)
  else
    err "Downloaded zip but unzip not available"
    exit 1
  fi
  ;;
*)
  BIN_PATH="$DOWNLOAD_PATH"
  ;;
esac

if [ -z "${BIN_PATH:-}" ] || [ ! -s "$BIN_PATH" ]; then
  err "lazygit binary not found after extracting asset"
  ls -la "$TMPDIR" || true
  exit 1
fi

DEST="$DEST_DIR/lazygit"
cp "$BIN_PATH" "$DEST"
chmod +x "$DEST"

echo "lazygit installed to $DEST"
if ! printf ":%s:" "$PATH" | grep -q ":$DEST_DIR:"; then
  echo "Note: add $DEST_DIR to your PATH, e.g. export PATH=\"$DEST_DIR:\$PATH\""
fi

exit 0
