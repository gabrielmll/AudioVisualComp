/* This program allows you to change RGB values of the loaded image by pressing a combination of keys:
R+M = more red;
R+L = less red;
G+M = more green;
G+L = less green;
B+M = more blue;
B+L = less blue.
You can also go back to the original image and start over by typing S.
This works with any image you load into the myImage variable.
*/

//----- Declaring global variables. -----

PImage myImage; // Variable for storing the image.
color col; // Variable for RGB channels.

int enR = 0; // Change value to set amount of enhancement.
int enG = 0; // Change value to set amount of enhancement.
int enB = 0; // Change value to set amount of enhancement.

boolean[] keyboard;

//----- PROGRAM -----

void setup () {

  keyboard = new boolean[255]; // Keyboard array.
  for (int i = 0; i < 255; i++) { // Initialize all keys as false.
    keyboard[i] = false;
  }

  myImage = loadImage("lion.jpg"); //Loading image to myImage variable.
  
  size(myImage.width, myImage.height+90); // Setting the window size.
  colorMode(RGB); // Setting colour mode to RGB.
  background(0);
  
}

void draw () {
  
  input(); // Checks for input and change enhancement values if asked.
  myImage.loadPixels(); // Load the data from the pixels of the myImage and put into the pixels[] array.

  for (int i = 0; i <myImage.width*myImage.height; i++) { // Runs through every pixel of the image and changes the RGB values of it. 
    col = myImage.pixels[i]; // Get RGB values of the pixel.
    myImage.pixels[i] = color(red(col)+enR, green(col)+enG, blue(col)+enB); // Changes RGB values according to input.
  }

  myImage.updatePixels(); // Updates the display window with the data from the pixels[] array.
  image (myImage, 0, 90); //Placing the image
  
  enR = 0; // Resets red addition to stop it if keys are not being pressed.
  enG = 0; // Resets green addition to stop it if keys are not being pressed.
  enB = 0; // Resets blue addition to stop it if keys are not being pressed.
  
  instructions(); // Draw text instructions.
}
