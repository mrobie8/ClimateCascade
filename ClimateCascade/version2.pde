//vesion #2

class Ripple2 implements Ripple {
  float cSize1, cSize2, x, y;
  int alpha;
  
  Ripple2(int x, int y) {
    this.x = x;
    this.y = y;
    cSize1 = 0;
    cSize2 = 0;
    alpha = 255;
  }
  
  void draw() {
    noFill();
    stroke(RippleColor, alpha);
    strokeWeight(rippleWeight);
    ellipse(x, y, cSize1/2, cSize1);
    ellipse(x, y, cSize2/2, cSize2);
  }
  
  void grow() {
    cSize1 += 0.6;
    cSize2 += 0.25;
    alpha -= 10;
    if (alpha < 0) pond.remove(this);
  }
}
