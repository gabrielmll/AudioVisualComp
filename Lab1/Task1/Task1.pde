/* This code draws an image from the img variable on the window. */

//----- Declaring global variables. -----

PImage img;  // Variable for the image.

//----- PROGRAM -----

void setup() {
  
  img = loadImage("arara.jpg");  // Loading an image to the img variable.
  size(img.width, img.height); // Setting the window size to the size of the image.
  image(img, 0, 0);  // Adding the image setted in the "img" variable to the screen.

}
