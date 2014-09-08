// Based on The Nature of Code: the lessons and the Ecosystem project from the book
// Lots of randomly added functionality
//
// Using vectors - in particular PVector
// Using velocity, acceleration, and Perlin noise
// Using objects, inheritance, polymorphism

NervousFly nervousFly;
SwimmingFish[] swimmingFish = new SwimmingFish[2];
Liquid liquid;

void setup() {
  size(800, 600);
  background(50, 125);
  fill(200, 30, 30, 100);
  rect(320, 120, 20, 260);
  nervousFly = new NervousFly();
  for (int i = 0; i < 2; i++) {
    swimmingFish[i] = new SwimmingFish(pow((i + 1), 4));
  }

  liquid = new Liquid(0, height/ 2, width, height/ 2, 0.1);
}

void draw() {
  background(50, 125);
  fill(200, 30, 30, 100);
  rect(320, 20, 20, 260);

  liquid.display();
  nervousFly.update();
  nervousFly.checkEdges();
  nervousFly.display();

  for (int i = 0; i < 2; i++) {
    swimmingFish[i].update();
    swimmingFish[i].checkEdges();
    swimmingFish[i].display();
  }
}
