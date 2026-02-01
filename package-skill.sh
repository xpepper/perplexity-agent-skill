#!/bin/bash
# Package the perplexity-web-research skill into a .skill file

set -e

SKILL_DIR="perplexity-web-research"
SKILL_FILE="perplexity-web-research.skill"

# Check if skill directory exists
if [ ! -d "$SKILL_DIR" ]; then
    echo "Error: Skill directory '$SKILL_DIR' not found"
    exit 1
fi

# Check if SKILL.md exists
if [ ! -f "$SKILL_DIR/SKILL.md" ]; then
    echo "Error: SKILL.md not found in '$SKILL_DIR'"
    exit 1
fi

# Remove old package if it exists
if [ -f "$SKILL_FILE" ]; then
    echo "Removing old package: $SKILL_FILE"
    rm "$SKILL_FILE"
fi

# Create new package
echo "Packaging skill..."
cd "$SKILL_DIR"
zip -r "../$SKILL_FILE" . -x "*.DS_Store" -x "__pycache__/*" -x "*.pyc"
cd ..

# Show result
if [ -f "$SKILL_FILE" ]; then
    SIZE=$(ls -lh "$SKILL_FILE" | awk '{print $5}')
    echo "✓ Successfully created: $SKILL_FILE ($SIZE)"
else
    echo "Error: Failed to create package"
    exit 1
fi
