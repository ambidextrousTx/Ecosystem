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
    stroke(0);
    fill(10, 230, 10);
    ellipse(location.x, location.y, 16, 16);

  }
}
