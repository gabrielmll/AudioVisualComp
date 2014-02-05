Planet sun;
Planet earth;
Planet moon;
Planet mars;

void setup () {
  size (1000, 1000);
  background (0);

  sun = new Planet(70, 0, new PVector(width/2, height/2), null);
  earth = new Planet(30, 0.05, new PVector(50, 50), sun);
  moon = new Planet(5, 0.05, new PVector(20, 20), earth);
  mars = new Planet(10, 0.03, new PVector(70, 70), sun);
}

void draw() {

  background (0);

  sun.rotatePlanet();
  earth.rotatePlanet();
  moon.rotatePlanet();
  mars.rotatePlanet();


//ellipse(X(e), Y(e), 50, 50);
}



