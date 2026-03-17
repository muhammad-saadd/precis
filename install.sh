#!/usr/bin/env bash
set -euo pipefail

PRECIS_VERSION="1.0.0"
PRECIS_REPO="YOUR_USERNAME/precis"
CLAUDE_MD_URL="https://raw.githubusercontent.com/${PRECIS_REPO}/main/CLAUDE.md"
TARGET="$(pwd)/CLAUDE.md"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo ""
echo "precis v${PRECIS_VERSION} — Precision AI development"
echo ""

# Check if CLAUDE.md already exists
if [ -f "$TARGET" ]; then
  echo -e "${YELLOW}CLAUDE.md already exists in this directory.${NC}"
  echo "Overwrite? [y/N] "
  read -r response
  if [[ ! "$response" =~ ^[Yy]$ ]]; then
    echo "Aborted."
    exit 0
  fi
fi

# Download CLAUDE.md
echo "Installing precis into $(pwd)..."

if command -v curl &> /dev/null; then
  curl -fsSL "$CLAUDE_MD_URL" -o "$TARGET"
elif command -v wget &> /dev/null; then
  wget -q "$CLAUDE_MD_URL" -O "$TARGET"
else
  echo -e "${RED}Error: curl or wget is required.${NC}"
  exit 1
fi

echo -e "${GREEN}Done.${NC}"
echo ""
echo "precis installed. Your AI assistant will now develop like a senior engineer."
echo ""
echo "Works with: Claude Code, Cursor, GitHub Copilot, Gemini CLI"
echo ""
echo "Quick reference:"
echo "  /precis plan      — think before building"
echo "  /precis debug     — hypothesis-first debugging"
echo "  /precis build     — TDD-first implementation"
echo "  /precis review    — pre-merge review"
echo "  /precis ship      — atomic commit + PR"
echo "  /precis resume    — restore session context"
echo "  /precis quick     — disable auto-triggers this session"
echo ""
echo "Add --quick to any command to skip ceremony."
echo ""
