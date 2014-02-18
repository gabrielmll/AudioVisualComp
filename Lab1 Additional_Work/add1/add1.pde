PVector[] v = new PVector[6];  // shape vector variables stored in an array

void setup() {
  size(800, 800, P3D);  // window size in a 3D engine

  int k = 0;
  for(int i = 0; i < 360; i+=60)
  {
    v[k].x = X(i);
    v[k].y = Y(i);
  }

  textureMode(NORMAL);
  
  beginShape(TRIANGLES);

  // declare the shape vertices using the vector
  endShape(CLOSE);
}

// "infinite loop"
void draw() {
}

float X(float angle)
{
  return sin(radians(angle));
}

float Y(float angle)
{
  return cos(radians(angle));
}
