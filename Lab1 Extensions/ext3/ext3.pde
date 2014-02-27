/* This code draws shapes with more than 4 vertices using and array to store the vertices points. */

//----- Declaring global variables. -----

PVector[] v = new PVector[6];  // shape vector variables stored in an array

PVector move = new PVector(300, 300);


//----- PROGRAM -----

void setup() {
  size(700, 700, P3D);  // window size in a 3D engine

  // initiate each vector with an value
  v[0] = new PVector(100, 50);
  v[1] = new PVector(250, 70);
  v[2] = new PVector(300, 150);
  v[3] = new PVector(250, 250);
  v[4] = new PVector(200, 270);
  v[5] = new PVector(50, 250);

  textureMode(NORMAL);

  beginShape();
  // declare the shape vertices using the vector
  vertex(v[0].x, v[0].y);
  vertex(v[1].x, v[1].y);
  vertex(v[2].x, v[2].y);
  vertex(v[3].x, v[3].y);
  vertex(v[4].x, v[4].y);
  vertex(v[5].x, v[5].y);

  endShape(CLOSE);


  //This for will move the vector by 300x300
  for (PVector i : v) {
    i.add(move);
  }

  // Redraw the shape with TRIANGLE option
  beginShape(TRIANGLE);
  // declare the shape vertices using the vector
  vertex(v[0].x, v[0].y);
  vertex(v[1].x, v[1].y);
  vertex(v[2].x, v[2].y);
  vertex(v[3].x, v[3].y);
  vertex(v[4].x, v[4].y);
  vertex(v[5].x, v[5].y);

  endShape();
}

// "infinite loop"
void draw() {
}
