# Shared coloured logging helpers for tty output.
# Include from scripts via includeTemplate "script-logging.sh".

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Colour
TITLE_LINE='━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━'

log_header() {
  echo -e "${BLUE}${TITLE_LINE}${NC}"
  echo -e "${BLUE}  ${*}${NC}"
  echo -e "${BLUE}${TITLE_LINE}${NC}"
}

log_info() {
  echo -e "${CYAN}ℹ ${*}${NC}"
}

log_success() {
  echo -e "${GREEN}✓ ${*}${NC}"
}

log_warn() {
  echo -e "${YELLOW}⚠ ${*}${NC}"
}

log_error() {
  echo -e "${RED}✗ ${*}${NC}" >&2
}

log_note() {
  echo -e "${YELLOW}Note:${NC} ${*}"
}

log_kv() {
  local label="$1"
  shift
  echo -e "${CYAN}${label}:${NC} ${*}"
}

log_done() {
  echo ""
  echo -e "${BLUE}${TITLE_LINE}${NC}"
  echo -e "${GREEN}✓ ${*}${NC}"
  echo -e "${BLUE}${TITLE_LINE}${NC}"
}
