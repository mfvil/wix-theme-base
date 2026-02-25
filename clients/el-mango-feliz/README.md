# El Mango Feliz Taqueria — Wix Studio Theme

**Client:** El Mango Feliz Taqueria  
**Live site:** https://elmango0499.wixsite.com/website  
**Base theme:** `themes/restaurant-cantina.css`  
**Client override:** `clients/el-mango-feliz/theme-override.css`

---

## Design Direction

Cantina palette (chili red, teal, warm cream) extended with a mango accent (#F5A623). Fonts swapped to **Lobster Two** (display/headings — hand-painted food truck signage energy) and **Nunito** (body — friendly, rounded, readable).

| Token | Value | Use |
|---|---|---|
| `--color-primary` | `#C8261C` | Buttons, accents, links |
| `--color-secondary` | `#0A7B73` | Location card borders, hours |
| `--color-mango` | `#F5A623` | Tagline, featured badges, specials |
| `--color-bg` | `#FFF6EC` | Page background |
| `--font-display` | Lobster Two | All headings |
| `--font-sans` | Nunito | Body text, UI |

---

## How to Apply in Wix Studio

### Step 1: Connect GitHub repo

1. Open Wix Studio editor for `elmango0499.wixsite.com/website`
2. Click the **hamburger menu** (top left) > **GitHub Integration**
3. Connect to `mfvil/wix-theme-base` and select branch `feature/el-mango-feliz`
4. Wix will sync the repo contents

### Step 2: Add custom CSS

1. In Wix Studio, go to **Site** > **Custom Code** (or the CSS panel)
2. Add a `<link>` tag for Google Fonts (paste in the `<head>` section):

```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lobster+Two:ital,wght@0,400;0,700;1,400;1,700&family=Nunito:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
```

3. Add another custom code block and link/paste the CSS files in order:
   - `styles/tokens.css`
   - `themes/restaurant-cantina.css`
   - `clients/el-mango-feliz/theme-override.css`

> **Note:** Wix doesn't hot-reload CSS from GitHub. After pushing changes, you must **re-sync** in the GitHub Integration panel and **re-publish** the site for changes to go live.

### Step 3: Add Velo code

1. In Wix Studio editor, enable **Dev Mode** (toggle in top bar)
2. In the left panel, open **Public Files** and upload `velo/locations.js`
3. Open **Page Code** > **Home** and paste the contents of `velo/page-home.js`
4. Set element IDs in the editor to match what the code expects:
   - Hero section ID: `heroSection`
   - Location repeater ID: `locationRepeater`
   - Inside each repeater item: `locationName`, `locationHours`, `locationDesc`, `locationBadge`

### Step 4: Arrange the layout

Once the code and CSS are in, the visual layout arrangement is done in the **Wix editor** by dragging and positioning elements. The CSS classes will apply automatically when the right class names are set on each element.

---

## CSS Classes Quick Reference

| Class | Use |
|---|---|
| `.hero-tagline` | "Where Every Taco Tells a Story" italic mango text |
| `.hero-headline` | Main page title, Lobster Two, large |
| `.cta-button` | Red rounded call-to-action button |
| `.cta-button--secondary` | Teal variant |
| `.cta-button--mango` | Mango/gold variant |
| `.location-card` | Location box with teal left border |
| `.location-name` | Location heading inside card |
| `.location-hours` | Hours badge inside card |
| `.badge-mango` | Golden badge for specials/featured |
| `.section-label` | Uppercase overline labels |

---

## Files

```
clients/el-mango-feliz/
  theme-override.css       Client-specific CSS overrides
  velo/
    locations.js           Location data module (import in page code)
    page-home.js           Homepage Velo page code
  README.md                This file
```
