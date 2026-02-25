/**
 * locations.js — El Mango Feliz Taqueria
 * Wix Velo data module: location data for homepage and location pages.
 *
 * Usage in page code:
 *   import { LOCATIONS, getLocationById } from 'public/locations';
 */

export const LOCATIONS = [
  {
    id: 0,
    name: "Tesla & Space X",
    hours: "Monday - Sunday",
    daysShort: "Mon - Sun",
    description:
      "Our food trucks bring a unique and engaging dining experience to your mouth. Guests can watch as their meals are freshly prepared and enjoy the lively atmosphere that only a food truck can provide.",
    area: "East Austin",
    badge: null,
  },
  {
    id: 1,
    name: "Concourse Project",
    hours: "Friday - Sunday",
    daysShort: "Fri - Sun",
    description:
      "Come over to Concourse Project, the place where we party all night. Our standard menu items are always available, but we totally recommend trying the daily specials.",
    area: "East Austin",
    badge: "Weekend Specials",
  },
];

/**
 * Get a location by its array index (id).
 * @param {number} id
 * @returns {object|undefined}
 */
export function getLocationById(id) {
  return LOCATIONS.find((loc) => loc.id === id);
}

/**
 * Get locations open on a given day name.
 * @param {string} day - e.g. "Monday", "Friday", "Saturday"
 * @returns {object[]}
 */
export function getLocationsByDay(day) {
  const weekdayNames = ["Monday", "Tuesday", "Wednesday", "Thursday"];
  const weekendNames = ["Friday", "Saturday", "Sunday"];

  return LOCATIONS.filter((loc) => {
    if (loc.hours === "Monday - Sunday") return true;
    if (loc.hours === "Friday - Sunday" && weekendNames.includes(day))
      return true;
    return false;
  });
}
