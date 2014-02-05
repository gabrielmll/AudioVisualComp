class Planet {
  float radius;
  float angle = 0;
  float angleSpeed;
  PVector rotationAxis;
  PVector pos;

  PVector actualPos;

  Planet parent;

  Planet (float r, float a, PVector p, Planet par) {
    radius = r;
    angleSpeed = a;
    pos = p;
    //rotationAxis = rotAx;
    parent = par;
  }

  void drawPlanet () {
    ellipse (pos.x, pos.y, radius, radius);
  }

  void rotatePlanet () {
    pushMatrix();

    if (parent != null) {
      translate(parent.pos.x, parent.pos.y);
    }
    rotate (angle);
    angle += angleSpeed;
    drawPlanet();
    
    popMatrix();
  }
}

