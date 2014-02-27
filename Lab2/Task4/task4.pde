/* This program draws an image with a tint on it that simulates a sepia effect. */

//----- Declaring global variables. -----

PImage myImage; //Variable for storing the image.

//----- PROGRAM -----

void setup () {
  
  myImage = loadImage("lion.jpg"); //Loading image to myImage variable.
  
  size(700,700); //Setting the window size.
  
}

void draw () {
  
  background(255); //Setting background colour to white.
  myImage.filter(GRAY); //Applying the grayscale filter.
  tint(120,80,30,230); //Applying a tint filter with RGB value to get a sepia tone effect, and reducing the opacity a little so the image doesn't get too dark due to the filter.
  image (myImage, 0, 0); //Placing the image.

}
