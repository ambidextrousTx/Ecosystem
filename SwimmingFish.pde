class SwimmingFish extends Mover {
  float mass = 1.0;

  void update() {
    // Acceleration direction - toward the mouse
    PVector mouseVector = new PVector(mouseX, mouseY);
    PVector direction = PVector.sub(mouseVector, location);
    direction.normalize();

    direction.mult(0.25);

    acceleration = direction;

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

    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);

  }

  void display() {
    noStroke();
    fill(10, 30, 210, 200);
    ellipse(location.x, location.y, 25, 25);
  }

}
