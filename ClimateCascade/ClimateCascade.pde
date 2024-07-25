AEC aec;
float timer;
ArrayList<Ripple1> pond;


void setup() {
  frameRate(25);
  size(1200, 400);
  
  aec = new AEC();
  aec.init();
  timer = 0;
  
  pond = new ArrayList();
}

void draw() {
  aec.beginDraw();
  background(0,0,0);
  noStroke();
  
  //version #1
  drawVersion1();
  if (mousePressed) {
    pond.add(new Ripple1(mouseX/aec.getScaleX(), mouseY/aec.getScaleY()));  
  }
  
  //version #2
  
  
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

void mouseClicked() {
  println(mouseX/aec.getScaleX(), mouseY/aec.getScaleY()); 
}

void keyPressed() {
  aec.keyPressed(key);
}
