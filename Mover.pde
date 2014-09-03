class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float tx, ty;
  float topSpeed;

  Mover() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    topSpeed = 4.0;
    tx = 0.0;
    ty = 10000.0;
  }

  void update() {
  }

  void display() {
  }

  void checkEdges() {
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }

  }

}
