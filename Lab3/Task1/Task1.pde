/*
Task 1: Circles
 */

float radio = 50;  // Circle radio

void setup() {
  size(500, 500);

  // translate the screen relative to the center
  translate(100, 100);

  // start drawing the shape
  beginShape();
  // each vertice of the shape
  for (int i = 0; i <= 360; i++) {
    vertex(X(i), Y(i));
  }
  endShape();

  //-------------------------------
  // Drawing spiral
  //-------------------------------
  noFill();
  // translate the screen relative to the center
  translate(200, 20);
  radio = 10;
  // start drawing the shape
  beginShape();
  // each vertice of the shape
  for (int i = 0; i <= 3*360; i++) {
    vertex(X(i), Y(i));
    radio+=.1;
  }
  endShape();


  //-------------------------------
  // Drawing wave
  //-------------------------------

  // translate the screen relative to the center
  translate(-250, 250);
  radio = 100;
  // start drawing the shape
  beginShape();
  // each vertice of the shape
  for (int i = 0; i <= 360; i++) {
    vertex(i, Y(i));
  }
  endShape();
}

float X(int ang) {
  return radio*cos(radians(ang));
}

float Y(int ang) {
  return radio*sin(radians(ang));
}

