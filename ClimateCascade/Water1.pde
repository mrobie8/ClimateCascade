
//water variables
int waterHeight = 120;        // Initial height of the water
float fillSpeed =1.5;          // Speed at which water fills up
float waveFrequency = 0.05; // Frequency of the waves
float waveAmplitude = 18;  // Amplitude of the waves
float waveOffset = 0;      // Offset for animating waves
float ticks;

int crestHeight = 120;        // Initial height of the water
float crestfillSpeed =5;          // Speed at which water fills up
float crestFrequency = 0.05; // Frequency of the waves
float crestAmplitude = 18;  // Amplitude of the waves
float crestOffset = 0;      // Offset for animating waves
float crestticks;

void water1() {
  // Draw the wave crests
  fill(184,214,241);          // Set the fill color to blue
  noStroke();               // No border for the water rectangle

  crestticks++;
  if (crestticks%3==0) {
    crestFrequency = random(1, 3); // Frequency of the waves changes
  }
    if (crestticks%5==0) {
    crestAmplitude = random(2, 5);  // Amplitude of the waves changes
    crestfillSpeed = random(1.9, 2);
  }

  beginShape();
  for (float x = 0; x <= width; x += 1) {
    // Calculate y position with a sine wave for the wave effect
    float y = height - crestHeight + crestAmplitude * sin(crestFrequency * x/aec.getScaleX() + crestOffset);
    vertex(x/aec.getScaleX(), y/aec.getScaleY());
  }
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);

  // Increment the crest height
  crestHeight += crestfillSpeed;

  // Stop the crest from overflowing
  if (crestHeight > height+20) {
    crestHeight = (height+20);
  }

  // Animate the wave
  crestOffset += 0.1;
  
 
  // WATER
  fill(15,57,89);          // Set the fill color to blue
  noStroke();               // No border for the water rectangle

  ticks++;
  if (ticks%3==0) {
    waveFrequency = random(.5, 1); // Frequency of the waves changes
  }
    if (ticks%5==0) {
    waveAmplitude = random(2, 3);  // Amplitude of the waves changes
    fillSpeed = random(1.25, 2);
  }

  beginShape();
  for (float x = 0; x <= width; x += 1) {
    // Calculate y position with a sine wave for the wave effect
    float y = height - waterHeight + waveAmplitude * sin(waveFrequency * x/aec.getScaleX() + waveOffset);
    vertex(x/aec.getScaleX(), y/aec.getScaleY());
  }
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);

  // Increment the water height
  waterHeight += fillSpeed;

  // Stop the water from overflowing
  if (waterHeight > height+25) {
    waterHeight = height+25;
  }

  // Animate the wave
  waveOffset += 0.05;
  
  
}
