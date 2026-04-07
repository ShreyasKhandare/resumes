#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────────
# set_active.sh — Resume King CLI
# Usage:
#   ./scripts/set_active.sh <profile> <filename>
#
# Examples:
#   ./scripts/set_active.sh ai-engineer Shreyas_Khandare_AI_Engineer_v2.docx
#   ./scripts/set_active.sh fde Shreyas_Khandare_FDE_v1.docx
#   ./scripts/set_active.sh swe Shreyas_Khandare_SWE_v1.docx
#
# Aliases accepted:
#   ai-engineer  | ai | aie
#   forward-deployed-engineer | fde | fde-engineer
#   software-engineer | swe | se
# ─────────────────────────────────────────────────────────────────

set -euo pipefail

# ── Resolve repo root (works from any directory) ─────────────────
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROFILES_DIR="$REPO_ROOT/profiles"
ACTIVE_DIR="$REPO_ROOT/active"
LOG_FILE="$ACTIVE_DIR/history.log"

# ── Colors ───────────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

# ── Usage ────────────────────────────────────────────────────────
usage() {
  echo -e "${BOLD}Resume King — set_active${RESET}"
  echo ""
  echo -e "  ${CYAN}Usage:${RESET}   ./scripts/set_active.sh <profile> <filename>"
  echo ""
  echo -e "  ${CYAN}Profiles:${RESET}"
  echo -e "    ai-engineer  | ai  | aie"
  echo -e "    fde          | forward-deployed-engineer"
  echo -e "    swe          | software-engineer | se"
  echo ""
  echo -e "  ${CYAN}Examples:${RESET}"
  echo -e "    ./scripts/set_active.sh ai Shreyas_Khandare_AI_Engineer_v2.docx"
  echo -e "    ./scripts/set_active.sh fde Shreyas_Khandare_FDE_v1.docx"
  echo -e "    ./scripts/set_active.sh swe Shreyas_Khandare_SWE_v1.docx"
  echo ""
  echo -e "  ${CYAN}List available versions for a profile:${RESET}"
  echo -e "    ./scripts/set_active.sh --list <profile>"
  echo ""
  echo -e "  ${CYAN}Show current active resume:${RESET}"
  echo -e "    ./scripts/set_active.sh --status"
  echo ""
  exit 1
}

# ── Resolve profile alias → canonical folder name ────────────────
resolve_profile() {
  local input="${1,,}"  # lowercase
  case "$input" in
    ai-engineer|ai|aie)
      echo "ai-engineer" ;;
    forward-deployed-engineer|fde|fde-engineer)
      echo "forward-deployed-engineer" ;;
    software-engineer|swe|se)
      echo "software-engineer" ;;
    *)
      echo -e "${RED}✗ Unknown profile: '$1'${RESET}" >&2
      echo -e "  Valid options: ai-engineer, fde, swe" >&2
      exit 1 ;;
  esac
}

