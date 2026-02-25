/**
 * page-home.js — El Mango Feliz Taqueria
 * Wix Velo page code for the homepage.
 *
 * HOW TO USE IN WIX STUDIO:
 *  1. Open the Wix Editor for your site
 *  2. Click the "Dev Mode" toggle (top bar) to enable Velo
 *  3. In the left sidebar, open "Page Code" > "Home"
 *  4. Copy-paste this file's contents into that panel
 *  5. Make sure your repeater is named "locationRepeater" and
 *     your hero section is named "heroSection" in the editor
 *
 * ELEMENTS THIS CODE EXPECTS (set these IDs in the editor):
 *  - #heroSection      — the top strip/section with the headline
 *  - #locationRepeater — a repeater with 2 items for the two locations
 *  - Inside each repeater item:
 *      #locationName   — text element for the location name
 *      #locationHours  — text element for the hours
 *      #locationDesc   — text element for the description
 *      #locationBadge  — text element for the badge (hide if null)
 */

import { LOCATIONS } from "public/locations";

$w.onReady(function () {
  // -----------------------------------------------------------------------
  // Hero fade-in
  // Adds a CSS class that triggers a fade-in animation on the hero section.
  // The class "fade-in" should be defined in your site's custom CSS.
  // -----------------------------------------------------------------------
  const hero = $w("#heroSection");
  if (hero) {
    hero.show("fade", { duration: 800 });
  }

  // -----------------------------------------------------------------------
  // Populate location repeater
  // The repeater shows each truck location with name, hours, and description.
  // -----------------------------------------------------------------------
  const repeater = $w("#locationRepeater");

  if (repeater) {
    // Set the data — each object must have a unique _id field for Wix
    repeater.data = LOCATIONS.map((loc) => ({
      _id: String(loc.id),
      name: loc.name,
      hours: loc.hours,
      description: loc.description,
      badge: loc.badge || "",
    }));

    // For each item rendered in the repeater, bind the data to the elements
    repeater.onItemReady(($item, itemData) => {
      // Location name
      $item("#locationName").text = itemData.name;

      // Hours
      $item("#locationHours").text = itemData.hours;

      // Description
      $item("#locationDesc").text = itemData.description;

      // Badge — hide it if there's no badge text
      const badge = $item("#locationBadge");
      if (badge) {
        if (itemData.badge) {
          badge.text = itemData.badge;
          badge.show();
        } else {
          badge.hide();
        }
      }
    });
  }
});
