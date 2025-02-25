#!/bin/bash

echo ""
echo "██████╗ ██████╗ "
echo "██╔══██╗██╔══██╗"
echo "██║  ██║██████╔╝"
echo "██║  ██║██╔═══╝ "
echo "██████╔╝██║     "
echo "╚═════╝ ╚═╝     "
echo "=================="
echo " Git Commit Tool "
echo "=================="
echo ""

# Step 1: Get the existing repository link
echo "Enter GitHub Repository Link (HTTPS):"
read REPO_LINK

# Extract repo name from the URL
REPO_NAME=$(basename -s .git "$REPO_LINK")

# Step 2: Get directory for cloning
echo "Enter the directory where you want to clone the repo (full path):"
read CLONE_DIR

# Ensure the directory exists
if [ ! -d "$CLONE_DIR" ]; then
    echo "Directory does not exist. Creating it now..."
    mkdir -p "$CLONE_DIR"
fi
cd "$CLONE_DIR" || exit

# Clone the repository
git clone "$REPO_LINK"
cd "$REPO_NAME" || exit

# Step 3: Ask for files to import
echo "Enter the full path of files/folders to move into the repository (separate by spaces):"
read FILE_PATHS

# Move files into cloned repo
mv $FILE_PATHS .

# Step 4: Ask for Git user details
echo "Enter your GitHub Username (e.g., DhruvPilot):"
read GITHUB_USER

echo "Enter your GitHub Email:"
read GIT_EMAIL

# Configure Git user details
git config --global user.name "$GITHUB_USER"
git config --global user.email "$GIT_EMAIL"

# Step 5: Ask for a custom commit date
echo "Enter commit date (YYYY-MM-DD HH:MM:SS):"
read COMMIT_DATE

# Step 6: Add and commit files with the custom timestamp
git add .
GIT_AUTHOR_DATE="$COMMIT_DATE" GIT_COMMITTER_DATE="$COMMIT_DATE" \
git commit -m "Initial commit"

# Step 7: Ask for GitHub Personal Access Token
echo "Enter GitHub Personal Access Token:"
read -s GITHUB_TOKEN  # Silent input for security

# Set remote with authentication for pushing
git remote set-url origin "https://$GITHUB_USER:$GITHUB_TOKEN@github.com/$GITHUB_USER/$REPO_NAME.git"

# Step 8: Push to GitHub
git branch -M main
git push -u origin main

echo "✅ Repository successfully set up and pushed with past date!"
