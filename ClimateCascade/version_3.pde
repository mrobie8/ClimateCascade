//vesion #3

class Ripple3 implements Ripple {
  float cSize1, cSize2, cSize3, x, y;
  int alpha;
  
  Ripple3(int x, int y) {
    this.x = x;
    this.y = y;
    cSize1 = 0;
    cSize2 = 0;
    cSize3 = 0;
    alpha = 255;
  }
  
  void draw() {
    noFill();
    stroke(RippleColor, alpha);
    strokeWeight(0.8);
    ellipse(x, y, cSize1/2, cSize1);
    ellipse(x, y, cSize2/2, cSize2);
    ellipse(x, y, cSize3/2, cSize3);
  }
  
  void grow() {
    cSize1 += 1;
    cSize2 += 0.5;
    cSize3 += 0.25;
    alpha -= 15;
    if (alpha < 0) pond.remove(this);
  }
}
