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

  void drawPlanet () {
    ellipse (pos.x, pos.y, radius, radius);
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
}

