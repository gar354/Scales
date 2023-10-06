// feel free to change these!
int rows = 20;
int columns = 20;
float minLength = 200.0;
float maxLength = 100.0;
float increment = .01;
float alpha = 240.0;
// =========================
int xSize;
int ySize;
float time = 0.0;
int timeOffset = 0;
color shapeColor = color(0, 0, 0);
color targetColor = color(0, 0, 0);
int offset = 0;
float currentLength = minLength;
float lengthDiv = currentLength / 2;
void setup() {
  offset = (int)minLength / 2;
  xSize = offset * columns;
  ySize = offset * rows;
  surface.setSize(xSize, ySize);
  setColor();
}

void draw() {
  background(255);
  lengthDiv = currentLength / 2;
  for (int y = 0; y < rows; y++) {
    int flippedY = rows - y - 1;
    for (int x = 0; x < columns; x++) {
      scale(x * lengthDiv, flippedY * lengthDiv);
    }
    time += increment;
    float weight = ((cos(time) + 1) / 2);
    alpha = ceil(lerp(255.0, 0.0, weight));
    currentLength = ceil(lerp(minLength, maxLength, weight));
  }
  incrementColor();
  if (millis() - timeOffset > 1000) { // change color every second
    timeOffset = millis();
    targetColor = getRandomColor();
  }
}

void scale(float x, float y) {
  fill(shapeColor, alpha);  
  ellipse(x, y + lengthDiv, currentLength, currentLength);
  rect(x - lengthDiv * 0.5, y - lengthDiv * 0.5, lengthDiv, lengthDiv);
}

void mousePressed() {
  setColor();
}

color getRandomColor() {
  float currentR = lerp(0.0, 255.0, (float)Math.random());
  float currentG = lerp(0.0, 255.0, (float)Math.random());
  float currentB = lerp(0.0, 255.0, (float)Math.random());
  return color(currentR, currentG, currentB);
}

void setColor() {
  color randColor = getRandomColor();
  targetColor = randColor;
  shapeColor = targetColor;
}


void incrementColor() {
  shapeColor = lerpColor(shapeColor, targetColor, 0.01);
}
