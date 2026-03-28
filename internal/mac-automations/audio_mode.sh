#!/bin/bash
# ============================================================
# Audio Mode — Ableton + Production Session
# Optimizes Mac for audio, launches Ableton
# Usage: audio
# ============================================================

echo "🎛️  Entering Audio Mode..."

# Kill heavy CPU apps that cause audio glitches
KILL_APPS=("Google Chrome" "Slack" "Discord" "Mail" "Spotlight")
for app in "${KILL_APPS[@]}"; do
  if pgrep -x "$app" > /dev/null; then
    osascript -e "quit app \"$app\"" 2>/dev/null
    echo "  ✓ Closed $app (reduces audio glitches)"
  fi
done

# Disable Bluetooth if connected (reduces latency)
# Uncomment if you want this:
# blueutil --power 0

# Set energy to high performance (plugged in assumed)
sudo pmset -c lowpowermode 0 2>/dev/null

# Launch Ableton Live
echo ""
echo "🚀 Launching Ableton Live..."
open -a "Ableton Live 11 Suite" 2>/dev/null || \
open -a "Ableton Live 12 Suite" 2>/dev/null || \
open -a "Ableton Live" 2>/dev/null || \
echo "  ⚠️  Ableton not found — open it manually"

sleep 2

echo ""
echo "✅ Audio Mode active."
echo ""
echo "   BUFFER REMINDER:"
echo "   Live sessions (playing):    128 samples"
echo "   Mixing / no live input:     512 samples"
echo "   Heavy plugins / rendering:  1024 samples"
echo ""
echo "   Sample Rate: 44.1kHz (music) / 48kHz (video)"
