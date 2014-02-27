/*
  LAB 3
 Extension 2.
 Creating 3D landscapes using a grid of vertices by drawing quads in an array.
 Drawing waves as height 
 */

//----- Declaring global variables. -----

PVector v[] = new PVector[1600];  // Shape vector variables.
int quad = 35;  // Size of each quadrant.

int numOfQuads = 20; // Variable for resolution.

float valueY[][] = new float[numOfQuads+1][numOfQuads+1];  // matrix for vertice height

// translate screen variables
int transX = 150;
int transY = 450;
int transZ = -550;


//----- PROGRAM -----

void setup() {
  size(1000, 600, P3D);  // window size in a 3D engine

  initHeightY();  // sets all values of matrix "valueY" to 0
}

void draw() {
  background(255);
  translate(transX, transY, transZ);
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
      v[i] = new PVector(x*quad, heightY(x, z), z*quad);
      // quad vector 2
      v[i+1] = new PVector((x+1)*quad, heightY((x+1), z), z*quad);
      // quad vector 3
      v[i+2] = new PVector((x+1)*quad, heightY((x+1), (z+1)), (z+1)*quad);
      // quad vector 4
      v[i+3] = new PVector(x*quad, heightY(x, (z+1)), (z+1)*quad);

      i+=4;
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

// sets the whole matrix "valueY" to 0
void initHeightY() {
  for (int i = 0; i <= numOfQuads; i++) {
    for (int j = 0; j <= numOfQuads; j++) {
      valueY[i][j] = 10 * sin(j+i);
    }
  }
}

// Read the vertice height from the stored height matrix
float heightY(int x, int z) // x & z works as an index
{
  // return 50*sin(radians(ang));
  //return noise(x, z)*15;
  return valueY[z][x];
}

