AEC aec;
float timer;

void setup() {
  frameRate(25);
  size(1200, 400);
  
  aec = new AEC();
  aec.init();
  timer = 0;
}

void draw() {
  aec.beginDraw();
  background(0,0,0);
  noStroke();
  
  
  
  //glaciers
  glaciers();
  
  
 

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
  rect(mouseX/aec.getScaleX(),mouseY/aec.getScaleY(),3,4);

  aec.endDraw();
  aec.drawSides();
  timer ++;
}

void glaciers() {
  randomSeed(1);
  fill(int(random(200,255)));
  //first section
  rect(0, 13, 10, 20);
  rect(2, 11, 7, 2);
  rect(3, 9, 4, 2);
 
  //second section
  rect(10, 12, 7, 20);
  rect(11, 11, 5, 2);
  rect(12, 10, 2, 1);
  rect(17, 14, 6, 10);
  rect(23, 12, 3, 10);
  rect(26, 11, 3, 10);
  rect(29, 8, 4, 20);
  rect(33, 7, 2, 20);
  rect(35, 8, 1, 20);
  rect(36, 9, 2, 20);
  rect(38, 12, 2, 20);
  
  
  
  //rect(0, 13, 20, 20); //big bottom
  //rect(35, 13, 10, 20);
  
  
  
  //rect(2, 10, 15, 5);
  //rect(4, 8, 5, 5);
  //rect(8, 6, 13, 9);
  //rect(21, 9, 5, 5);
  ////rect(23, 11, 13, 5);
  
  
  //rect(33, 9, 5, 6);
}



void mouseClicked() {
  println(mouseX/aec.getScaleX(), mouseY/aec.getScaleY()); 
}

void keyPressed() {
  aec.keyPressed(key);
}
