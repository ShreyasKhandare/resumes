#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────────
# new_version.sh — Scaffold a new resume version slot
# Usage:
#   ./scripts/new_version.sh <profile> <version_tag> [note]
#
# Examples:
#   ./scripts/new_version.sh ai v2
#   ./scripts/new_version.sh fde v2 "tailored for Palantir FDSE"
#   ./scripts/new_version.sh swe v3 "added Octopus+ project"
#
# Creates:
#   profiles/<profile>/VERSION_LOG.md  (appended)
#   Prints the expected filename to copy your DOCX/PDF into
# ─────────────────────────────────────────────────────────────────

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROFILES_DIR="$REPO_ROOT/profiles"

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

resolve_profile() {
  local input="${1,,}"
  case "$input" in
    ai-engineer|ai|aie)    echo "ai-engineer" ;;
    forward-deployed-engineer|fde) echo "forward-deployed-engineer" ;;
    software-engineer|swe|se) echo "software-engineer" ;;
    *)
      echo -e "${RED}✗ Unknown profile: '$1'${RESET}" >&2
      exit 1 ;;
  esac
}

display_name_for() {
  case "$1" in
    ai-engineer) echo "AI_Engineer" ;;
    forward-deployed-engineer) echo "FDE" ;;
    software-engineer) echo "SWE" ;;
  esac
}

if [[ $# -lt 2 ]]; then
  echo -e "${BOLD}Usage:${RESET} ./scripts/new_version.sh <profile> <version_tag> [note]"
  echo -e "  Example: ./scripts/new_version.sh ai v2 \"updated FinOps bullets\""
  exit 1
fi

PROFILE=$(resolve_profile "$1")
VERSION="$2"
NOTE="${3:-}"
DISPLAY=$(display_name_for "$PROFILE")
DATE=$(date '+%Y-%m')
FILENAME="Shreyas_Khandare_${DISPLAY}_${VERSION}.docx"
PROFILE_DIR="$PROFILES_DIR/$PROFILE"
VERSION_LOG="$PROFILE_DIR/VERSION_LOG.md"

mkdir -p "$PROFILE_DIR"

# Append to VERSION_LOG
{
  echo ""
  echo "## $VERSION — $(date '+%Y-%m-%d')"
  echo "- File: \`$FILENAME\`"
  [[ -n "$NOTE" ]] && echo "- Note: $NOTE"
  echo "- Status: pending (copy file into this directory)"
} >> "$VERSION_LOG"

echo ""
echo -e "${GREEN}${BOLD}✓ Version slot created${RESET}"
echo -e "  Profile:  ${CYAN}$PROFILE${RESET}"
echo -e "  Version:  $VERSION"
echo -e "  Expected filename: ${BOLD}$FILENAME${RESET}"
echo ""
echo -e "${CYAN}Next steps:${RESET}"
echo -e "  1. Copy your updated DOCX into:"
echo -e "     ${BOLD}profiles/$PROFILE/$FILENAME${RESET}"
echo -e "  2. Set it as active:"
echo -e "     ${BOLD}./scripts/set_active.sh $1 $FILENAME${RESET}"
echo -e "  3. Commit:"
echo -e "     git add profiles/$PROFILE/"
echo -e "     git commit -m \"feat(resume): add $PROFILE $VERSION\""
[[ -n "$NOTE" ]] && echo -e "     # Note: $NOTE"
echo ""
