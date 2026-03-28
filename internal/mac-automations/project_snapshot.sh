#!/bin/bash
# ============================================================
# Daily Project Snapshot
# Saves a quick status note so you never lose context
# Usage: snapshot
# ============================================================

SNAPSHOT_FILE="$HOME/Documents/daily-snapshots.md"
DATE=$(date "+%A, %B %d %Y — %I:%M %p")

echo ""
echo "📸 Daily Snapshot — $DATE"
echo "================================"
echo ""
echo "What are you working on right now? (press Enter when done)"
read -r CURRENT_WORK

echo ""
echo "What's the single most important next step?"
read -r NEXT_STEP

echo ""
echo "Any ideas to remember? (hit Enter to skip)"
read -r IDEAS

echo ""
echo "How's your energy today? (1-5)"
read -r ENERGY

# Write to snapshot file
cat >> "$SNAPSHOT_FILE" << SNAPSHOT

---
## $DATE

**Working on:** $CURRENT_WORK

**Next step:** $NEXT_STEP

**Ideas:** ${IDEAS:-none}

**Energy:** $ENERGY/5

SNAPSHOT

echo ""
echo "✅ Snapshot saved to: $SNAPSHOT_FILE"
echo ""

# Also save to Apple Notes
osascript << APPLESCRIPT
tell application "Notes"
    set noteTitle to "📸 Daily Snapshots — Jeremiah"
    set noteBody to "[$DATE]
Working on: $CURRENT_WORK
Next step: $NEXT_STEP
Energy: $ENERGY/5"

    set targetNote to missing value
    repeat with n in every note of default account
        if name of n is noteTitle then
            set targetNote to n
            exit repeat
        end if
    end repeat

    if targetNote is missing value then
        make new note at default account with properties {name:noteTitle, body:noteBody}
    else
        set body of targetNote to (body of targetNote) & "\n\n" & noteBody
    end if
end tell
APPLESCRIPT

echo "   Also saved to Apple Notes."
