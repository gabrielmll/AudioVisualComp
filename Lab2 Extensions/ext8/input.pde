void keyReleased() { //Checks for released keys annd sets it to false.
  if (key < 255) {
    keyboard[key] = false; // Checks if any key was released and if yes sets it to false.
  }
}

void keyPressed() { //Checks for pressed keys annd sets it to true.
  if (key < 255) {
    keyboard[key] = true; //  Checks if any key was pressed and if yes sets it to true.
  }
}

void keyTyped() { //Cheaks for typed keys to take action.
  if (key == 's' || key == 'S') { // Resets to original image if S is pressed.
    myImage = loadImage("lion.jpg"); // Loads original image back to the variable.
  }
}




// ADDITION OR SUBCTRATION OF CHANNELS.
void input () { //Checks for combination of inputs to add or sbtract from RGB channels.  
  
  // ----- RED
  
  // addition
  if ((keyboard['r'] || keyboard['R']) && (keyboard['m'] || keyboard['M'])) {
    enR = 5;
  }
  //subtraction
  if ((keyboard['r'] || keyboard['R']) && (keyboard['l'] || keyboard['L'])) {
    enR = -5;
  }
  
  
  
  
  // ----- GREEN
  
  //addition
  if ((keyboard['g'] || keyboard['G']) && (keyboard['m'] || keyboard['M'])) {
    enG = 5;
  }
  //subtraction
  if ((keyboard['g'] || keyboard['G']) && (keyboard['l'] || keyboard['L'])) {
    enG = -5;
  }
  
  
  
  
  // ----- BLUE
  
  //adition
  if ((keyboard['b'] || keyboard['B']) && (keyboard['m'] || keyboard['M'])) {
    enB = 5;
  }
  //subtraction
  if ((keyboard['b'] || keyboard['B']) && (keyboard['l'] || keyboard['L'])) {
    enB = -5;
  }
  
}
