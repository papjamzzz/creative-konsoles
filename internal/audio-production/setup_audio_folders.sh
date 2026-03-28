#!/bin/bash
# ============================================================
# Jeremiah's Ableton Production Folder Setup Script
# Run once: bash setup_audio_folders.sh
# Creates the full folder structure under ~/Music/Productions/
# ============================================================

BASE="$HOME/Music/Productions"

echo "🎛️  Setting up Creative Konsoles Audio Production folders..."

# Core folders
mkdir -p "$BASE/_TEMPLATES"
mkdir -p "$BASE/_SAMPLES/Drums"
mkdir -p "$BASE/_SAMPLES/Bass"
mkdir -p "$BASE/_SAMPLES/Keys"
mkdir -p "$BASE/_SAMPLES/Guitar"
mkdir -p "$BASE/_SAMPLES/Vocals"
mkdir -p "$BASE/_SAMPLES/FX"
mkdir -p "$BASE/_SAMPLES/Loops"
mkdir -p "$BASE/_EXPORTS/WAV"
mkdir -p "$BASE/_EXPORTS/MP3"
mkdir -p "$BASE/_EXPORTS/Stems"
mkdir -p "$BASE/_RELEASES/2025"
mkdir -p "$BASE/_RELEASES/2026"
mkdir -p "$BASE/Active"
mkdir -p "$BASE/Backburner"
mkdir -p "$BASE/Archived"

echo "✅  Base folders created at: $BASE"

# ============================================================
# Function: Create a new project
# Usage: new_project "MyProjectName" 90 "Gmin"
# ============================================================
new_project() {
  local NAME=$1
  local BPM=${2:-120}
  local KEY=${3:-"Cmaj"}
  local DATE=$(date +%Y-%m-%d)
  local FOLDER="$BASE/Active/${DATE}_${NAME}_${BPM}_${KEY}"

  mkdir -p "$FOLDER/Samples/Imported"
  mkdir -p "$FOLDER/Samples/Recorded"
  mkdir -p "$FOLDER/Exports/Draft"
  mkdir -p "$FOLDER/Exports/Final"
  mkdir -p "$FOLDER/Exports/Stems"
  mkdir -p "$FOLDER/Notes"

  # Create session notes file
  cat > "$FOLDER/Notes/session-notes.txt" << NOTES
PROJECT: $NAME
DATE STARTED: $DATE
BPM: $BPM
KEY: $KEY
VIBE/CONCEPT:

GEAR USED:
[ ] Push 2
[ ] MPK Mini
[ ] Scarlett 2i2
[ ] AKG Mic
[ ] PreSonus
[ ] Sire Guitar
[ ] Ibanez Bass
[ ] MicroKorg
[ ] Novation SL MK III
[ ] Korg Turntable

SESSION LOG:
[$DATE] - Started project

NEXT STEPS:

STATUS: [ ] In Progress  [ ] Needs Mix  [ ] Mixed  [ ] Mastered  [ ] Released
NOTES

  echo "🎵  New project created: $FOLDER"
  open "$FOLDER"
}

# ============================================================
# Function: Archive a completed project
# Usage: archive_project "2026-03-27_MidnightRun_90_Gmin"
# ============================================================
archive_project() {
  local PROJECT="$BASE/Active/$1"
  if [ -d "$PROJECT" ]; then
    mv "$PROJECT" "$BASE/Archived/"
    echo "📦  Archived: $1"
  else
    echo "❌  Project not found: $1"
  fi
}

# ============================================================
# Function: List active projects
# ============================================================
list_projects() {
  echo ""
  echo "🎛️  ACTIVE PROJECTS:"
  echo "-------------------"
  ls "$BASE/Active/" 2>/dev/null || echo "  (none yet)"
  echo ""
  echo "🔥  BACKBURNER:"
  echo "-------------------"
  ls "$BASE/Backburner/" 2>/dev/null || echo "  (none)"
}

# Export functions so they can be sourced
export -f new_project
export -f archive_project
export -f list_projects

echo ""
echo "✅  Setup complete!"
echo ""
echo "HOW TO USE:"
echo "  Source this file to get commands in your terminal:"
echo "  source ~/Music/Productions/setup_audio_folders.sh"
echo ""
echo "  Then use:"
echo "  new_project \"ProjectName\" BPM Key   → creates new project folder"
echo "  list_projects                         → see what's active"
echo "  archive_project \"folder-name\"        → move finished project to archive"
echo ""
echo "  Your productions folder: $BASE"
