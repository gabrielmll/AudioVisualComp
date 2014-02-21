/*
  Extension 6. 
 */

PVector v[] = new PVector[1600];  // shape vector variables
int quad = 35;  // size of each quadrant

int numOfQuads = 2; // Variable for resolution

float valueY[][] = new float[numOfQuads+1][numOfQuads+1];  // matrix for vertice height

// translate variables
/*int transX = 150;
 int transY = 450;
 int transZ = -550;
 */
int transX = 150;
int transY = 450;
int transZ = -50;

int mouseRange = 5;  // acceptable distance for "mouse over vertice"
float screen2DX = 0;  // Interpretate 2D X-click on 3D enviornment
float screen2DY = 0; // Interpretate 2D Y-click on 3D enviornment
boolean mouseClick = false; // If mouse is clicked, than true
int[] selectedVertice = new int[2]; // Which vertice is selected?

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

  if (!mouseClick)
    selectVertice();

  changeHeight();
}

// Mouse is changing the vertice height
void changeHeight() {
  if (mouseClick == true) {
    valueY[selectedVertice[0]][selectedVertice[1]] = mouseY + transZ;
    //valueY[2][1] = mouseY + transZ;
  }
}

// Use the mouse to select a vertice
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
        mouseClick = true;
        translateVertice(k); // who is 'k' vertice in the matrix?
      }
    }
  }
}

// Interpretate Selected Vertice.
// The height is stored in a matrix[x][z], while the PVectors are stored linearly.
// This function will convert the linear to the matrix for changin y-height
void translateVertice(int k) {
  int vertRow = k/(4*numOfQuads); // Which row are we talking about?
  int vertCol = (k/4) % numOfQuads;  // Which column are we talking about?
  int vertPos = k % 4; // TOP or BOTTOM || LEFT or RIGHT
  // based on position and row, point the 1st matrix value
  if (vertPos == 0 || vertPos == 1) {
    selectedVertice[0] = vertRow;
  }
  else {
    selectedVertice[0] = vertRow + 1;
  }
  // based on position and column, point the 2nd matrix value
  if (vertPos == 0 || vertPos == 3) {
    selectedVertice[1] = vertCol;
  }
  else {
    selectedVertice[1] = vertCol + 1;
  }
}

// Read the vertice height from the stored height matrix
float heightY(int x, int z) // x & z works as an index
{
  // return 50*sin(radians(ang));
  //return noise(x, z)*15;
  return valueY[z][x];
}

// sets the whole matrix "valueY" to 0
void initHeightY() {
  for (int i = 0; i <= numOfQuads; i++) {
    for (int j = 0; j <= numOfQuads; j++) {
      valueY[i][j] = 0;
    }
  }
}

void mouseReleased() {
  mouseClick = false;
}

