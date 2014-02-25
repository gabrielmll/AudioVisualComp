/*
  Lab 3 Extension 3
*/

PImage img;  // variable for an image

PVector v1, v2, v3, v4;  // shape vector variables

PVector location = new PVector(0, 0);
PVector velocity = new PVector(0, 0);
PVector acceleration = new PVector(-0.001, 0.01);
float topSpeed = 5;
float angle = 0;

void setup() {
  size(1024, 1024, P3D);  // window size in a 3D engine

  img = loadImage("bird.png");  // loading an image to the image variable

    // initiate each vector with an value
  v1 = new PVector(-100, -100);
  v2 = new PVector(-100, 100);
  v3 = new PVector(100, 100);
  v4 = new PVector(100, -100);

  textureMode(NORMAL);
}

// "infinite loop"
void draw() {
  background(255);

  updateValues();
  drawImg();
}

// calculating all "new" values for moving
void updateValues() {
  // Capture mouse position
  PVector mouse = new PVector(mouseX, mouseY);
  
  PVector direction = PVector.sub(mouse, location);   // Vector from location to mouse
  direction.normalize(); // Direction now is only "pointing". Direction itself without length
  direction.mult(2); // Scaling 
  
  /* uncomment to play with acceleration */
  //acceleration = direction; // Accelerate
  
  //velocity.add(acceleration);
  //velocity.add(direction);
  //velocity.limit(topSpeed);
  //location.add(velocity);
  
  location.add(direction);
  
  angle = direction.heading();
}

// draw the image on screen
void drawImg() {
  noStroke();
  pushMatrix();
  translate(location.x, location.y);
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
}

