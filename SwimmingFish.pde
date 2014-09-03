class SwimmingFish extends Mover {

  void update() {
    // Acceleration direction - toward the mouse
    PVector mouseVector = new PVector(mouseX, mouseY);
    PVector direction = PVector.sub(mouseVector, location);
    direction.normalize();

    direction.mult(0.25);

    acceleration = direction;

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
