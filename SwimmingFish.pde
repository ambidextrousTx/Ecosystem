class SwimmingFish extends Mover {

  SwimmingFish(float _mass) {
    mass = _mass;
  }

  void checkEdges() {
    if (location.x >= width || location.x <= 0) {
        velocity.x *= -1;
    }

    if (location.y >= height || location.y <= height/ 2) {
      velocity.y *= -1;
    }
  
  }

  PVector repel(Mover m) {
    // Get the force's direction
    PVector force = PVector.sub(location, m.location);

    float distance = force.mag();
    constrain(distance, 5, 25);
    force.normalize();

    float strength = (G * mass * m.mass) / (distance * distance);
    force.mult(strength);
    force.mult(-1);

    return force;
  }

  void update() {
    // Acceleration direction - toward the mouse
    PVector mouseVector = new PVector(mouseX, mouseY);
    PVector directionalForce = PVector.sub(mouseVector, location);
    directionalForce.normalize();

    directionalForce.mult(0.25);

    acceleration = directionalForce;
    acceleration.div(mass);

    if (keyPressed) {
      // the fish is affected by random eddy currents in the water
      if (key == 's') {
        float forcex = map(noise(tx), 0, 1, -2.0, 2.0);
        float forcey = map(noise(ty), 0, 1, -2.0, 2.0);

        PVector currentForce = new PVector(forcex, forcey);
        PVector currentForcePerUnitMass = PVector.div(currentForce, mass);
        acceleration.add(currentForcePerUnitMass);
      }
    }

    if (checkNegativeFrictionPocket()) {
      acceleration.add(new PVector(acceleration.x * 10, acceleration.y * 10));
    }

    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);

    // Need to clear this out every time before
    // update is called so that a fresh brand new
    // acceleration can be applied the next time
    // instead of cumulatively adding up
    acceleration.mult(0);

  }

  void display() {
    noStroke();
    fill(10, 30, 210, 200);
    ellipse(location.x, location.y, 25, 25);
  }

}
