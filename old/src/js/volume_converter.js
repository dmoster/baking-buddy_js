/**
 * Volume Measurement Converter
 * 
 * This module allows for conversion of various volume measurements.
 */




class Measurement {
  constructor(amtLabel, unit, abbr, valueInTsp) {
    this.amtLabel = amtLabel;
    this.unit = unit;
    this.abbr = abbr;
    this.valueInTsp = valueInTsp;
  }

  get shortName() {
    return this.amtLabel;
  }
  get longName() {
    return this.amtLabel + ' ' + this.abbr
  }
}


// Teaspoon = 1

// Teaspoons
const teaspoon = new Measurement('1', 'teaspoon', 'tsp', 1);
const threeQuarterTsp = new Measurement('3/4', 'teaspoon', 'tsp', 0.75);
const halfTsp = new Measurement('1/2', 'teaspoon', 'tsp', 0.5);
const quarterTsp = new Measurement('1/4', 'teaspoon', 'tsp', 0.25);
const eighthTsp = new Measurement('1/8', 'teaspoon', 'tsp', 0.125);

// Tablespoons
const tablespoon = new Measurement('1', 'tablespoon', 'tbsp', 3);
const threeQuarterTbsp = new Measurement('3/4', 'tablespoon', 'tbsp', 2.25);
//const halfTbsp = new Measurement('1/2', 'tablespoon', 'tbsp', 1.5);

// Cups
const cup = new Measurement('1', 'cup', 'c', 48);
const threeQuarterCup = new Measurement('3/4', 'cup', 'c', 36);
const twoThirdCup = new Measurement('2/3', 'cup', 'c', 32);
const halfCup = new Measurement('1/2', 'cup', 'c', 24);
const thirdCup = new Measurement('1/3', 'cup', 'c', 16);
const quarterCup = new Measurement('1/4', 'cup', 'c', 12);
const eighthCup = new Measurement('1/8', 'cup', 'c', 6);


export function getMeasurement(valueInTsp) {
  let measurementStr = '';
  let numCups = 0;
  let numTbsp = 0;
  let numTsp = 0;


  // Cups
  while (valueInTsp >= cup.valueInTsp) {
    ++numCups;
    valueInTsp -= cup.valueInTsp;
  }

  measurementStr = numCups > 0 ? numCups + ' ' : '';

  if (valueInTsp >= threeQuarterCup.valueInTsp) {
    measurementStr += threeQuarterCup.longName + ' ';
    valueInTsp -= threeQuarterCup.valueInTsp;
  }
  else if (valueInTsp >= twoThirdCup.valueInTsp) {
    measurementStr += twoThirdCup.longName + ' ';
    valueInTsp -= twoThirdCup.valueInTsp;
  }
  else if (valueInTsp >= halfCup.valueInTsp) {
    measurementStr += halfCup.longName + ' ';
    valueInTsp -= halfCup.valueInTsp;
  }
  else if (valueInTsp >= thirdCup.valueInTsp) {
    measurementStr += thirdCup.longName + ' ';
    valueInTsp -= thirdCup.valueInTsp;
  }
  else if (valueInTsp >= thirdCup.valueInTsp) {
    measurementStr += thirdCup.longName + ' ';
    valueInTsp -= thirdCup.valueInTsp;
  }
  else if (valueInTsp >= quarterCup.valueInTsp) {
    measurementStr += quarterCup.longName + ' ';
    valueInTsp -= quarterCup.valueInTsp;
  }
  else if (valueInTsp >= eighthCup.valueInTsp) {
    measurementStr += eighthCup.longName + ' ';
    valueInTsp -= eighthCup.valueInTsp;
  }
  else if (numCups > 0) {
    measurementStr += cup.abbr + ' ';
  }


  // Tablespoons
  while (valueInTsp >= tablespoon.valueInTsp) {
    ++numTbsp;
    valueInTsp -= tablespoon.valueInTsp;
  }

  measurementStr += numTbsp > 0 ? numTbsp + ' ' : '';

  if (valueInTsp > threeQuarterTbsp.valueInTsp) {
    measurementStr += threeQuarterTbsp.longName + ' ';
    valueInTsp -= threeQuarterTbsp.valueInTsp;
  }
  // else if (valueInTsp >= halfTbsp.valueInTsp) {
  //   measurementStr += halfTbsp.longName + ' ';
  //   valueInTsp -= halfTbsp.valueInTsp;
  // }
  else if (numTbsp > 0) {
    measurementStr += tablespoon.abbr + ' ';
  }
  
  
  // Teaspoons
  while (valueInTsp >= teaspoon.valueInTsp) {
    ++numTsp;
    valueInTsp -= teaspoon.valueInTsp;
  }

  measurementStr += numTsp > 0 ? numTsp + ' ' : '';

  if (valueInTsp > threeQuarterTsp.valueInTsp) {
    measurementStr += threeQuarterTsp.longName + ' ';
    valueInTsp -= threeQuarterTsp.valueInTsp;
  }
  else if (valueInTsp >= halfTsp.valueInTsp) {
    measurementStr += halfTsp.longName + ' ';
    valueInTsp -= halfTsp.valueInTsp;
  }
  else if (valueInTsp >= quarterTsp.valueInTsp) {
    measurementStr += quarterTsp.longName + ' ';
    valueInTsp -= quarterTsp.valueInTsp;
  }
  else if (numTsp > 0) {
    measurementStr += teaspoon.abbr + ' ';
  }

  return measurementStr;

  //console.log(`You have ${ measurementStr }of your ingredient.`);
}

// getMeasurement(48);   // 1 c
// getMeasurement(33);   // 2/3 c 1 tsp
// getMeasurement(60);   // 1 1/4 c
// getMeasurement(3);    // 1 tbsp
// getMeasurement(120);  // 2 1/2 c
// getMeasurement(52);   // 1 c 1 tbsp 1 tsp