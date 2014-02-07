float speed = 5;

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


  sun = new Planet(50, 0, new PVector(width/2, height/2), null);
  
  mercury = new Planet(5, 0.009*speed, new PVector(50, 50), sun);
  venus = new Planet(10, 0.007*speed, new PVector(70, 70), sun);
  earth = new Planet(10, 0.006*speed, new PVector(95, 95), sun);
  mars = new Planet(7.5, 0.005*speed, new PVector(130, 130), sun);
  jupter = new Planet(20, 0.003*speed, new PVector(170, 170), sun);
  
  moon = new Planet(2.5, 0.009*speed, new PVector(15, 15), earth);
  phobos = new Planet(2.5, 0.01*speed, new PVector(10, 10), mars);
  deimos = new Planet(2.5, 0.006*speed, new PVector(15, 15), mars);
  europa = new Planet(3, 0.003*speed, new PVector(20, 20), jupter);


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

  sun.rotatePlanet();
}

