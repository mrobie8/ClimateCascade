//version #1

void drawVersion1() {
  for (int i = 0; i < pond.size(); i++) {
    pond.get(i).draw();
    pond.get(i).grow();
  }
}

class Ripple1 {
  float x, y;
  float size;
  float alpha;
  color ripColor;
  
  Ripple1(float a, float b) {
    x = a;
    y = b;
    size = 5;
    alpha = 255;
    ripColor = color(188, 230, 242);
  }
  
  void draw() {
    noFill();
    stroke(ripColor, alpha);
    strokeWeight(1);
    ellipse(x, y, size/2, size);
  }
  
  void grow() {
    size += 1;
    alpha -= 20;
    if (alpha < 0) pond.remove(this);
  }
}
