PImage img;  // variable for an image

PVector v1, v2, v3, v4;  // shape vector variables
PVector position = new PVector(30, 35);  // position of the image
PVector nv1, nv2, nv3, nv4;  // "new" shape vector variables

PVector move = new PVector(1, 1);  // vector to move the image by being added to position

void setup() {
  size(1024, 1024, P3D);  // window size in a 3D engine

  img = loadImage("arara.jpg");  // loading an image to the image variable

    // initiate each vector with an value
  v1 = new PVector(100, 100);
  v2 = new PVector(100, 300);
  v3 = new PVector(300, 300);
  v4 = new PVector(300, 100);

  textureMode(NORMAL);
}

// "infinite loop"
void draw() {
  
  // create each nv as a sum of position and the respective previous vector
  nv1 = PVector.add(position, v1);
  nv2 = PVector.add(position, v2);
  nv3 = PVector.add(position, v3);
  nv4 = PVector.add(position, v4);

  beginShape();
  texture(img);  // use the image as texture of this shape
  // declare the shape vertices using the vector
  vertex(nv1.x, nv1.y, 0, 0);
  vertex(nv2.x, nv2.y, 0, 1);
  vertex(nv3.x, nv3.y, 1, 1);
  vertex(nv4.x, nv4.y, 1, 0);
  endShape(CLOSE);
  
  // move the image by adding "move" and "position"
  position = PVector.add(position, move);
}

