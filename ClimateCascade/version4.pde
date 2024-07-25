//version #4

class Ripple4 implements Ripple {
  float[][] current, previous;
  float damping = 0.5; // High damping for quick fade
  float propagationFactor = 0.9; // Slow propagation
  int x, y;
  int cols, rows;
  int cellSize;
  float aspectRatio; // Ratio to control the vertical stretch

  Ripple4(int x, int y, int cols, int rows, int cellSize) {
    this.x = x;
    this.y = y;
    this.cols = cols;
    this.rows = rows;
    this.cellSize = cellSize;
    this.aspectRatio = 2.0; // Vertical stretch ratio (increase to stretch more vertically)
    current = new float[cols][rows];
    previous = new float[cols][rows];
    
    // Initialize the grids
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        current[i][j] = 0;
        previous[i][j] = 0;
      }
    }
    
    // Create initial disturbance
    if (x >= 0 && x < cols && y >= 0 && y < rows) {
      previous[x][y] = 500; // Initial disturbance for noticeable ripple
    }
  }

  public void draw() {
    for (int i = 1; i < cols - 1; i++) {
      for (int j = 1; j < rows - 1; j++) {
        // Adjust propagation to be more vertical
        float nextValue = ((previous[i-1][j] + previous[i+1][j]) * (1 / aspectRatio) 
                           + previous[i][j-1] + previous[i][j+1]) / (2 + (1 / aspectRatio) - 1) - current[i][j];
        nextValue *= damping; // Apply damping to make the ripple fade quickly
        current[i][j] = nextValue * propagationFactor; // Slow down propagation
        
        // Map the height to a color
        float c = current[i][j] * 255;
        c = constrain(c, -255, 255);
        // Change color mapping here to blue
        fill(0, 0, abs(c)); // Blue color: adjust intensity based on c
        noStroke();
        rect(i * cellSize, j * cellSize, cellSize, cellSize);
      }
    }
  }

  public void grow() {
    float[][] temp = previous;
    previous = current;
    current = temp;
  }
}
