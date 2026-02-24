# wix-theme-base

A professional CSS design system for Wix Studio agency projects. Drop-in styles, design tokens, and utility classes that work within Wix Studio's Custom CSS panel or via the Wix CLI git integration.

## Structure

```
styles/
  tokens.css      — CSS custom properties (design tokens)
  components.css  — Pre-built component styles
  animations.css  — Keyframe animations and utility classes
  utilities.css   — Utility class library
  index.css       — Imports all of the above
```

## Usage in Wix Studio

### Option A: Custom CSS Panel (Quick start)

1. Open your site in Wix Studio Editor
2. Go to **Site** > **Custom CSS**
3. Copy the contents of `styles/index.css` (or individual files) and paste

### Option B: Wix CLI + GitHub (Recommended for agencies)

1. Set up [Wix CLI git integration](https://dev.wix.com/docs/develop-websites-sdk/code-your-site/developer-environments/ides/git-integration/set-up-git-integration-with-wix-cli)
2. Clone your Wix site repo locally
3. Copy or link files from this repo into your site's CSS directory
4. Push changes via PR — Wix CLI deploys to your site automatically

## Customizing Tokens

Create a client override file that redefines only the tokens you need:

```css
:root {
  --color-primary:       #your-brand-color;
  --color-primary-dark:  #your-brand-color-dark;
  --color-primary-light: #your-brand-color-light;
  --font-sans: "Your Brand Font", system-ui, sans-serif;
}
```

Import it after `tokens.css` and before `components.css` so components pick up the overrides.

## Component Examples

```html
<!-- Buttons -->
<div class="btn btn-primary">Get Started</div>
<div class="btn btn-outline">Learn More</div>
<div class="btn btn-ghost btn-sm">Cancel</div>

<!-- Card -->
<div class="card card-elevated">
  <div class="card-header">Plan Name</div>
  <div class="card-body">
    <p class="body-lg">Everything you need to grow.</p>
    <div class="btn btn-primary mt-4">Choose Plan</div>
  </div>
</div>

<!-- Badge -->
<span class="badge badge-success">Active</span>
<span class="badge badge-warning">Pending</span>

<!-- Typography -->
<h1 class="heading-1">Big bold headline</h1>
<p class="lead">Introductory text that sets the scene.</p>
<span class="overline">Category label</span>

<!-- Animations -->
<div class="animate-slide-up duration-base">Animated content</div>
<div class="animate-fade-in delay-200">Delayed fade</div>

<!-- Layout -->
<div class="flex items-center justify-between gap-4">
  <span class="font-semibold text-primary">Label</span>
  <span class="badge badge-primary">New</span>
</div>

<div class="grid-3">
  <div class="card card-bordered p-4">Item 1</div>
  <div class="card card-bordered p-4">Item 2</div>
  <div class="card card-bordered p-4">Item 3</div>
</div>
```

## Per-Client Repo Pattern

For each client site, create a `wix-client-<slug>` repo that extends this base:

```
wix-client-acme/
  styles/
    overrides.css   ← token overrides for this client's brand
    custom.css      ← any client-specific components
```

## Contribution

- Branch naming: `feature/<description>` or `fix/<description>`
- All changes via PR — no direct commits to `main`
- Commit style: Conventional Commits (`feat:`, `fix:`, `chore:`, `docs:`)

## License

MIT
