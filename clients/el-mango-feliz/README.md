# El Mango Feliz Taqueria — Wix Studio Theme

**Client:** El Mango Feliz Taqueria
**Live site:** https://elmango0499.wixsite.com/website
**Base theme:** Ember & Stone / Mercado
**Client override:** `clients/el-mango-feliz/theme-override.css`

---

## Design Direction

Ember & Stone Mercado theme with El Mango Feliz brand overrides. Mango yellow (#FFC300) as primary accent on deep green (#0D3D35) base. Fonts: **Fraunces** (display) and **Plus Jakarta Sans** (body).

| Token | Value | Use |
|---|---|---|
| `--emf-mango` | `#FFC300` | Buttons, badges, ornaments, price tags |
| `--emf-green-dark` | `#0D3D35` | Primary buttons, headings, footer |
| `--emf-green-mid` | `#1A4D3A` | Secondary surfaces, hover states |
| `--color-secondary` | `#E03A1A` | Chili red — used sparingly as pop |
| `--color-bg` | `#FFFDF5` | Page background (warm off-white) |
| `--font-display` | Fraunces | All headings, hero text |
| `--font-sans` | Plus Jakarta Sans | Body text, UI |

---

## How to Apply in Wix Studio

### Step 1: Add Google Fonts (head section in Custom Code)

```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Fraunces:ital,opsz,wght@0,9..144,300..900;1,9..144,300..900&family=Plus+Jakarta+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,400&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
```

### Step 2: Add CSS in order

1. `styles/tokens.css`
2. `themes/restaurant-cantina.css` (Mercado variant)
3. `clients/el-mango-feliz/theme-override.css`

> After pushing: re-sync GitHub Integration + re-publish site.

### Step 3: Velo code

1. Enable Dev Mode
2. Upload `velo/locations.js` to Public Files
3. Paste `velo/page-home.js` into Page Code > Home

---

## CSS Classes Quick Reference

| Class | Use |
|---|---|
| `.menu-section-title` | Section headers (Fraunces, mango) |
| `.menu-item-price` | Price display (green-dark, mono) |
| `.badge-featured` | Specials badge (mango) |
| `.badge-spicy` | Spice indicator (chili red) |
| `.location-card` | Location info box |
| `.social-icon-link img` | Social icons (22px constrained) |

---

## Files

```
clients/el-mango-feliz/
  theme-override.css       Mercado theme + EMF brand overrides
  velo/
    locations.js           Location data module
    page-home.js           Homepage Velo page code
  README.md                This file
```
