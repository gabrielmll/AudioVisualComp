PImage img;  // variable for an image

void setup() {
  // 1.
  //  Setting the size of the window in a 3D engine
  size(1024, 1024, P3D);

  img = loadImage("arara.jpg");  // loading an image to the image variable

    // 2.
  //   Adding textureMode(NORMAL)
  textureMode(NORMAL);

  beginShape();
  texture(img);
  vertex(100, 100, 0, 0);
  vertex(100, 200, 0, 1);
  vertex(200, 300, 1, 1);
  vertex(200, 300, 1, 0);
  endShape(CLOSE);
}

