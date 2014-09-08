class Liquid {
  float x, y, w, h;
  float c;

  Liquid(float _x, float _y, float _w, float _h, float _c) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    c = _c;
  }

  void display() {
    noStroke();
    // Light blue for the liquid
    fill(10, 10, 240, 90);
    rect(x, y, w, h);
  }

}