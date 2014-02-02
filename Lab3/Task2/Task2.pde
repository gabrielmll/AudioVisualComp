/*
Task 2: Textured Circle
 */

float radio = 200;  // Circle radio

PImage img;  // variable for an image

void setup() {
  size(500, 500, P3D);

  img = loadImage("mario.jpg");  // loading an image to the image variable


    // translate the screen relative to the center
  translate(width/2, height/2);

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

// Cos function
float X(int ang) {
  return radio*cos(radians(ang));
}

// Sin function
float Y(int ang) {
  return radio*sin(radians(ang));
}

