// Based on The Nature of Code: the lessons and the Ecosystem project from the book
// Lots of randomly added functionality
//
// Using vectors - in particular PVector
// Using velocity, acceleration, and Perlin noise
// Using objects, inheritance, polymorphism

NervousFly nervousFly;
SwimmingFish[] swimmingFish = new SwimmingFish[2];

void setup() {
  size(640, 480);
  background(50, 125);
  nervousFly = new NervousFly();
  for (int i = 0; i < 2; i++) {
    swimmingFish[i] = new SwimmingFish();
  }
}

void draw() {
  background(50, 125);
  nervousFly.update();
  nervousFly.checkEdges();
  nervousFly.display();

  for (int i = 0; i < 2; i++) {
    swimmingFish[i].update();
    swimmingFish[i].checkEdges();
    swimmingFish[i].display();
  }
}
