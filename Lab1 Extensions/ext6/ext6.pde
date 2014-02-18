/*
  Extension 6. 
 */

PVector v[] = new PVector[1600];  // shape vector variables
int quad = 35;  // size of each quadrant

int numOfQuads = 20; // Variable for resolution


float bx;
float by;
int boxSize = 75;
boolean overBox = false;
boolean locked = false;
float xOffset = 0.0; 
float yOffset = 0.0; 

void setup() {
  size(1000, 600, P3D);  // window size in a 3D engine
}

void draw() {
  background(255);
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
  
  
  
    // Test if the cursor is over the box 
  if (mouseX > bx-boxSize && mouseX < bx+boxSize && 
      mouseY > by-boxSize && mouseY < by+boxSize) {
    overBox = true;  
    if(!locked) { 
      stroke(255); 
      fill(153);
    } 
  } else {
    stroke(153);
    fill(153);
    overBox = false;
  }
  
  // Draw the box
  rect(bx, by, boxSize, boxSize);
}

float heightY(float y1, float y2)
{
  // return 50*sin(radians(ang));
  return noise(y1, y2)*15;
}


void mousePressed() {
  if (overBox) { 
    locked = true; 
    fill(255, 255, 255);
  } 
  else {
    locked = false;
  }
  xOffset = mouseX-bx; 
  yOffset = mouseY-by;
}

void mouseDragged() {
  if (locked) {
    bx = mouseX-xOffset; 
    by = mouseY-yOffset;
  }
}

void mouseReleased() {
  locked = false;
}

