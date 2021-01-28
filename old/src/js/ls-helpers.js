/**
 * localStorage Helpers
 */

function save(item, data) {
  localStorage.setItem(item, data);
}

function load(item) {
  return localStorage.getItem(item);
}

export { save, load }