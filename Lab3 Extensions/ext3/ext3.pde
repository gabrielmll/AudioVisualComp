/*
  Lab 3 Extension 3
 */

PImage sprite1;  // variable for bird sprite 1
PImage sprite2;  // variable for bird sprite 2
PImage bg; // variable for background image

PVector v1, v2, v3, v4;  // shape vector variables

PVector location = new PVector(0, 0);
PVector velocity = new PVector(0, 0);
PVector acceleration = new PVector(-0.001, 0.01);
float topSpeed = 5;
float angle = 0;

int spriteTimer = 0; // Variable for sprite changing timer

void setup() {
  size(1024, 1024, P3D);  // window size in a 3D engine

  sprite1 = loadImage("sprite1.png");  // loading the bird image to the variable
  sprite2 = loadImage("sprite2.png");  // loading the bird image to the variable
  bg = loadImage("bg.jpg");  // loading the backgroung image to the variable

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
  image(bg, 0, 0);

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

  if (spriteTimer < 10) {
    texture(sprite1);  // use sprite1 as texture of this shape
  }
  if (spriteTimer >=10) {
    texture(sprite2);  // use sprite2 as texture of this shape
  }

  // declare the shape vertices using the vector
  vertex(v1.x, v1.y, 0, 0);
  vertex(v2.x, v2.y, 0, 1);
  vertex(v3.x, v3.y, 1, 1);
  vertex(v4.x, v4.y, 1, 0);
  endShape(CLOSE);
  popMatrix();

  spriteTimer += 1; // Add 1 to spriteTimer each time the program runs.
  if (spriteTimer >= 15) {
    spriteTimer = 0; // Resets timer when sprite reaches maximum time.
  }
}
