import { getIngredients, getIngredientInfo } from './ingredients.js';
import { updateIngredient } from './view.js';


export function createEventListeners() {
  const alphaSearchBtns = document.querySelectorAll('#alpha-search button');

  alphaSearchBtns.forEach(btn => {
    btn.addEventListener('click', () => {
      getIngredients(btn.value);
      addIngredientListener();
    });
  });
}


function addIngredientListener() {
  const ingredientSelect = document.getElementById('ingredient');

  ingredientSelect.addEventListener('change', () => {
    const ingredientInfo = getIngredientInfo(ingredientSelect.value);
    updateIngredient(ingredientInfo);
  });
}