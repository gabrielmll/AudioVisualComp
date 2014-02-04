/*
Task 3: Animating the Circle
 */

float radio = 50;  // Circle radio
int amp = 200;     // amplitude to bounce
float freq = 0.002;    // frequency to bounce

PImage img;  // variable for an image

void setup() {
  size(500, 500, P3D);

  img = loadImage("Ball.png");  // loading an image to the image variable
}

void draw() {
  background(255);
  
  // translate to give each frame position
  translate(width/2, height/2 + F(millis()));

  // start drawing the shape
  textureMode(NORMAL);
  beginShape();
  texture(img);
  // each vertice of the shape
  for (int i = 0; i <= 360; i++) {
    // mapping the image for each point of the circle
    float u = map(X(i), (radio*(-1)), radio*1, 1, 0);
    float v = map(Y(i), (radio*(-1)), radio*1, 0, 1);

    // set each vertice
    vertex(X(i), Y(i), u, v);
  }
  endShape();
}

// Cos function to draw a circle
float X(int ang) {
  return radio*cos(radians(ang));
}

// Sin function to draw a circle
float Y(int ang) {
  return radio*sin(radians(ang));
}

// Sin function for bounce position
float F(int time) {
  return amp * sin(freq*time);
}

