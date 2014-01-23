//----- Declaring global variables. -----

PVector position; //Variable for the position of the drawn images.
PVector velocity; //Variable for adding to the position and moving the new images.
PVector scaling; //Variable for the scaling factor of the new images.
PVector scalingSpeed; //Variable for adding to the scaling factor and make the new images increase size each run.

PImage myImage; //Variable for storing the image.

//----- PROGRAM -----

void setup () {
  
  position = new PVector(-1,-2); //Initializing position vector.
  velocity = new PVector(1,2); //Initializing velocity vector.
  scaling = new PVector(0.1,0.1); //Initializing scaling vector.
  scalingSpeed = new PVector(0.01,0.01); //Initializing scalingSpeed vector.
  
  myImage = loadImage("lion.jpg"); //Loading image to myImage variable.
  
  size(700,700); //Setting the window size.
  
}

void draw () {
  
  position.add(velocity); //Adding velocity vector to the position vector to make each new image to be in a new position.
  translate(position.x, position.y); //Translating the image position each time the program runs.
  scaling.add(scalingSpeed); //Adding scalingSpeed to the scaling vector to make new images increase size each run.
  scale(scaling.x, scaling.y); //Scaling the image each time the program runs.
  image (myImage, 0, 0); //Placing the image.
  myImage.filter(BLUR,1); //Applying a blur filter to myImage each time the program runs.

}
