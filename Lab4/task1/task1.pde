Planet sun;
Planet earth;
Planet moon;
Planet mars;

void setup () {
  size (1000, 700);


  sun = new Planet(70, 0, new PVector(width/2, height/2), null);
  earth = new Planet(35, 0.05, new PVector(100, 50), sun);
  moon = new Planet(10, 0.05, new PVector(50, 20), earth);
  mars = new Planet(10, 0.03, new PVector(70, 70), sun);


  sun.giveBirth(earth);
  sun.giveBirth(mars);
  
  earth.giveBirth(moon);
}

void draw() {

  background (0);

  sun.rotatePlanet();


  //ellipse(X(e), Y(e), 50, 50);
}

