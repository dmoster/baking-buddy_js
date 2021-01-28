const ingredientSelect = document.getElementById('ingredient'),
      volumeInput = document.getElementById('volume'),
      ouncesInput = document.getElementById('ounces'),
      gramsInput = document.getElementById('grams');
let ingredients = [],
    ingredientIndex,
    ingredientDetails;


$(document).ready(() => {
  $.getJSON("../src/data/ingredients.json", data => {

    $.each(data, (index, value) => {
      ingredients.push(value);
    });


    for (let i = 0; i < ingredients.length; ++i) {
      ingredientSelect.innerHTML += `<option id="ingredient${i}" value="${i}">${ingredients[i].name}</option>`;
    }

    showMeasurements();
  });
});


function showMeasurements() {
  ingredientIndex = ingredientSelect.value;
  ingredientDetails = ingredients[ingredientIndex];
  
  volumeInput.value = ingredientDetails.volume;
  ouncesInput.value = ingredientDetails.ounces;
  gramsInput.value = ingredientDetails.grams;
}


ingredientSelect.addEventListener("change", () => {
  showMeasurements();
});