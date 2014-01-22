PImage img;

PVector v1, v2, v3, v4;
PVector position = new PVector(10, 10);
PVector nv1, nv2, nv3, nv4;
PVector move = new PVector(1, 1);

void setup() {
  size(1024, 1024, P3D);

  img = loadImage("arara.jpg");

  v1 = new PVector(100, 100);
  v2 = new PVector(100, 300);
  v3 = new PVector(300, 300);
  v4 = new PVector(300, 100);

  textureMode(NORMAL);
}

void draw() {


//  position = new PVector(mouseX - v1.x, mouseY - v1.y);
  
  position = PVector.add(position, move);

  nv1 = PVector.add(position, v1);
  nv2 = PVector.add(position, v2);
  nv3 = PVector.add(position, v3);
  nv4 = PVector.add(position, v4);

  beginShape(); 
  texture(img);
  vertex(nv1.x, nv1.y, 0, 0);
  vertex(nv2.x, nv2.y, 0, 1);
  vertex(nv3.x, nv3.y, 1, 1);
  vertex(nv4.x, nv4.y, 1, 0);
  endShape(CLOSE);

  move = new PVector(mouseX - nv1.x, mouseY - nv1.y);
  //position = PVector.add(position, new PVector(10, 1));
}

