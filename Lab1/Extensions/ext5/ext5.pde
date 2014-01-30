/*
  Extension 5. 
 */

PVector v[] = new PVector[400];  // shape vector variables
int quad = 50;  // size of each quadrant

void setup() {
  size(1000, 600, P3D);  // window size in a 3D engine

  translate(250, 200, -150);  // moving the screen


  // initiate each quadrant vector with a value
  /*
  Scheme quad vector:
   1-----2
   |     |
   |     |
   4-----3
   */

  int i = 0; // vertice index
  int Y = 1;
  // loop for x coordinate
  for (int x = 0; x < 10; x++) {
    // loop for z coordinate
    for (int z = 0; z < 10; z++) {
      // quad vector 1
      v[i] = new PVector(x*quad, heightY(Y), z*quad);
      // quad vector 2
      v[i+1] = new PVector((x+1)*quad, heightY(Y), z*quad);
      // quad vector 3
      v[i+2] = new PVector((x+1)*quad, heightY(Y), (z+1)*quad);
      // quad vector 4
      v[i+3] = new PVector(x*quad, heightY(Y), (z+1)*quad);
      
      i+=4;
      Y=(Y % 10)+1;
    }
  }

  // create a shape
  noFill();
  beginShape(QUAD);

  // declare the shape vertices using the vectors
  for (int k = 0; k < 400; k++) {
    vertex(v[k].x, v[k].y, v[k].z);
  }

  endShape();
}

float heightY(int i)
{
  return noise(0.2)*height;
}

