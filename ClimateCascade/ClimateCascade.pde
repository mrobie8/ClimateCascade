AEC aec;
float timer;
ArrayList<Ripple> pond;
color RippleColor;

void setup() {
  frameRate(25);
  size(1200, 400);
  
  aec = new AEC();
  aec.init();
  setupPharus();
  
  timer = 0;
  pond = new ArrayList();
  RippleColor = color(130, 220, 245);
}

void draw() {
  aec.beginDraw();
  background(0,0,0);
  noStroke();
  
  drawPharus();
  
  for (int i = 0; i < pond.size(); i++) {
    pond.get(i).draw();
    pond.get(i).grow();
  }
  
  //grid lines
  stroke(0, 255, 0);
  strokeWeight(0.15);
  line(10, 0, 10, 30);
  line(20, 0, 20, 30);
  line(30, 0, 30, 30);
  line(55, 0, 55, 30);
  line(60, 0, 60, 30);
  strokeWeight(1);

  fill(255,0,100);
  rect(mouseX/aec.getScaleX(),mouseY/aec.getScaleY(),1,1);

  aec.endDraw();
  aec.drawSides();
  timer ++;
}

interface Ripple {
  void draw();
  void grow();
}


void mouseClicked() {
  //version control
  /** 
  version 1: 1 ring
  version 2: 2 rings
  version 3: 3 rings
  version 4: realistic pixels
  **/
  //pond.add(new Ripple2(mouseX/aec.getScaleX(), mouseY/aec.getScaleY()));  
  
  //bug with the edges
  //version 4
  pond.add(new Ripple4(mouseX/aec.getScaleX(), mouseY/aec.getScaleY(), 75, 29, 1));
  
  println(mouseX/aec.getScaleX(), mouseY/aec.getScaleY()); 
}

void keyPressed() {
  aec.keyPressed(key);
}
