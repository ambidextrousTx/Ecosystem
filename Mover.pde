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

  void applyForce(PVector force) {
    // No more wrapping around the edges
    // There are force fields at all edges now
    
    float mass = 1.0;
    acceleration.x = force.x / mass;
    acceleration.y = force.y / mass;

  }

  void checkEdges() {

    if (location.x > width) {
      location.x -= 1;
      applyForce(new PVector(-5.0, 5.0));

    } else if (location.x < 0) {
      location.x += 1;
      applyForce(new PVector(5.0, 5.0));
    }

    if (location.y > height) {
      location.y -= 1;
      applyForce(new PVector(-5.0, 5.0));

    } else if (location.y < 0) {
      location.y += 1;
      applyForce(new PVector(5.0, 5.0));
    }

  }

}
