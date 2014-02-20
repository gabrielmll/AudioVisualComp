//----- Declaring global variables. -----

PImage myImage; // Variable for storing the image.
color col; // Variable for RGB channels.

int enR = 80; // Change value to set amount of enhancement.
int enG = 0; // Change value to set amount of enhancement.
int enB = 60; // Change value to set amount of enhancement.

//----- PROGRAM -----

void setup () {

  myImage = loadImage("lion.jpg"); //Loading image to myImage variable.
  size(700, 700); // Setting the window size.
  colorMode(RGB); // Setting colour mode to RGB.
  myImage.loadPixels(); // Load the data from the pixels of the myImage and put into the pixels[] array.

  for (int i = 0; i <myImage.width*myImage.height; i++) { // Runs through every pixel of the image and changes the RGB values of it. 
    col = myImage.pixels[i]; // Get RGB values of the pixel.
    myImage.pixels[i] = color(red(col)+enR, green(col)+enG, blue(col)+enB); // Changes RGB values.
  }

  myImage.updatePixels(); // Updates the display window with the data from the pixels[] array.
  image (myImage, 0, 0); //Placing the image
}

