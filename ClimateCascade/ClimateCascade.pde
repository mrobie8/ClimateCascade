AEC aec;
float timer;
ArrayList<Ripple> pond;
HashMap<Integer, Integer> lengthInSpace = new HashMap<>(); //trackID and seconds
ArrayList<Integer> people;

color RippleColor = color(130, 220, 245);
int frequency = 50;

void setup() {
  frameRate(25);
  size(1200, 400);
  
  aec = new AEC();
  aec.init();
  setupPharus();
  
  timer = 0;
  pond = new ArrayList();
}

void draw() {
  aec.beginDraw();
  background(0,0,0);
  noStroke();
  
  drawPharus();
  
  if (clusterFormed()) {
    //giant spiral
    
    
  } else {
    for (int i = 0; i < pond.size(); i++) {
      pond.get(i).draw();
      pond.get(i).grow();
    }
    
    for (Integer key : lengthInSpace.keySet()) {
      lengthInSpace.put(key, lengthInSpace.get(key) + 1);
    }
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

//different ripple objects
interface Ripple {
  void draw();
  void grow();
}


void mouseClicked() {
  //version control
  /** 
  version 1 (Rippe1): 1 ring
  version 2 (Rippe2): 2 rings
  version 3 (Rippe3): 3 rings
  **/
  pond.add(new Ripple1(mouseX/aec.getScaleX(), mouseY/aec.getScaleY()));  
  
  //bug with the edges
  //version 4: realistic pixels
  //pond.add(new Ripple4(mouseX/aec.getScaleX(), mouseY/aec.getScaleY(), 75, 29, 1));
  
  println(mouseX/aec.getScaleX(), mouseY/aec.getScaleY()); 
}

void keyPressed() {
  aec.keyPressed(key);
}

//return true if 4 or more people are within 100 px to each other
boolean clusterFormed() {
  int count = 1;
  for (int trackID=0; trackID<GetNumTracks(); trackID++) {
    for (int others=0; trackID<GetNumTracks(); trackID++) {
      if (trackID != others) {
        if (dist(GetX(trackID), GetY(trackID), GetX(others), GetY(others)) <= 100) {
          count ++;
        }
      }
    }
    if (count >= 4) return true;
  }
  return false;
}