# ── --status: show what is currently active ───────────────────────
cmd_status() {
  echo -e "${BOLD}── Active Resume ──────────────────────────────────${RESET}"
  if [[ -f "$ACTIVE_DIR/current_resume.docx" ]]; then
    local current
    current=$(readlink -f "$ACTIVE_DIR/current_resume.docx" 2>/dev/null || echo "$ACTIVE_DIR/current_resume.docx")
    echo -e "  File:    ${GREEN}$(basename "$current")${RESET}"
    echo -e "  Path:    $current"
    echo -e "  Size:    $(du -h "$ACTIVE_DIR/current_resume.docx" | cut -f1)"
    echo -e "  Updated: $(date -r "$ACTIVE_DIR/current_resume.docx" '+%Y-%m-%d %H:%M')"
  else
    echo -e "  ${YELLOW}No active resume set yet.${RESET}"
    echo -e "  Run: ./scripts/set_active.sh <profile> <filename>"
  fi

  echo ""
  echo -e "${BOLD}── CURRENT files per profile ──────────────────────${RESET}"
  for profile_dir in "$PROFILES_DIR"/*/; do
    local pname
    pname=$(basename "$profile_dir")
    if [[ -f "$profile_dir/CURRENT" ]]; then
      local current_file
      current_file=$(cat "$profile_dir/CURRENT")
      echo -e "  ${CYAN}$pname${RESET}: $current_file"
    else
      echo -e "  ${CYAN}$pname${RESET}: ${YELLOW}(no CURRENT set)${RESET}"
    fi
  done
  echo ""
}

# ── --list: show all versions for a profile ───────────────────────
cmd_list() {
  local profile
  profile=$(resolve_profile "${1:-}")
  local profile_dir="$PROFILES_DIR/$profile"

  if [[ ! -d "$profile_dir" ]]; then
    echo -e "${RED}✗ Profile directory not found: $profile_dir${RESET}"
    exit 1
  fi

  echo -e "${BOLD}── Versions for: $profile ──────────────────────────${RESET}"
  local current_file=""
  [[ -f "$profile_dir/CURRENT" ]] && current_file=$(cat "$profile_dir/CURRENT")

  local count=0
  for f in "$profile_dir"/*.docx "$profile_dir"/*.pdf; do
    [[ -f "$f" ]] || continue
    local fname
    fname=$(basename "$f")
    local marker=""
    [[ "$fname" == "$current_file" ]] && marker="${GREEN} ← CURRENT${RESET}"
    echo -e "  $fname$marker"
    ((count++))
  done

  if [[ $count -eq 0 ]]; then
    echo -e "  ${YELLOW}No resume files found in $profile_dir${RESET}"
  fi
  echo ""
}

# ── Main: set active ──────────────────────────────────────────────
cmd_set() {
  local raw_profile="$1"
  local filename="$2"
  local profile
  profile=$(resolve_profile "$raw_profile")
  local profile_dir="$PROFILES_DIR/$profile"
  local source_file="$profile_dir/$filename"

  # Validate profile dir exists
  if [[ ! -d "$profile_dir" ]]; then
    echo -e "${RED}✗ Profile directory not found: $profile_dir${RESET}"
    echo -e "  Create it first: mkdir -p $profile_dir"
    exit 1
  fi

  # Validate source file exists
  if [[ ! -f "$source_file" ]]; then
    echo -e "${RED}✗ File not found: $source_file${RESET}"
    echo ""
    cmd_list "$raw_profile"
    exit 1
  fi

  # Ensure active dir exists
  mkdir -p "$ACTIVE_DIR"

  # Determine extension for active copy
  local ext="${filename##*.}"
  local active_file="$ACTIVE_DIR/current_resume.$ext"

  # Log previous active (if any)
  local prev=""
  if [[ -f "$ACTIVE_DIR/ACTIVE_META" ]]; then
    prev=$(cat "$ACTIVE_DIR/ACTIVE_META")
  fi

  # Copy to active
  cp "$source_file" "$active_file"

  # Update CURRENT pointer in profile dir
  echo "$filename" > "$profile_dir/CURRENT"

  # Write active metadata
  echo "$profile/$filename" > "$ACTIVE_DIR/ACTIVE_META"

  # Append to history log
  local timestamp
  timestamp=$(date '+%Y-%m-%d %H:%M:%S')
  printf "[%s]  SET  %-35s  from profile: %s\n" \
    "$timestamp" "$filename" "$profile" >> "$LOG_FILE"
  [[ -n "$prev" ]] && printf "[%s]  PREV %-35s\n" "$timestamp" "$prev" >> "$LOG_FILE"

  # Done
  echo ""
  echo -e "${GREEN}${BOLD}✓ Active resume updated${RESET}"
  echo -e "  Profile:  ${CYAN}$profile${RESET}"
  echo -e "  File:     $filename"
  echo -e "  Active:   $active_file"
  echo -e "  Logged:   $LOG_FILE"
  echo ""
  echo -e "${YELLOW}Reminder:${RESET} If your website points to a GitHub raw URL, commit and push to publish."
  echo -e "  git add active/ profiles/$profile/CURRENT"
  echo -e "  git commit -m \"chore(resume): set active → $profile/$filename\""
  echo -e "  git push origin main"
  echo ""
}

# ── Entrypoint ────────────────────────────────────────────────────
if [[ $# -eq 0 ]]; then
  usage
fi

case "${1:-}" in
  --status|-s)
    cmd_status ;;
  --list|-l)
    [[ $# -lt 2 ]] && { echo -e "${RED}✗ --list requires a profile name${RESET}"; usage; }
    cmd_list "$2" ;;
  --help|-h)
    usage ;;
  *)
    [[ $# -lt 2 ]] && usage
    cmd_set "$1" "$2" ;;
esac
