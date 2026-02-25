---
name: wix-dev-workflow
description: "Wix Studio development via GitHub sync. Use when: building or updating Wix client sites, pushing CSS/Velo code changes, managing client theme overrides, auditing potential leads. NOT for: Wix headless apps (different CLI), visual layout arrangement (do that in the editor)."
---

# Wix Dev Workflow

Push CSS and Velo code via GitHub. Client arranges layout in the Wix editor. You never screenshot during development — only at final delivery or approval.

---

## Repo Structure

```
mfvil/wix-theme-base/
  styles/
    tokens.css           Base design tokens (colors, spacing, typography, etc.)
    components.css       Reusable component classes
    animations.css       Keyframe animations and transitions
    utilities.css        Utility/helper classes
    index.css            Imports all of the above
  themes/
    restaurant-cantina.css   Mexican/taqueria theme
    restaurant-bistro.css    Upscale bistro theme
    restaurant-fresh.css     Casual/health-focused theme
  clients/
    <client-name>/
      theme-override.css     Client-specific overrides on top of a base theme
      velo/
        locations.js         Location data module
        page-home.js         Homepage Velo page code
      README.md              Client docs + how-to
  skills/
    wix-dev-workflow/
      SKILL.md               This file
```

---

## GitHub Sync Workflow

1. **Create branch:** `feature/<client-name>` for new clients, `fix/<client-name>-<issue>` for fixes
2. **Build files** in `clients/<client-name>/`: theme override CSS + Velo JS
3. **Commit and push** to the branch
4. **Open PR** against `main` for Otacon's review — never direct commit to main
5. **After merge:** Otacon syncs in Wix Studio GitHub Integration panel, re-publishes site
6. **Otacon arranges layout** in the Wix editor — CSS classes auto-apply to positioned elements

> **Gotcha:** Wix does NOT hot-reload CSS from GitHub. After syncing, the site must be re-published for changes to appear live.

---

## What Wix Studio Cares About

| File type | How it loads |
|---|---|
| CSS files | Add via **Site > Custom Code** panel as `<link>` or `<style>` blocks |
| Velo `.js` in `public/` | Upload via **Public Files** panel in Dev Mode |
| Velo page code | Paste into **Page Code** panel per page |
| Google Fonts | Add `<link>` tag in **Site > Custom Code** head section |

**CSS load order matters.** Always load in this order:
1. `styles/tokens.css`
2. `themes/<theme>.css`
3. `clients/<client>/theme-override.css`

---

## Branch Naming

| Task | Branch name |
|---|---|
| New client | `feature/<client-name>` |
| Bug fix | `fix/<client-name>-<issue>` |
| Base theme update | `feature/theme-<theme-name>-<change>` |

---

## Lead Audit Workflow

Use `web_fetch` on the target site URL. Analyze the HTML text for these signals — no screenshot needed:

| Signal | Points |
|---|---|
| Copyright year < 2024 | 1 |
| "Proudly created with Wix.com" in footer | 1 |
| URL still on wixsite.com (no custom domain) | 1 |
| Broken image filenames (URL-encoded garbage, 2016 file dates) | 1 |
| Page title still "BUSINESS NAME" or similar default | 1 |
| Filler contact info (`filler@godaddy.com`, placeholder phone) | 1 |
| No menu, no prices, no hours listed | 1 |

**Scoring:**
- 0-2 points: Skip — site is decent enough
- 3-4 points: Warm lead — worth a cold email
- 5+ points: Hot lead — prioritize outreach

Log qualified leads (3+) to `memory/YYYY-MM-DD.md` with score and site URL.

---

## PR Checklist

Before opening a PR, confirm:
- [ ] CSS loads in correct order (tokens > theme > override)
- [ ] All custom CSS variables are defined in `:root`
- [ ] Velo imports use correct public file paths
- [ ] README.md updated with any new classes or setup steps
- [ ] No direct commits to `main`

---

## Key Gotchas

- **Velo imports** must use `import { x } from 'public/filename'` format inside the Wix editor — not relative `./` paths
- **Wix re-publish required** after every GitHub sync for changes to go live on the public URL
- **Layout is Otacon's job** — CSS provides the system, he positions the elements
- **No screenshots during dev** — use the HTML scrape + PR review workflow; only screenshot at client delivery
