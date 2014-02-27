/*This code draws the image loaded to the variable myImage and each time you click on it, 
it swaps the RGB channels of the original image and draws again.
The channel swap happens in the following order: RGB(start), BRG, GBR.
The Program works with any image you load to the variable myImage.*/

//----- Declaring global variables. -----

PImage myImage; // Variable for storing the image.
color col; // Variable for RGB channels.

int stateColour = 1; // Variable for keeping track of wich state the current image is.

//----- PROGRAM -----

void setup () {

  myImage = loadImage("lion.jpg"); //Loading image to myImage variable.
  
  size(myImage.width, myImage.height); // Setting the window size to the size of the image.
  colorMode(RGB); // Setting colour mode to RGB.

  image (myImage, 0, 0); //Drawing the original image.
  
}

void draw () { // Put an empty draw so the program knows it isn't static.
}

void mouseClicked () {
  drawState(); // Calls function drawState.
}

void drawState() {

  if (stateColour == 0){
    state0(); // Calls the function for the RGB state. 
  }
  if (stateColour == 1){
    state1(); // Calls the function for the BRG state. 
  }
  if (stateColour == 2){
    state2(); // Calls the function for the GBR state. 
  }

  stateColour += 1; // Adds one to the state colour so the next time the image is drawn it changes the state.

  if (stateColour > 2){
    stateColour = 0; // Resets to state 0 if clicked after state 2.
  }
  
}



//RGB STATE
void state0( ) {
  myImage = loadImage("lion.jpg"); //Loads original image to myImage variable.  
  myImage.loadPixels(); // Load the data from the pixels of myImage and put into the pixels[] array.
  for (int i = 0; i <myImage.width*myImage.height; i++) { // Runs through every pixel of the image and changes the RGB values of it. 
    col = myImage.pixels[i]; // Get RGB values of the pixel.
    myImage.pixels[i] = color(red(col), green(col), blue(col)); // Putz RGB in RGB channels.
  }
  myImage.updatePixels(); // Updates the display window with the data from the pixels[] array.
  image (myImage, 0, 0); //Draws image.
}

//BRG STATE
void state1() {
  myImage = loadImage("lion.jpg"); //Loads original image to myImage variable. 
  myImage.loadPixels(); // Load the data from the pixels of myImage and put into the pixels[] array.
  for (int i = 0; i <myImage.width*myImage.height; i++) { // Runs through every pixel of the image and changes the RGB values of it. 
    col = myImage.pixels[i]; // Get RGB values of the pixel.
    myImage.pixels[i] = color(blue(col), red(col), green(col)); // Putz BRG in RGB channels.
  }
  myImage.updatePixels(); // Updates the display window with the data from the pixels[] array.
  image (myImage, 0, 0); //Draws image.
}

//GBR STATE
void state2 () {
  myImage = loadImage("lion.jpg"); //Loads original image to myImage variable.  
  myImage.loadPixels(); // Load the data from the pixels of myImage and put into the pixels[] array.
  for (int i = 0; i <myImage.width*myImage.height; i++) { // Runs through every pixel of the image and changes the RGB values of it. 
    col = myImage.pixels[i]; // Get RGB values of the pixel.
    myImage.pixels[i] = color(green(col), blue(col), red(col)); // Putz GBR in RGB channels.
  }
  myImage.updatePixels(); // Updates the display window with the data from the pixels[] array.
  image (myImage, 0, 0); //Draws image.
}
