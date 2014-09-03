// Tried accelerating, but it looks most like a fly 
// with a simple location update using Perlin noise

class NervousFly extends Mover {

  void update() {
    float xloc = map(noise(tx), 0, 1, 0, width);
    float yloc = map(noise(ty), 0, 1, 0, height);

    location.x = xloc;
    location.y = yloc;
    tx += 0.01;
    ty += 0.01;

  }

  void display() {
    noStroke();
    fill(10, 230, 10, 200);
    ellipse(location.x, location.y, 16, 16);
    stroke(10, 230, 10, 200);
    strokeWeight(2);
    line(location.x, location.y, location.x + 10, location.y + 10);
    line(location.x, location.y, location.x - 10, location.y + 10);
    line(location.x, location.y, location.x, location.y - 10);

  }
}
