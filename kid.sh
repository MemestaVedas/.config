#!/bin/bash

# Navigate to your repo (optional)
# cd /path/to/your/repo

# Pull latest changes
echo "🔄 Pulling latest changes..."
git pull

# Add all changes
echo "➕ Adding changes..."
git add .

# Use provided commit message or default
COMMIT_MSG=${1:-"Auto commit on $(date '+%Y-%m-%d %H:%M:%S')"}

# Commit changes
echo "✅ Committing changes..."
git commit -m "$COMMIT_MSG"

# Push to remote
echo "📤 Pushing to remote..."
git push

echo "🎉 Done!"

