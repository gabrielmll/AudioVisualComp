/*
  Extension 4.
 Turn your sketch into 3D. You are already using the OPENGL
 renderer (P3D incorporates this), so all you need to do is
 add a z coordinate. 
*/

//----- Declaring global variables. -----

PImage img;  // variable for an image

PVector v1, v2, v3, v4;  // shape vector variables
PVector position = new PVector(100, 150); // Shape position



//----- PROGRAM -----

void setup() {
  size(600, 600, P3D);  // window size in a 3D engine

  img = loadImage("arara.jpg");  // loading an image to the image variable
  textureMode(NORMAL);

  // initiate each vector with an value
  v1 = new PVector(0, 0, -300);
  v2 = new PVector(0, 200, -300);
  v3 = new PVector(200, 200, 300);
  v4 = new PVector(200, 0, 0);


  // create a shape
  beginShape();
  texture(img);  // use the image as texture of this shape
  // declare the shape vertices using the vector
  vertex(v1.x, v1.y, 0, 0);
  vertex(v2.x, v2.y, 0, 1);
  vertex(v3.x, v3.y, 1, 1);
  vertex(v4.x, v4.y, 1, 0);
  endShape(CLOSE);

  v1.add(position);
  v2.add(position);
  v3.add(position);
  v4.add(position);

  // create a shape
  beginShape();
  texture(img);  // use the image as texture of this shape
  // declare the shape vertices using the vector
  vertex(v1.x, v1.y, v1.z, 0, 0);
  vertex(v2.x, v2.y, v2.z, 0, 1);
  vertex(v3.x, v3.y, v3.z, 1, 1);
  vertex(v4.x, v4.y, v4.z, 1, 0);
  endShape(CLOSE);
}
