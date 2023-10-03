#!/bin/sh
set -e

# Get the latest commit hash
latest_commit="$(git rev-parse main)"

# Update links in README to include the latest commit
sed -i "s|https://nbviewer.org/github/\([^/]\+\)/\([^/]\+\)/blob/\([^/]\+\)/\([^' ']\+\)|https://nbviewer.org/github/\1/\2/blob/${latest_commit}/\4|g" README.md

# Commit and push changes
git add README.md
git commit -m "Update links to latest commit"
git push
