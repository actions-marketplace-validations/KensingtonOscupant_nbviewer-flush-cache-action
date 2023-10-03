# Update NBViewer Links GitHub Action

## Overview

This GitHub Action provides an automated solution to a common issue with NBViewer: NBViewer's cache delay. NBViewer, a web service for rendering Jupyter notebooks, often caches content, causing delays in seeing the most recent changes. This action addresses this problem by automatically updating NBViewer links in your README file to the latest SHA-1 version.

## Usage

To use this GitHub Action in your repository, you can add it as a step in your workflow file (e.g., `.github/workflows/main.yml`). Here's an example of how to use it:

```yaml
name: Update NBViewer Links Workflow

on:
  push:
    branches:
      - main  # You can specify the branch you want to trigger this workflow on

jobs:
  update_links:
    runs-on: ubuntu-latest  # You can choose the appropriate runner

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Update NBViewer Links
      uses: KensingtonOscupant/nbviewer-flush-cache-action@v1.0.3
      with:
        commit_email: 'your_email@example.com'  # Optional, no need to set this one
        commit_username: 'YourUsername'         # Optional, no need to set this one
```

In this example:  
  
- The action is triggered on each push to the main branch.
- It checks out the repository, gets the latest commit hash, and then runs the action to update the NBViewer links.

You can customize the commit_email and commit_username inputs as needed. If not provided, the action will use default values.