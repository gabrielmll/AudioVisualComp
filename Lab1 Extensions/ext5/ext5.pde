/*
  Extension 5.
 Creating 3D landscapes using a grid of vertices by drawing quads in an array. 
*/

//----- Declaring global variables. -----

PVector v[] = new PVector[1600];  // Shape vector variables.
int quad = 35;  // Size of each quadrant.

int numOfQuads = 20; // Variable for resolution.



//----- PROGRAM -----

void setup() {
  size(1000, 600, P3D);  // window size in a 3D engine

  translate(150, 450, -550);  // moving the 
  //translate(width/2, 350, 0);


  // initiate each quadrant vector with a value
  /*
  Scheme quad vector:
   1-----2
   |     |
   |     |
   4-----3
   */

  int i = 0; // vertice index
  int Y = 0;
  // loop for x coordinate
  for (int z = 0; z < numOfQuads; z++) {
    // loop for z coordinate
    for (int x = 0; x < numOfQuads; x++) {
      // quad vector 1
      v[i] = new PVector(x*quad, heightY(x*quad, z*quad), z*quad);
      // quad vector 2
      v[i+1] = new PVector((x+1)*quad, heightY((x+1)*quad, z*quad), z*quad);
      // quad vector 3
      v[i+2] = new PVector((x+1)*quad, heightY((x+1)*quad, (z+1)*quad), (z+1)*quad);
      // quad vector 4
      v[i+3] = new PVector(x*quad, heightY(x*quad, (z+1)*quad), (z+1)*quad);

      i+=4;

      Y+=100;
      if (Y >= 2000)
        Y = 0;
    }
  }

  // create a shape
  noFill();
  beginShape(QUAD);

  // declare the shape vertices using the vectors
  for (int k = 0; k < numOfQuads*numOfQuads*4; k++) {
    vertex(v[k].x, v[k].y, v[k].z);
  }

  endShape();
}

float heightY(float y1, float y2)
{
  println(noise(y1, y2)*100);
 // return 50*sin(radians(ang));
  return noise(y1, y2)*20;
}
