#!/bin/bash
# ============================================================
# Quick Idea Capture — saves to Apple Notes instantly
# Usage: idea "This is my idea"
# Usage: idea   (will prompt you to type)
# ============================================================

NOTE_TITLE="💡 Jeremiah's Ideas — Creative Konsoles"

if [ -z "$1" ]; then
  echo "What's the idea? (press Enter when done):"
  read -r IDEA_TEXT
else
  IDEA_TEXT="$@"
fi

TIMESTAMP=$(date "+%b %d %Y, %I:%M %p")
ENTRY="[$TIMESTAMP] $IDEA_TEXT"

osascript << APPLESCRIPT
tell application "Notes"
    set targetNote to missing value
    repeat with n in every note of default account
        if name of n is "$NOTE_TITLE" then
            set targetNote to n
            exit repeat
        end if
    end repeat

    if targetNote is missing value then
        set targetNote to make new note at default account with properties {name:"$NOTE_TITLE", body:"$NOTE_TITLE\n\n$ENTRY"}
    else
        set existingBody to body of targetNote
        set body of targetNote to existingBody & "\n$ENTRY"
    end if
end tell
APPLESCRIPT

echo "✅ Idea saved: \"$IDEA_TEXT\""
echo "   → Apple Notes: \"$NOTE_TITLE\""
