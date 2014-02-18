/*
  Extension 6. 
 */

PVector v[] = new PVector[1600];  // shape vector variables
int quad = 35;  // size of each quadrant

int numOfQuads = 20; // Variable for resolution

float valueY[][] = new float[numOfQuads+1][numOfQuads+1];  // matrix for vertice height

// translate variables
int transX = 150;
int transY = 450;
int transZ = -550;

int mouseRange = 5;  // acceptable distance for "mouse over vertice"
float screen2DX = 0;
float screen2DY = 0;

void setup() {
  size(1000, 600, P3D);  // window size in a 3D engine

  initHeightY();  // sets all values of matrix "valueY" to 0
}

void draw() {
  background(255);
  translate(transX, transY, transZ);  // moving the 
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

  selectVertice();
}

void selectVertice() {

  for (int k = 0; k < numOfQuads*numOfQuads*4; k++) {

    screen2DX = screenX(v[k].x, v[k].y, v[k].z);
    screen2DY = screenY(v[k].x, v[k].y, v[k].z);

    if ((mouseX > screen2DX - mouseRange) &&
      (mouseX < screen2DX + mouseRange) &&
      (mouseY > screen2DY - mouseRange) &&
      (mouseY < screen2DY + mouseRange)) 
    {
      fill(0);
      pushMatrix();
      translate(v[k].x, v[k].y, v[k].z);
      ellipse(0, 0, 5, 5);
      noFill();
      popMatrix();
      if (mousePressed) {

        valueY[18][18] = mouseY + transZ;
      }
    }
  }
}

float heightY(int x, int z) // x & z works as an index
{
  // return 50*sin(radians(ang));
  //return noise(x, z)*15;
  return valueY[x][z];
}

// sets the whole matrix "valueY" to 0
void initHeightY() {
  for (int i = 0; i <= numOfQuads; i++) {
    for (int j = 0; j <= numOfQuads; j++) {
      valueY[i][j] = 0;
    }
  }
}

