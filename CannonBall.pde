class CannonBall extends Mover {

  CannonBall() {
    location = new PVector(0, height/ 4);
    // Cannon balls have an initial force (once) which 
    // gives them an initial acceleration
    acceleration = new PVector(150, 50);
    velocity.add(acceleration);
    location.add(velocity);
    topSpeed = 4.0;
    mass = 1.0;
    G = 0.04;
  }

  void display() {
    noStroke();
    fill(210, 30, 10, 180);
    ellipse(location.x, location.y, 20, 20);
  }

  PVector gravityFall() {
    // Get the force's direction
    PVector force = new PVector(0.0, 1.0);
    float distance = force.mag();
    force.normalize();

    // Assume the earth has a mass of 10.0 units
    float strength = (G * mass * 10.0) / (distance * distance);
    force.mult(strength);

    return force;
  }

  void update() {
  
    PVector gravity = gravityFall();

    acceleration = gravity;
    acceleration.div(mass);

    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);

    // Need to clear this out every time before
    // update is called so that a fresh brand new
    // acceleration can be applied the next time
    // instead of cumulatively adding up
    acceleration.mult(0);

  }

}
