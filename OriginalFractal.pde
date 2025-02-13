int maxDepth = 5;  // Controls how deep the recursion goes
int petals = 10;
int sign;
boolean showFlower = false; // track if the flower should be displayed
int noButtonTries = 0; // # of times the no button was clicked

// Button properties
float yesX, yesY, yesW, yesH;
float noX, noY, noW, noH;

void setup() {
  size(1000, 1000);
  resetButtons(); // Start button positions
}

void draw() {
  background(250, 220, 240);

  if (showFlower == false) {
    // Display the Valentines message
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(32);
    text("Will you be my Valentine?", width / 2, height / 4);
    
    // Draw yes button 
    fill(0, 200, 0);
    rect(yesX, yesY, yesW, yesH, 10);
    fill(255);
    textSize(20);
    text("Yes", yesX + yesW / 2, yesY + yesH / 2);
    
    // Draw no button 
    if (noButtonTries < 3) {
      fill(200, 0, 0);
      rect(noX, noY, noW, noH, 10);
      fill(255);
      textSize(20);
      text("No", noX + noW / 2, noY + noH / 2);
    }
    
  } else {
    // Show the flower when yES is clicked
    sign = (int)(Math.random() * 2) + 1;
    drawRoseFractal1(250, maxDepth);
    noLoop();
  }
}

void mousePressed() {
  // Check if yes button is clicked
  if (mouseX > yesX && mouseX < yesX + yesW && mouseY > yesY && mouseY < yesY + yesH) {
    showFlower = true;
  }

  // Check if no button is clicled (if it still there)
  if (noButtonTries < 3 && mouseX > noX && mouseX < noX + noW && mouseY > noY && mouseY < noY + noH) {
    noButtonTries++;
    updateButtons(); // Shrink no button, grow yes button, change x & y if need
  }
}

// Function to reset the buttons to initial positions and sizes
void resetButtons() {
  yesW = 100;
  yesH = 50;
  yesX = 360;
  //yesX = width / 2 - yesW - 20;
  yesY = height / 2;

  noW = 100;
  noH = 50;
  noX = 520;
  noY = height / 2;
}

// Function to update buttons after no is clicked
void updateButtons() {
  if (noButtonTries < 3) {
    noW *= 0.6;
    noH *= 0.6;
    yesW *= 1.2;
    yesH *= 1.2;
  }
  
  // After 3rd no, remove no button and center yes button
  if (noButtonTries >= 3) {
    yesX = width / 3 + 20 ;
    yesY = height / 2;
    yesW = yesW*2;
    yesH = yesH*2;
  }
}

// Recursive function to draw the rose fractal
void drawRoseFractal1(float radius, int depth) {
  if (depth == 0) return; // Base case stop recursion
  float angleIncrement = TWO_PI / petals;
  int r = 180;
  int g = 25; 
  int b = 60;

  for (int i = 0; i < petals; i++) {
    float x = cos(i * angleIncrement) * radius;
    float y = sin(i * angleIncrement) * radius;

    if (sign == 1) {
      r += 15; g += 20; b += 20;
    } else {
      r -= 15; g -= 15; b -= 20;
    }

    fill(r, g, b);
    stroke(0);
    ellipse(width / 2 + x, height / 2 + y, radius, radius);

    // Recursive call with smaller radius
    textSize(40);
    fill(0);
    text("Here is a flower for you :)!", width / 2, 30);
    drawRoseFractal1(radius * 0.6, depth - 1);
    System.out.println(sign);
  }
}
