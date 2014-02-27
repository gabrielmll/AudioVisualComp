/* This program draws an image and 
blurs it the more you move your mouse to the right or 
deblurs it the more you move your mouse to the left.
This works with any image you load to the variable myImage.*/

//----- Declaring global variables. -----

PImage myImage; // Variable for storing the image.

//----- PROGRAM -----

void setup () {

  myImage = loadImage("lion.jpg"); //Loading image to myImage variable.
  size(myImage.width, myImage.height); // Setting the window size.
}

void draw() {
  image (myImage, 0, 0); //Draws Image.
  filter(BLUR, 0.005*mouseX); // Applies a blur filter of 0.005 times the X position of the mouse.
}
