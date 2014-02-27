class Particle {
  PVector center;
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topSpeed = 5;

  float angle = 0;

  PImage img; 
  PImage sprite1;  // variable for bird sprite 1
  PImage sprite2;  // variable for bird sprite 2

    float threshold = 20;

  Particle(PVector pos) {
    location = new PVector(pos.x, pos.y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0.0001, 0.001);
    topSpeed = 5;

    img = loadImage("bird.png");
    sprite1 = loadImage("sprite1.png");  // loading the bird image to the variable
    sprite2 = loadImage("sprite2.png");  // loading the bird image to the variable
    img.resize(50, 50);
    sprite1.resize(50, 50);
    sprite2.resize(50, 50);
  }

  void attractParticle(PVector cen) {
    center = cen;

    PVector dir = PVector.sub(center, location);

    dir.normalize();
    dir.mult(0.1f);

    acceleration = dir;

    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);

    angle = velocity.heading();
  }

  boolean repulsionParticle() {
    PVector velChange = null;
    float currentMin = threshold;

    for (int i = 0; i < p.length; i++) {
      if (p[i] == this)
        continue;

      if (location.dist(p[i].location) < currentMin) {
        currentMin = location.dist(p[i].location);
        velChange = PVector.sub(p[i].location, location);
        velChange.normalize();
        velChange.mult(-3.1f);

        acceleration = velChange;

        angle = velChange.heading();
      }
    }

    if (velChange != null)
    {
      velocity.add(acceleration);
      velocity.add(acceleration);
      velocity.limit(topSpeed);
      location.add(velocity);
      return true;
    }
    else
    {
      return false;
    }
  }

  void displayParticle() {
    /*
    pushMatrix();
     translate(location.x, location.y);
     ellipse(0, 0, 10, 10);
     popMatrix();
     */
    //ellipse(location.x, location.y, 10, 10);
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);

    if (spriteTimer < 10) {
      image(sprite1, 0, 0);  // use sprite1 as texture of this shape
    }
    if (spriteTimer >=10) {
      image(sprite2, 0, 0); // use sprite2 as texture of this shape
    }
    popMatrix();
  }
}

