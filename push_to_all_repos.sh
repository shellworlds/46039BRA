#!/bin/bash

# Array of repositories
repos=("46039BRA" "6039BRAI" "039BRAIN" "39BRAINC")

# Function to push to a repository
push_to_repo() {
    local repo_name=$1
    local repo_url="https://github.com/shellworlds/${repo_name}.git"
    
    echo "=== Processing: ${repo_name} ==="
    
    # Initialize git if not already
    if [ ! -d ".git" ]; then
        git init
        git config user.name "shellworlds"
        git config user.email "your_email@example.com"
    fi
    
    # Remove existing origin if any
    git remote remove origin 2>/dev/null || true
    
    # Add origin
    git remote add origin "${repo_url}"
    
    # Add all files
    git add .
    
    # Commit
    git commit -m "Initial commit: BRAINCELL Tumor Detection System
    
    Features:
    - Brain tumor detection from MRI scans
    - CNN-based deep learning model
    - Image preprocessing pipeline
    - Confidence scoring system
    - Comprehensive documentation"
    
    # Push to main branch
    git branch -M main
    git push -u origin main --force
    
    echo "✓ Successfully pushed to ${repo_name}"
    echo ""
}

# Push to all repositories
for repo in "${repos[@]}"; do
    push_to_repo "$repo"
done

echo "=== All repositories updated successfully ==="
