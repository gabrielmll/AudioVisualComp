/*This code shows how to use vector to place vertices when drawing a shape. */

//----- Declaring global variables. -----

PImage img;  // Variable for the image.

PVector v1, v2, v3, v4;  // Shape vector variables.
PVector position; // Variable for the position.
PVector nv1, nv2, nv3, nv4; // New shape vector variables.



//----- PROGRAM -----

void setup() {
  
  size(1024, 1024, P3D);  // Setting window size in a 3D engine.

  img = loadImage("arara.jpg");  // Loading an image to the img variable.

  // Initiate each vector with a value.
  v1 = new PVector(100, 100);
  v2 = new PVector(100, 300);
  v3 = new PVector(300, 300);
  v4 = new PVector(300, 100);


  textureMode(NORMAL); // Setting tecture mode to normal.

  // Create a shape.
  beginShape();
  texture(img);  // Use the image as texture of this shape.
  // Declare the shape vertices using the vector.
  vertex(v1.x, v1.y, 0, 0);
  vertex(v2.x, v2.y, 0, 1);
  vertex(v3.x, v3.y, 1, 1);
  vertex(v4.x, v4.y, 1, 0);
  endShape(CLOSE);



  // Create a new shape added with position.

  // Initiate position.
  position = new PVector(300, 350);

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
  
}
