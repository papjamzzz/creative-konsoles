#!/bin/bash
# ============================================================
# Focus Mode — Claude + Dev Work
# Kills distractions, launches your tools, enables DND
# Usage: focus
# ============================================================

echo "🎯 Entering Focus Mode..."

# Enable Do Not Disturb via AppleScript
osascript << 'APPLESCRIPT'
tell application "System Events"
    tell application process "Control Center"
        -- Enable Focus/DND
    end tell
end tell
APPLESCRIPT

# Kill distraction apps
KILL_APPS=("Discord" "Slack" "Spotify" "Messages" "Mail" "News" "TV")
for app in "${KILL_APPS[@]}"; do
  if pgrep -x "$app" > /dev/null; then
    osascript -e "quit app \"$app\"" 2>/dev/null
    echo "  ✓ Closed $app"
  fi
done

# Launch work apps
echo ""
echo "🚀 Launching work tools..."

# Open Chrome to Claude
open -a "Google Chrome" "https://claude.ai"
sleep 1

# Open Terminal (for Claude Code)
osascript << 'APPLESCRIPT'
tell application "Terminal"
    activate
    if (count of windows) = 0 then
        do script ""
    end if
end tell
APPLESCRIPT

echo ""
echo "✅ Focus Mode active."
echo "   Chrome → Claude"
echo "   Terminal → ready for Claude Code"
echo ""
echo "   Rule: ONE project. Finish before adding."
