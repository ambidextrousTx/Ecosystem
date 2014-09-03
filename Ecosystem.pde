// Based on The Nature of Code: the lessons and the Ecosystem project from the book
// Lots of randomly added functionality
//
// Using vectors - in particular PVector
// Using velocity, acceleration, and Perlin noise
// Using objects, inheritance, polymorphism

NervousFly nervousFly;
SwimmingFish swimmingFish;

void setup() {
  size(640, 480);
  background(30);
  nervousFly = new NervousFly();
  swimmingFish = new SwimmingFish();
}

void draw() {
  background(30);
  nervousFly.update();
  nervousFly.checkEdges();
  nervousFly.display();

  swimmingFish.update();
  swimmingFish.checkEdges();
  swimmingFish.display();
}
