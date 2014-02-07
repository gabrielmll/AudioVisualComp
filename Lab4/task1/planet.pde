class Planet {
  float radius;
  float angle = 0;
  float angleSpeed;
  PVector pos;

  Planet parent;

  ArrayList<Planet> sons = new ArrayList<Planet>();

  Planet (float r, float a, PVector p, Planet par) {
    radius = r;
    angleSpeed = a;
    pos = p;
    //rotationAxis = rotAx;
    parent = par;
  }

  void rotatePlanet() {  
    pushMatrix();

    if (parent != null) {
      translate(parent.pos.x, parent.pos.y);
    }

    rotate (angle);
    angle += angleSpeed;
    drawPlanet();

    for (int i = 0; i < sons.size(); i++) {
      sons.get(i).rotatePlanet();
    }

    popMatrix();
  }

  void giveBirth(Planet son) {
    sons.add(son);
  }

  /* Drawing */

  void drawPlanet () {
    // start drawing the shape
    
    textureMode(NORMAL);
    beginShape();
    //texture(img);
    // each vertice of the shape
    for (int i = 0; i <= 360; i++) {
      // mapping the image for each point of the circle
      float u = map(X(i), (radius*(-1)), radius*1, 1, 0);
      float v = map(Y(i), (radius*(-1)), radius*1, 0, 1);

      // set each vertice
      vertex(pos.x + X(i), pos.y + Y(i), u, v);
    }
    endShape();
  }

  // Cos function to draw a circle
  float X(int ang) {
    return radius*cos(radians(ang));
  }

  // Sin function to draw a circle
  float Y(int ang) {
    return radius*sin(radians(ang));
  }
}

