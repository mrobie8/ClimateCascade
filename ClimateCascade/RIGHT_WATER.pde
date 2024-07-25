

boolean beingFilled = true;
int waterW;
int waterH;
float waterLevel = -22;
int Y_AXIS = 1;
int X_AXIS = 2;
float noiseCounter = 0;
float yoff = 0.0;
color gradientC1 = color(112, 219, 255);;
color gradientC2 = color(0, 0, 128);


void water2() {

  if (beingFilled) {
    drawWater();

    drawSinWave(waterLevel);
    waterLevel += .1;
    if (waterLevel >= waterFinalHeight) {
      beingFilled = false;
    }
    noiseCounter = noiseCounter + .05;
  } else {
    drawWater(); // draws water gradient
    drawSinWave(waterFinalHeight);  // draws wave pattern at the top
    noiseCounter = noiseCounter + .05;
  }
}

// draws the water gradient to the screen
void drawWater() {
  // x max = 73
  // y max = 28
  int waterW = 73;
  int waterH = 28;
  int x = 0;
  int y = 0;
  //rect(x, y, waterW, waterH);
  setGradient(x, y, waterW, waterH, gradientC1, gradientC2, Y_AXIS);
}

// draws the water wave at the top of the screen
void drawSinWave(float yOffset) {
  pushStyle();
  for (int i = 0; i < 73; i++) {
    float x = i;
    float periodLength = .2;
    float amplitude = 8;
    float y = noise(noiseCounter + x * periodLength) * amplitude - yOffset;
    stroke(0);
    strokeWeight(2);
    fill(0);
    line(i, 0, x, y);
  }
  popStyle();
}

// sets the gradient of the water
void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {
  pushStyle();
  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  } else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
  popStyle();
}
