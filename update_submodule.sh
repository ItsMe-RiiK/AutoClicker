#!/bin/bash
# This script updates the RKKDR submodule pointer to match the latest commit
# from your local KernelDriver repository WITHOUT downloading the files locally.
# This prevents file duplication on your local machine.

PARENT_REPO="../KernelDriver"
SUBMODULE_PATH="RKKDR"

if [ ! -d "$PARENT_REPO" ]; then
    echo "Error: Parent repository not found at $PARENT_REPO"
    exit 1
fi

# Get the latest commit hash from the local parent repository
LATEST_COMMIT=$(git -C "$PARENT_REPO" rev-parse HEAD)

if [ -z "$LATEST_COMMIT" ]; then
    echo "Error: Could not get latest commit from $PARENT_REPO"
    exit 1
fi

echo "Found latest commit in KernelDriver: $LATEST_COMMIT"

# Update the git index directly (updates the submodule pointer without checking out files)
git update-index --cacheinfo 160000,$LATEST_COMMIT,$SUBMODULE_PATH

echo "✅ Submodule $SUBMODULE_PATH pointer updated successfully!"
echo "Run 'git status' to see the changes, and 'git commit' to save the bump."
