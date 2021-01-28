import { getMeasurement } from './volume_converter.js';


export function loadView() {
  loadRecents();
  loadAlphaSearch();
}


function loadRecents() {

}


function loadAlphaSearch() {
  const actionZone = document.getElementById('action-zone');
  const sectionTitle = actionZone.querySelector('.section-title');
  const sectionContent = actionZone.querySelector('.content');

  const alphaSearch = document.createElement('div');
  alphaSearch.setAttribute('id', 'alpha-search');
  sectionTitle.innerHTML = 'Select a letter to find an ingredient';
  alphaSearch.innerHTML = `
  <div>
    <button value="A">A</button>
    <button value="B">B</button>
    <button value="C">C</button>
    <button value="D">D</button>
    <button value="E">E</button>
    <button value="F">F</button>
  </div>
  <div>
    <button value="G">G</button>
    <button value="H">H</button>
    <button value="I">I</button>
    <button value="J">J</button>
    <button value="K">K</button>
    <button value="L">L</button>
    <button value="M">M</button>
  </div>
  <div>
    <button value="N">N</button>
    <button value="O">O</button>
    <button value="P">P</button>
    <button value="Q">Q</button>
    <button value="R">R</button>
    <button value="S">S</button>
  </div>
  <div>
    <button value="T">T</button>
    <button value="U">U</button>
    <button value="V">V</button>
    <button value="W">W</button>
    <button value="X">X</button>
    <button value="Y">Y</button>
    <button value="Z">Z</button>
  </div>
  `;

  sectionContent.appendChild(alphaSearch);
}


export function loadCalculator(ingredients) {
  const actionZone = document.getElementById('action-zone');
  const sectionTitle = actionZone.querySelector('.section-title');
  const sectionContent = actionZone.querySelector('.content');
  const alphaSearch = sectionContent.firstChild;

  const ingredientCalc = document.createElement('div');
  ingredientCalc.setAttribute('id', 'ingredient-calc');
  sectionTitle.innerHTML = 'Select an ingredient to convert';
  let calcStr = `<form><select name="ingredient" id="ingredient">
    <option disabled selected value> -- select an option -- </option>
  `;
      
  ingredients.forEach(ingredient => {
    calcStr += `<option value="${ ingredient.name }">${ ingredient.name }</option>`
  });

  calcStr += '</select></form>';

  calcStr += `
    <div id="basic-conversions">
      <span class="muted">Basic Conversions</span>
      <div>
        <span id="base-volume">Volume</span>
        <span id="base-ounces">Ounces</span>
        <span id="base-grams">Grams</span>
      </div>
    </div>

    <form id="conversion-selector">
      <div class="calc-row">
        <label for="amount1" class="muted">Amount</label>
        <label for="metric1" class="muted">From</label>
        <label for="metric2" class="muted">To</label>
      </div>
      <div class="calc-row">
        
        <input type="number" name="amount1" id="amount1" placeholder="Enter amount" class="number-input"></input>

        <select name="metric1" id="metric1">
          <optgroup label="Volume">
            <option value="tsp">tsp</option>
            <option value="tbsp">tbsp</option>
            <option value="c">c</option>
          </optgroup>
          <optgroup label="Weight">
            <option value="g" selected>g</option>
            <option value="oz">oz</option>
          </optgroup>
        </select>

        <select name="metric2" id="metric2">
          <optgroup label="Volume">
            <option value="tsp" selected>tsp, etc.</option>
          </optgroup>
          <optgroup label="Weight">
            <option value="g">g</option>
            <option value="oz">oz</option>
          </optgroup>
        </select>
      </div>
    </form>

    <div>
      <span class="muted">Result</span>
      <span id="result"></span>
    </div>
  `;

  ingredientCalc.innerHTML = calcStr;

  sectionContent.replaceChild(ingredientCalc, alphaSearch);

  
}


export function updateIngredient(ingredientInfo) {
  const baseVolume = document.getElementById('base-volume');
  const baseGrams = document.getElementById('base-grams');
  const baseOunces = document.getElementById('base-ounces');

  if (Number(ingredientInfo.volume)) {
    baseVolume.innerHTML = getMeasurement(ingredientInfo.volume);
  }
  else {
    baseVolume.innerHTML = ingredientInfo.volume;
  }

  baseOunces.innerHTML = ingredientInfo.ounces + ' oz';
  baseGrams.innerHTML = ingredientInfo.grams + ' g';

  updateCalculator(baseVolume, baseGrams, baseOunces);
}


function updateCalculator(baseVolume, baseGrams, baseOunces) {

}