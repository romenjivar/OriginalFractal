 int maxDepth = 5;  // Controls how deep the recursion goes
int petals = 10;  // Number of petals at each level
int sign = (int)(Math.random()*2)+1;
void setup() {
  size(600, 600);
  background(0);  
  drawRoseFractal(245, maxDepth);
}

// Recursive function to draw a rose
void drawRoseFractal(float radius, int depth) {
  if (depth == 0) return;  // Base case stop recursion
  float angleIncrement = TWO_PI / petals; 
  int r = 180;
  int g = 25;
  int b = 60;

  for (int i = 0; i < petals; i++) {
    float x = cos(i * angleIncrement) * radius;
    float y = sin(i * angleIncrement) * radius;

    if(sign == 1){
    r += 15;
    g += 20;
     b += 20;
     
    }
    else{
     r += 15;
     g += 15;
     b += 20;
     
    }
    fill(r, g, b); 
    stroke(0);
    ellipse(300+x, 300+y, radius, radius);  // Draw petal

    // Recursive call with smaller radius
    drawRoseFractal(radius * 0.6, depth - 1);
    System.out.println(sign);
  }
}
