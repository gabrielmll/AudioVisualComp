/* This code shows how to animate and move an image in the window using vectors. */

//----- Declaring global variables. -----

PImage img;  // Variable for the image.

PVector v1, v2, v3, v4;  // Shape vector variables
PVector position = new PVector(30, 35);  // Position of the image.
PVector nv1, nv2, nv3, nv4;  // New shape vector variables.

PVector move = new PVector(1, 1);  // Vector to move the image by being added to position.



//----- PROGRAM -----

void setup() {
  size(1024, 1024, P3D);  // Setting window size in a 3D engine.

  img = loadImage("arara.jpg");  // Loading an image to the image variable.

  // Initiate each vector with a value.
  v1 = new PVector(100, 100);
  v2 = new PVector(100, 300);
  v3 = new PVector(300, 300);
  v4 = new PVector(300, 100);

  textureMode(NORMAL); // Setting tecture mode to normal.
}

// "Infinite loop".
void draw() {
  
  // Create each nv as a sum of position and the respective previous vector.
  nv1 = PVector.add(position, v1);
  nv2 = PVector.add(position, v2);
  nv3 = PVector.add(position, v3);
  nv4 = PVector.add(position, v4);

  beginShape();
  texture(img);  // Use the image as texture of this shape.
  // Declare the shape vertices using the vector.
  vertex(nv1.x, nv1.y, 0, 0);
  vertex(nv2.x, nv2.y, 0, 1);
  vertex(nv3.x, nv3.y, 1, 1);
  vertex(nv4.x, nv4.y, 1, 0);
  endShape(CLOSE);
  
  // Move the image by adding "move" and "position".
  position = PVector.add(position, move);
}
