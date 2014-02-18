/*
  Extension 6. 
 */

PVector v[] = new PVector[1600];  // shape vector variables
int quad = 35;  // size of each quadrant

int numOfQuads = 20; // Variable for resolution

// translate variables
int transX = 150;
int transY = 450;
int transZ = -550;

int mouseRange = 5;  // acceptable distance for "mouse over vertice"
float screen2DX = 0;
float screen2DY = 0;

void setup() {
  size(1000, 600, P3D);  // window size in a 3D engine
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
      v[i] = new PVector(x*quad, heightY(x*quad, z*quad), z*quad);
      // quad vector 2
      v[i+1] = new PVector((x+1)*quad, heightY((x+1)*quad, z*quad), z*quad);
      // quad vector 3
      v[i+2] = new PVector((x+1)*quad, heightY((x+1)*quad, (z+1)*quad), (z+1)*quad);
      // quad vector 4
      v[i+3] = new PVector(x*quad, heightY(x*quad, (z+1)*quad), (z+1)*quad);

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

  for (int k = 0; k < numOfQuads*numOfQuads*4; k++) {

    screen2DX = screenX(v[k].x, v[k].y, v[k].z);
    screen2DY = screenY(v[k].x, v[k].y, v[k].z);
    /*    
     if ((mouseX > v[k].x + transX - mouseRange) &&
     (mouseX < v[k].x + transX + mouseRange) &&
     (mouseY > v[k].y + transY - mouseRange) &&
     (mouseY < v[k].y + transY + mouseRange)) 
     */
    if ((mouseX > screen2DX - mouseRange) &&
      (mouseX < screen2DX + mouseRange) &&
      (mouseY > screen2DY - mouseRange) &&
      (mouseY < screen2DY + mouseRange)) 
    {
      fill(255, 0, 0);
      pushMatrix();
      translate(v[k].x, v[k].y, v[k].z);
      ellipse(0, 0, 10, 10);
      noFill();
      popMatrix();
    }
  }
}

float heightY(float y1, float y2)
{
  // return 50*sin(radians(ang));
  return noise(y1, y2)*15;
}

