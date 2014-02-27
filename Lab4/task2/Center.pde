class Center {
  PVector location;
  PVector velocity;
  float speed = 5.0f;
  PVector to;

  Center() {
    location = new PVector(0, 0);
    velocity = new PVector(0, 0);

    to = new PVector(random(0, width), random(0, height));
  }

  void moveCenter() {

    if (compare(to, location))
    {
      to.x = random(0, width);
      to.y = random(0, height);
    }

    PVector direction = PVector.sub(to, location);
    direction.normalize();
    direction.mult(speed);

    location.add(direction);
  }

  void drawCenter() {
    ellipse(location.x, location.y, 50, 50);
  }

  boolean compare(PVector to, PVector pos) {
    if(((int)pos.x <= (int)to.x + speed) && ((int)pos.x >= (int)to.x - speed) &&
    ((int)pos.y <= (int)to.y + speed) && ((int)pos.y >= (int)to.y - speed))
    {
      return true;
    }
    else
      return false;
  }
}

