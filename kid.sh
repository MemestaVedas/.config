#!/bin/bash
echo "🔄 Pulling latest changes..."
git pull

echo "➕ Adding changes..."
git add .

COMMIT_MSG=${1:-"Auto commit on $(date '+%Y-%m-%d %H:%M:%S')"}

# Commit changes
echo "✅ Committing changes..."
git commit -m "$COMMIT_MSG"

# Push to remote
echo "📤 Pushing to remote..."
git push

echo "🎉 Done!"

