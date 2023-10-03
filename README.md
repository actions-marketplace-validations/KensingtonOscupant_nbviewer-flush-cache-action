# Update NBViewer Links GitHub Action

## Overview

This GitHub Action provides an automated solution to a common issue with NBViewer: NBViewer's cache delay. NBViewer, a web service for rendering Jupyter notebooks, often caches content, causing delays in seeing the most recent changes. This action addresses this problem by automatically updating NBViewer links in your README file to the latest SHA-1 version.

## Usage

To use this GitHub Action in your repository, you can add it as a step in your workflow file (e.g., `.github/workflows/main.yml`). Here's an example of how to use it:

```yaml
name: Update NBViewer Links

on:
  push:
    branches:
      - main

jobs:
  update_links:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v2

      - name: Get Latest Commit Hash
        id: commit
        run: echo "::set-output name=commit::$(git rev-parse main)"

      - run: |
            git config --global user.email "github.actions@example.com"
            git config --global user.name "NBViewerLinkBot"

      - name: Update Links in README
        run: |
          # Use sed to update links in README to include the latest commit
          latest_commit="${{ steps.commit.outputs.commit }}"
          sed -i "s|https://nbviewer.org/github/\([^/]\+\)/\([^/]\+\)/blob/\([^/]\+\)/\([^' ']\+\)|https://nbviewer.org/github/\1/\2/blob/${latest_commit}/\4|g" README.md
          git add README.md
          git commit -m "Update links to latest commit"
          git push
          ```

In this example:  
  
- The action is triggered on each push to the main branch.
- It checks out the repository, gets the latest commit hash, and then runs the action to update the NBViewer links.

You can customize the commit_email and commit_username inputs as needed. If not provided, the action will use default values.