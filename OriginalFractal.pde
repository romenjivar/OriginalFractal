int maxDepth = 5;  // Controls how deep the recursion goes
int petals = 10;  // Number of petals at each level

void setup() {
  size(600, 600);
  background(0);  
  drawRoseFractal(200, 0, maxDepth);
}

// Recursive function to draw a rose
void drawRoseFractal(float radius, float angle, int depth) {
  if (depth == 0) return;  // Base case stop recursion
  float angleIncrement = TWO_PI / petals; 

  for (int i = 0; i < petals; i++) {
    float x = cos(i * angleIncrement) * radius;
    float y = sin(i * angleIncrement) * radius;

    fill(255, 0, 0, 150); 
    stroke(0);
    ellipse(300+x, 300+y, radius, radius);  // Draw petal

    // Recursive call with smaller radius
    drawRoseFractal(radius * 0.6, i * angleIncrement, depth - 1);
  }
}
