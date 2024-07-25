//version #1

class Ripple1 implements Ripple {
  float x, y;
  float size;
  float alpha;
  
  Ripple1(float a, float b) {
    x = a;
    y = b;
    size = 5;
    alpha = 255;
  }
  
  void draw() {
    noFill();
    stroke(RippleColor, alpha);
    strokeWeight(rippleWeight);
    ellipse(x, y, size/2, size);
  }
  
  void grow() {
    size += 0.7;
    alpha -= 15;
    if (alpha < 0) pond.remove(this);
  }
}
