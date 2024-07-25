//return true if 4 or more people are within 100 px to each other 
//if there are multiple clusters choses the largest one
boolean clusterFormed() {
  boolean foundCluster = false;
  int maxClusterSize = 0; 
  int bestAvX = 0;
  int bestAvY = 0;
  for (int trackID = 0; trackID < GetNumTracks(); trackID++) {
    int personX = GetX(trackID);
    int personY = GetY(trackID);
    int localCount = 0;
    int localAvX = 0;
    int localAvY = 0;
    for (int otherID = 0; otherID < GetNumTracks(); otherID++) {
      if (trackID != otherID) {
        int otherX = GetX(otherID);
        int otherY = GetY(otherID);
        if (dist(personX, personY, otherX, otherY) <= distCluster) {
          localAvX += otherX;
          localAvY += otherY;
          localCount++;
        }
      }
    }
    localAvX += personX;
    localAvY += personY;
    localCount++;
    if (localCount >= 4 && localCount > maxClusterSize) {
      maxClusterSize = localCount;
      bestAvX = localAvX / localCount;
      bestAvY = localAvY / localCount;
      foundCluster = true;
    }
  }
  if (foundCluster) {
    giantRippleX = bestAvX;
    giantRippleY = bestAvY;
  }
  return foundCluster;
}



void createGiantRipple() {
  if (timer % 10 == 0) {
    giantRipple.add(new Circle(giantRippleX/aec.getScaleX(), giantRippleY/aec.getScaleY()));
  }
  for (int i = 0; i < giantRipple.size(); i++) {
    giantRipple.get(i).draw();
    giantRipple.get(i).grow();
  }
}

class Circle {
  float x, y;
  float size;
  float alpha;
  
  Circle(float a, float b) {
    x = a;
    y = b;
    size = 5;
    alpha = 255;
  }
  
  void draw() {
    noFill();
    stroke(RippleColor, alpha);
    strokeWeight(1);
    ellipse(x, y, size/2, size);
  }
  
  void grow() {
    size += 2;
    alpha -= 5;
    if (alpha < 0) giantRipple.remove(this);
  }
}
