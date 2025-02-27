# Git Commit Tool

A simple and automated script to **commit files with a past timestamp** and push them to GitHub.  
This tool makes it easy to set up repositories, move files, backdate commits, and push them with proper user details.

## 📌 Features
- **Clone an existing GitHub repository** (You must create an empty repository on GitHub first)
- **Move selected files into the repo**
- **Set a custom commit timestamp** (backdate your commits)
- **Ensures proper Git identity (No duplicate contributors)**
- **Asks for a GitHub PAT token for authentication**
- **Automatically pushes commits to GitHub**

---

## 🔧 Prerequisites
Before using this tool, make sure you have:
1. **An empty repository on GitHub**  
   - You **must create a new repository manually** on GitHub before running this script.
   - Do **not** initialize it with a README or other files.
   
2. **A GitHub Personal Access Token (PAT)**  
   - Since GitHub removed password authentication for Git operations, you'll need a **PAT (Personal Access Token)**.
   - To generate a PAT:
     1. Go to [GitHub Developer Settings](https://github.com/settings/tokens).
     2. Click **"Generate new token (classic)"**.
     3. Select scopes:  
        - `repo` (Full control of private repositories)
     4. Click **Generate Token** and **copy it** (You won’t see it again!).

3. **Git installed on your system**  
   - If Git is not installed, install it:  
     **Mac:** `brew install git`  
     **Ubuntu:** `sudo apt install git`  
     **Windows:** [Download Git](https://git-scm.com/downloads)  

---
