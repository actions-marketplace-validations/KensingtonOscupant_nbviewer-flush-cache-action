# Update NBViewer Links GitHub Action

## Overview

This GitHub Action provides an automated solution to a common issue with NBViewer: NBViewer's cache delay. NBViewer, a web service for rendering Jupyter notebooks, often caches content, causing delays in seeing the most recent changes. This action addresses this problem by automatically updating NBViewer links in files of your repository to the latest SHA-1 version.

*Note: Of course this only works for links in a repository on Github; if you use links to NBViewer elsewhere, this won't help you.*

## Usage

To use this GitHub Action in your repository, first go to Settings -> Actions -> General -> Workflow Permissions. Then, scroll down to the permissions and set them to 'Read and write permissions'. Then you can add the following snippet as a step in your workflow file:

```yaml 
- name: Update NBViewer Links
  uses: KensingtonOscupant/nbviewer-flush-cache-action@v1.0.4
  with:
    file_path: 'file_path' # IMPORTANT! Set this path to the file where you would like to have the links changed
    commit_email: 'your_email@example.com'  # Optional, no need to set this one
    commit_username: 'YourUsername'         # Optional, no need to set this one
```
            

Here is a full sample workflow file that you could add to your repo (e.g., `.github/workflows/main.yml`):

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
      uses: KensingtonOscupant/nbviewer-flush-cache-action@v1.0.4
      with:
        file_path: 'file_path' # IMPORTANT! path to the file where you would like to have the links changed, for the readme it would be 'README.md'
        commit_email: 'your_email@example.com'  # Optional, no need to set this one
        commit_username: 'YourUsername'         # Optional, no need to set this one

```

In this example:  
  
- The action is triggered on each push to the main branch.
- It checks out the repository, gets the latest commit hash, and then runs the action to update the NBViewer links.

**You need to set the file_path value, i.e. the file where you want the links changed**. You can customize the commit_email and commit_username inputs as needed. If not provided, the action will use default values.