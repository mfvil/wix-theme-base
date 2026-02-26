#!/usr/bin/env bash
# build-wix-bundle.sh
# Generates a single concatenated CSS file ready to paste into
# Wix Studio's Custom CSS panel.
#
# Usage:
#   ./build-wix-bundle.sh bistro   → dist/wix-bistro.css
#   ./build-wix-bundle.sh fresh    → dist/wix-fresh.css
#   ./build-wix-bundle.sh cantina  → dist/wix-cantina.css
#   ./build-wix-bundle.sh          → all three

set -e
THEME=${1:-all}
mkdir -p dist

build() {
  local name=$1
  local out="dist/wix-${name}.css"

  echo "Building $out..."

  {
    echo "/* ================================================================"
    echo "   wix-theme-base — ${name} bundle"
    echo "   Paste this into: Wix Studio Editor → Site Design → Custom CSS"
    echo ""
    echo "   Also add to Settings → Custom Code → <head>:"
    echo "   <link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">"
    echo "   <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>"
    echo "   <link href=\"https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,600;0,700;0,800;1,400;1,600&family=Cormorant+Garamond:ital,wght@0,400;0,600;1,400;1,600&family=DM+Sans:opsz,wght@9..40,300;9..40,400;9..40,500;9..40,600&display=swap\" rel=\"stylesheet\">"
    echo "================================================================ */"
    echo ""

    # 1. Base tokens
    echo "/* === TOKENS === */"
    grep -v "^@import" styles/tokens.css
    echo ""

    # 2. Theme overrides (replaces :root with :root so no change needed)
    echo "/* === THEME: ${name} === */"
    grep -v "^@import" themes/restaurant-${name}.css
    echo ""

    # 3. Components (strip @import since tokens already included)
    echo "/* === COMPONENTS === */"
    grep -v "^@import" styles/components.css
    echo ""

    # 4. Animations
    echo "/* === ANIMATIONS === */"
    grep -v "^@import" styles/animations.css
    echo ""

    # 5. Utilities (strip @import)
    echo "/* === UTILITIES === */"
    grep -v "^@import" styles/utilities.css

  } > "$out"

  local lines
  lines=$(wc -l < "$out")
  local chars
  chars=$(wc -c < "$out")
  echo "  ✓ $out — ${lines} lines, ${chars} bytes"
}

if [ "$THEME" = "all" ]; then
  build bistro
  build fresh
  build cantina
else
  build "$THEME"
fi

echo ""
echo "Done. Open dist/ and copy the file contents into Wix Studio."
