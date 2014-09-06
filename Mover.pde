class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float tx, ty;
  float topSpeed;
  float mass;

  Mover() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    topSpeed = 4.0;
    tx = 0.0;
    ty = 10000.0;
    mass = 1.0;
  }

  void update() {
  }

  void display() {
  }

  boolean checkNegativeFrictionPocket() {
    if ((location.x >= 320 && location.x <= 340) &&
      (location.y >= 20 && location.y <= 280)) {
        return true;
    } else {
        return false;
    }
  }

  void applyForce(PVector force) {
    // No more wrapping around the edges
    // There are force fields at all edges now
    
    acceleration.x = force.x / mass;
    acceleration.y = force.y / mass;

  }

  void checkEdges() {
    float rightDistance = abs(location.x - width);
    float leftDistance = abs(location.x - 0);
    float topDistance = abs(location.y - height);
    float bottomDistance = abs(location.y - 0);

    if (rightDistance <= 40) {
      applyForce(new PVector(-rightDistance, rightDistance));

    } else if (leftDistance <= 40) {
      applyForce(new PVector(leftDistance, leftDistance));
    }

    if (bottomDistance <= 40) {
      applyForce(new PVector(bottomDistance, -bottomDistance));

    } else if (topDistance <= 40) {
      applyForce(new PVector(topDistance, topDistance));
    }
  }

}
