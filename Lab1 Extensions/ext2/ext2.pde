//----- Declaring global variables. -----

PImage img;  // Variable for the image.

PVector v1, v2, v3, v4;  // Shape vector variables.
PVector position = new PVector(3, 3);  // Position of the image.
PVector nv1, nv2, nv3, nv4;  // New shape vector variables.

PVector move;  // vVctor to move the image by being added to position.
/* This code shows how to make an image or shape to move torwards the mouse position. */


//----- PROGRAM -----

void setup() {
  size(1024, 1024, P3D);  // Setting window size in a 3D engine.

  img = loadImage("arara.jpg");  // Loading an image to the image variable.

  // Initiate each vector with a value.
  v1 = new PVector(0, 0);
  v2 = new PVector(0, 200);
  v3 = new PVector(200, 200);
  v4 = new PVector(200, 0);

  textureMode(NORMAL); // Setting texture mode to normal.
  
}

// "Infinite loop"
void draw() {
  
  float speed = 3;  // Movement speed.
  move = new PVector(mouseX - position.x, mouseY - position.y);
  move.normalize();  // Normilize to get the direction.
  move.mult(speed);  // Multiply speed to get a velocity.
  
  // Create each nv as a sum of position and the image vectors.
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
  position.add(move);
}
