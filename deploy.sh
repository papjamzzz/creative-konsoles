#!/bin/bash
# Creative Konsoles — deploy to GitHub Pages
# Run this AFTER creating the GitHub repo (see instructions below)

REPO="papjamzzz/creative-konsoles"

echo ""
echo "🚀 Pushing Creative Konsoles to GitHub Pages..."
echo ""

cd "$(dirname "$0")"

git remote add origin "https://github.com/$REPO.git" 2>/dev/null || \
  git remote set-url origin "https://github.com/$REPO.git"

git push -u origin main

echo ""
echo "✅ Done! Your site will be live in ~2 minutes at:"
echo "   https://papjamzzz.github.io/creative-konsoles"
echo ""
echo "📌 To enable GitHub Pages:"
echo "   1. Go to https://github.com/$REPO/settings/pages"
echo "   2. Source → Deploy from branch → main → / (root) → Save"
echo ""
echo "🌐 To connect creativekonsoles.com later:"
echo "   Add CNAME record on Namecheap: papjamzzz.github.io"
echo "   Then set custom domain in the Pages settings above."
echo ""
