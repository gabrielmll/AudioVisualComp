PImage img;  // variable for an image

PVector[] v = new PVector[6];  // shape vector variables stored in an array

void setup() {
  size(800, 800, P3D);  // window size in a 3D engine

  img = loadImage("arara.jpg");  // loading an image to the image variable

    // initiate each vector with an value
  v[0] = new PVector(0, 0);
  v[1] = new PVector(0, 200);
  v[2] = new PVector(200, 200);
  v[3] = new PVector(200, 0);

  textureMode(NORMAL);
  
  beginShape(TRIANGLES);
  texture(img);  // use the image as texture of this shape
  // declare the shape vertices using the vector
  vertex(v[0].x, v[0].y, 0, 0);
  vertex(v[1].x, v[1].y, 0, 1);
  vertex(v[2].x, v[2].y, 1, 1);
  vertex(v[3].x, v[3].y, 1, 0);
  endShape(CLOSE);
}

// "infinite loop"
void draw() {
}

