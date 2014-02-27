/* This code shows how to texture map a shape. */

//----- Declaring global variables. -----

PImage img;  // Variable for the image.

//----- PROGRAM -----

void setup() {
  //  1.
  //  Setting the size of the window in a 3D engine
  size(1024, 1024, P3D);

  img = loadImage("arara.jpg");  // Loading an image to the image variable.

  //  2.
  //  Adding textureMode(NORMAL).
  textureMode(NORMAL);


  beginShape();
  // 3.
  //  Adding the image as a texture of the shape.
  texture(img);
  // 4.
  //  Each vertice of the shape
  vertex(100, 100, 0, 0);
  vertex(100, 200, 0, 1);
  vertex(200, 300, 1, 1);
  vertex(200, 300, 1, 0);
  endShape(CLOSE);


  // 6. 7.
  // Changing texture and vertice coordinates 
  beginShape();
  texture(img);
  vertex(250, 100, 1, 1);
  vertex(250, 500, 1, 0);
  vertex(650, 500, 0, 0);
  vertex(650, 100, 0, 1);
  endShape(CLOSE);
  
}
