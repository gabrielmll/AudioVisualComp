//----- Declaring global variables. -----

PImage myImage; //Variable for storing the image.
float alpha; // Variable for the sepia filter opacity.

//----- PROGRAM -----

void setup () {
  
  myImage = loadImage("lion.jpg"); //Loading image to myImage variable.
  alpha = 0; // Initialize the filter with no opaciy.
  
  size(700,700); //Setting the window size.
  background(255); //Setting background colour to white.
  image (myImage, 0, 0); //Placing the image.
  
}

void draw () {
  
  myImage.filter(GRAY); //Applying the grayscale filter.
  tint(120,80,30,alpha); //Applying a tint filter with RGB value to get a sepia tone effect.
  image (myImage, 0, 0); //Placing the image.
  
  if (alpha <= 255) // If the opacity value for the filter is less then 255,
    alpha += 0.05;  // increase it by 0.05.

}
