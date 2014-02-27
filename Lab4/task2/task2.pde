Particle p[];

Center c[];

int spriteTimer = 0; // Variable for sprite changing timer

void setup() {
  size(600, 600);

  p = new Particle[10];

  c = new Center[2];

  for (int i = 0; i < p.length; i++) {
    p[i] = new Particle(new PVector(20*i, 20*i));
  }

  for (int i = 0; i < c.length; i++) {
    c[i] = new Center();
  }
}

void draw() {
  background(0);

  for (int i = 0; i < p.length; i++) {

    if (!p[i].repulsionParticle()) {
      p[i].attractParticle(c[0].location);
    }

    p[i].displayParticle();
  }

  for (int i = 0; i < c.length; i++) {
    c[i].moveCenter();
    c[i].drawCenter();
  }

  spriteTimer += 1; // Add 1 to spriteTimer each time the program runs.
  if (spriteTimer >= 15) {
    spriteTimer = 0; // Resets timer when sprite reaches maximum time.
  }
}

