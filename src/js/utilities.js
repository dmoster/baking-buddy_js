import { getIngredients } from './ingredients.js';

export function createEventListeners() {
  const alphaSearchBtns = document.querySelectorAll('#alpha-search button');

  alphaSearchBtns.forEach(btn => {
    btn.addEventListener('click', () => getIngredients(btn.value));
  });
}