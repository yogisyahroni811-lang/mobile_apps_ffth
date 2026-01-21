#!/bin/bash

# Script to merge all 6 feature branches into the current branch (main/default)
# Usage: ./merge_all_branches.sh

echo "Fetching all branches..."
git fetch --all

BRANCHES=(
  "origin/feat-build-flutter-screens-10406399558973031570"
  "origin/feat-field-worker-app-8643981255773287571"
  "origin/feat-initial-app-scaffold-15687281440595613575"
  "origin/feat-initial-flutter-app-1350351919382533406"
  "origin/feat-installer-app-6051577947837099280"
  "origin/feature-flutter-technician-app-15712932608968150123"
)

echo "Starting merge process..."

for branch in "${BRANCHES[@]}"; do
  echo "------------------------------------------------"
  echo "Attempting to merge $branch..."

  # Try simple merge first
  if git merge "$branch" --no-edit; then
    echo "Successfully merged $branch"
  else
    echo "Simple merge failed. Trying with --allow-unrelated-histories..."
    if git merge "$branch" --allow-unrelated-histories --no-edit; then
      echo "Successfully merged $branch with unrelated histories."
    else
      echo "FAILED to merge $branch. Manual intervention required."
      # Abort this merge attempt to keep the repo clean for the next one,
      # or stop script? Usually safer to stop.
      echo "Aborting merge of $branch to preserve state."
      git merge --abort
    fi
  fi
done

echo "------------------------------------------------"
echo "Merge process complete. Please check for conflicts."
