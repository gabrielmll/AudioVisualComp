PImage img;  // variable for an image

PVector v1, v2, v3, v4;  // shape vector variables
PVector position = new PVector(3, 3);  // position of the image
PVector nv1, nv2, nv3, nv4;  // "new" shape vector variables

PVector move;  // vector to move the image by being added to position

void setup() {
  size(1024, 1024, P3D);  // window size in a 3D engine

  img = loadImage("bird.png");  // loading an image to the image variable

    // initiate each vector with an value
  v1 = new PVector(0, 0);
  v2 = new PVector(0, 200);
  v3 = new PVector(200, 200);
  v4 = new PVector(200, 0);

  textureMode(NORMAL);
}

// "infinite loop"
void draw() {
  background(255);
  
  float speed = 1;  // movement speed
  move = new PVector(mouseX - position.x, mouseY - position.y);
  move.normalize();  // normilize to get the direction
  move.mult(speed);  // multiply speed to get a velocity

 
  // create each nv as a sum of position and the image vectors
  nv1 = PVector.add(position, v1);
  nv2 = PVector.add(position, v2);
  nv3 = PVector.add(position, v3);
  nv4 = PVector.add(position, v4);
  
  float angle = nv1.heading();

/*  beginShape();
  texture(img);  // use the image as texture of this shape
  // declare the shape vertices using the vector
  vertex(nv1.x, nv1.y, 0, 0);
  vertex(nv2.x, nv2.y, 0, 1);
  vertex(nv3.x, nv3.y, 1, 1);
  vertex(nv4.x, nv4.y, 1, 0);
  endShape(CLOSE);
*/

pushMatrix();
  translate(nv1.x, nv1.y);
  rotate(angle);
  beginShape();
  texture(img);  // use the image as texture of this shape
  // declare the shape vertices using the vector
  vertex(v1.x, v1.y, 0, 0);
  vertex(v2.x, v2.y, 0, 1);
  vertex(v3.x, v3.y, 1, 1);
  vertex(v4.x, v4.y, 1, 0);
  endShape(CLOSE);
popMatrix();

  
  // move the image by adding "move" and "position"
  position.add(move);
}

