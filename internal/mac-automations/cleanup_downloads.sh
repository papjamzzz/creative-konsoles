#!/bin/bash
# ============================================================
# Downloads Folder Cleanup
# Sorts files into subfolders by type
# Usage: cleanup
# ============================================================

DOWNLOADS="$HOME/Downloads"

echo "🧹 Cleaning Downloads folder..."
echo ""

# Create sort folders
mkdir -p "$DOWNLOADS/Audio"
mkdir -p "$DOWNLOADS/Images"
mkdir -p "$DOWNLOADS/Videos"
mkdir -p "$DOWNLOADS/Code"
mkdir -p "$DOWNLOADS/Docs"
mkdir -p "$DOWNLOADS/Archives"
mkdir -p "$DOWNLOADS/Apps"

MOVED=0

move_files() {
  local pattern=$1
  local dest=$2
  for f in $DOWNLOADS/$pattern; do
    if [ -f "$f" ]; then
      mv "$f" "$dest/"
      echo "  → $(basename "$f") → $(basename "$dest")/"
      ((MOVED++))
    fi
  done
}

# Audio
move_files "*.mp3" "$DOWNLOADS/Audio"
move_files "*.wav" "$DOWNLOADS/Audio"
move_files "*.aiff" "$DOWNLOADS/Audio"
move_files "*.flac" "$DOWNLOADS/Audio"
move_files "*.m4a" "$DOWNLOADS/Audio"
move_files "*.abl" "$DOWNLOADS/Audio"
move_files "*.alp" "$DOWNLOADS/Audio"
move_files "*.als" "$DOWNLOADS/Audio"

# Images
move_files "*.jpg" "$DOWNLOADS/Images"
move_files "*.jpeg" "$DOWNLOADS/Images"
move_files "*.png" "$DOWNLOADS/Images"
move_files "*.gif" "$DOWNLOADS/Images"
move_files "*.svg" "$DOWNLOADS/Images"
move_files "*.webp" "$DOWNLOADS/Images"
move_files "*.heic" "$DOWNLOADS/Images"

# Videos
move_files "*.mp4" "$DOWNLOADS/Videos"
move_files "*.mov" "$DOWNLOADS/Videos"
move_files "*.avi" "$DOWNLOADS/Videos"
move_files "*.mkv" "$DOWNLOADS/Videos"

# Code
move_files "*.py" "$DOWNLOADS/Code"
move_files "*.js" "$DOWNLOADS/Code"
move_files "*.html" "$DOWNLOADS/Code"
move_files "*.css" "$DOWNLOADS/Code"
move_files "*.sh" "$DOWNLOADS/Code"
move_files "*.json" "$DOWNLOADS/Code"

# Docs
move_files "*.pdf" "$DOWNLOADS/Docs"
move_files "*.doc" "$DOWNLOADS/Docs"
move_files "*.docx" "$DOWNLOADS/Docs"
move_files "*.txt" "$DOWNLOADS/Docs"
move_files "*.md" "$DOWNLOADS/Docs"

# Archives
move_files "*.zip" "$DOWNLOADS/Archives"
move_files "*.tar" "$DOWNLOADS/Archives"
move_files "*.gz" "$DOWNLOADS/Archives"
move_files "*.rar" "$DOWNLOADS/Archives"

# Apps
move_files "*.dmg" "$DOWNLOADS/Apps"
move_files "*.pkg" "$DOWNLOADS/Apps"

echo ""
echo "✅ Done. Moved $MOVED files."
echo "   Downloads folder: $DOWNLOADS"
