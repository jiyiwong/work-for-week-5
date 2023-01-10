class Particle {
  PVector pos;
  PVector vel;
  int maxR;
  int s;
  int life;
  color c;
  float noisePower = 0.01;

  Particle(int maxR_, int s_) {
    s = s_;
    maxR = maxR_;
    life = 100;
    init();
  }

  void init() {
    pos = PVector.random2D();
    pos.normalize();
    pos.mult(random(2, maxR));
    vel = new PVector();
  }

  void show() {
    fill(c);
    ellipse(pos.x, pos.y, s, s);
    life -= 1;
  }

  void move() {
    float angle = noise(pos.x * noisePower, pos.y * noisePower) * TAU;
    vel.set(cos(angle), sin(angle));
    vel.mult(0.3);
    pos.add(vel);
  }

  boolean isDead() {
    float d = dist(pos.x, pos.y, 0, 0);
    if (d > maxR || life < 1) return true;
    else return false;
  }
}
