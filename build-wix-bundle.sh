#!/usr/bin/env bash
# build-wix-bundle.sh
# Generates a single concatenated CSS file ready to paste into
# Wix Studio's Custom CSS panel.
#
# Usage:
#   ./build-wix-bundle.sh noir      → dist/wix-noir.css
#   ./build-wix-bundle.sh mercado   → dist/wix-mercado.css
#   ./build-wix-bundle.sh botanica  → dist/wix-botanica.css
#   ./build-wix-bundle.sh           → all three

set -e
THEME=${1:-all}
mkdir -p dist

FONT_URL="https://fonts.googleapis.com/css2?family=Fraunces:ital,opsz,wght@0,9..144,300..900;1,9..144,300..900\&family=Plus+Jakarta+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,400\&family=JetBrains+Mono:wght@400;500\&display=swap"

build() {
  local name=$1
  local theme_file="themes/${name}.css"
  local out="dist/wix-${name}.css"

  if [ ! -f "$theme_file" ]; then
    echo "Error: theme file '$theme_file' not found."
    echo "Available themes: $(ls themes/*.css | xargs -I{} basename {} .css | tr '\n' ' ')"
    exit 1
  fi

  echo "Building $out..."

  {
    echo "/* ================================================================"
    echo "   wix-theme-base — ${name} bundle"
    echo "   Paste this into: Wix Studio Editor → Site Design → Custom CSS"
    echo ""
    echo "   Also add to Settings → Custom Code → <head>:"
    echo "   <link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">"
    echo "   <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>"
    echo "   <link href=\"${FONT_URL}\" rel=\"stylesheet\">"
    echo "================================================================ */"
    echo ""

    echo "/* === TOKENS === */"
    grep -v "^@import" styles/tokens.css
    echo ""

    echo "/* === THEME: ${name} === */"
    grep -v "^@import" "$theme_file"
    echo ""

    echo "/* === COMPONENTS === */"
    grep -v "^@import" styles/components.css
    echo ""

    echo "/* === ANIMATIONS === */"
    grep -v "^@import" styles/animations.css
    echo ""

    echo "/* === UTILITIES === */"
    grep -v "^@import" styles/utilities.css

  } > "$out"

  local lines chars
  lines=$(wc -l < "$out")
  chars=$(wc -c < "$out")
  echo "  ✓ $out — ${lines} lines, ${chars} bytes"
}

if [ "$THEME" = "all" ]; then
  build noir
  build mercado
  build botanica
else
  build "$THEME"
fi

echo ""
echo "Done. Open dist/ and copy the file contents into Wix Studio."
