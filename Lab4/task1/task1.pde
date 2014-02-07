float speed = 0.01;

Planet sun;

Planet mercury;
Planet venus;
Planet earth;
Planet mars;
Planet jupter;

Planet moon;
Planet phobos;
Planet deimos;
Planet europa;

void setup () {
  size (1000, 700, P3D);



  sun = new Planet(50, 0.001, new PVector(0, 0), null, "sun.jpg");

  mercury = new Planet(5, 4*speed, new PVector(50, 50), sun, "mercury.jpg");
  venus = new Planet(10, 1.2*speed, new PVector(70, 70), sun, "venus.jpg");
  earth = new Planet(10, 1*speed, new PVector(95, 95), sun, "earth.jpg");
  mars = new Planet(7.5, 0.5*speed, new PVector(130, 130), sun, "mars.jpg");
  jupter = new Planet(20, 0.09*speed, new PVector(170, 170), sun, "jupter.jpg");

  moon = new Planet(2.5, 4*speed, new PVector(15, 15), earth, "moon.jpg");
  phobos = new Planet(2.5, 2*speed, new PVector(10, 10), mars, "moon.jpg");
  deimos = new Planet(2.5, 4.3*speed, new PVector(15, 15), mars, "moon.jpg");
  europa = new Planet(3, 1*speed, new PVector(20, 20), jupter, "moon.jpg");


  sun.giveBirth(mercury);
  sun.giveBirth(venus);
  sun.giveBirth(earth);
  sun.giveBirth(mars);
  sun.giveBirth(jupter);

  earth.giveBirth(moon);

  mars.giveBirth(phobos);
  mars.giveBirth(deimos);

  jupter.giveBirth(europa);
}

void draw() {

  background (0);
  translate(width/2, height/2);
  //rotateX(PI/4.0);
  sun.rotatePlanet();
}

