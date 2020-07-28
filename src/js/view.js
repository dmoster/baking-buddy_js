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
  let calcStr = '<form><select name="ingredient" id="ingredient">';
      
  ingredients.forEach(ingredient => {
    calcStr += `<option value="${ ingredient.name }">${ ingredient.name }</option>`
  });

  calcStr += '</select>';

  calcStr += `
    
  `;

  calcStr += '</form>';

  ingredientCalc.innerHTML = calcStr;

  sectionContent.replaceChild(ingredientCalc, alphaSearch);
}