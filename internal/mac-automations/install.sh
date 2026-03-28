#!/bin/bash
# ============================================================
# Mac Automation Suite — Install Script
# Jeremiah Stephen Smith / Creative Konsoles
# Run once: bash install.sh
# ============================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROFILE="$HOME/.zshrc"

echo "⚙️  Installing Mac Automation Suite..."

# Make all scripts executable
chmod +x "$SCRIPT_DIR"/*.sh

# Add aliases to .zshrc
cat >> "$PROFILE" << EOF

# ============================================================
# Jeremiah's Mac Automation Suite — Creative Konsoles
# ============================================================
alias focus='bash $SCRIPT_DIR/focus_mode.sh'
alias audio='bash $SCRIPT_DIR/audio_mode.sh'
alias idea='bash $SCRIPT_DIR/quick_note.sh'
alias snapshot='bash $SCRIPT_DIR/project_snapshot.sh'
alias cleanup='bash $SCRIPT_DIR/cleanup_downloads.sh'
EOF

echo "✅  Aliases installed to $PROFILE"
echo ""
echo "Run this to activate right now:"
echo "  source ~/.zshrc"
echo ""
echo "Then use: focus | audio | idea \"your idea\" | snapshot | cleanup"
