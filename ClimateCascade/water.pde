
boolean beingFilled = true;
float waterLevel;
float noiseCounter = 0;
float yoff = 0.0;
final int Y_AXIS = 1;
final int X_AXIS = 2;
int waterFinalHeight = 3; // default is 1, make greater if want water to go to top for fish bowl

void water() {
  float targetWaterLevel = -22 + (25 / 3 * GetNumTracks());
  drawWater();
  if (GetNumTracks() < 3) {
    beingFilled = true;
  }
  if (beingFilled) {
    drawSinWave(waterLevel);
    if (waterLevel < targetWaterLevel) {
      waterLevel += 0.1;
    } else if (waterLevel > targetWaterLevel) {
      waterLevel -= 0.1;
    }
    if (waterLevel >= waterFinalHeight && GetNumTracks() >= 3) {
      beingFilled = false;
    }
  } else {
    drawSinWave(waterFinalHeight); // Draws wave pattern at the top
  }
  noiseCounter += 0.05;
}

// Draws the water gradient to the screen
void drawWater() {
  int waterW = 73;
  int waterH = 28;
  int x = 0;
  int y = 0;
  setGradient(x, y, waterW, waterH, Y_AXIS);
}

// Draws the water wave at the top of the screen
void drawSinWave(float yOffset) {
  pushStyle();
  for (int i = 0; i < 73; i++) {
    float x = i;
    float periodLength = 0.2;
    float amplitude = 8;
    float y = noise(noiseCounter + x * periodLength) * amplitude - yOffset;
    stroke(0);
    strokeWeight(2);
    line(i, 0, x, y);
  }
  popStyle();
}

// Sets the gradient of the water
void setGradient(int x, int y, float w, float h, int axis) {
  pushStyle();
  noFill();
  color c = color(65, 89, 150);

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y + h; i++) {
      stroke(c);
      line(x, i, x + w, i);
    }
  } else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x + w; i++) {
      stroke(c);
      line(i, y, i, y + h);
    }
  }
  popStyle();
}
