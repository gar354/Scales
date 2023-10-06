// feel free to change these!
int rows = 10;
int columns = 10;
float shapeLength = 60.0;
float spacing = 59.0;
float increment = .006;
float alpha = 240.0;
// =========================
int xSize;
int ySize;
float currentshapeLength;
int timeOffset = 0;
color shapeColor = color(0, 0, 0);
color targetColor = color(0, 0, 0);
int offset = 0;

void setup() {
  offset = (int)spacing / 2;
  xSize = offset * columns;
  ySize = offset * rows;
  surface.setSize(xSize, ySize);
  setColor();
}

void draw() {
  background(255);
  for (int y = 0; y < rows; y++) {
    int flippedY = rows - y - 1;
    for (int x = 0; x < columns; x++) {
      scale(x * offset + offset / 2, flippedY * offset + offset / 2);
    }
  }
  incrementColor();
  if (millis() - timeOffset > 1000) { // change color every second
    timeOffset = millis();
    targetColor = getRandomColor();
  }
}

void scale(float x, float y) {
  fill(shapeColor, alpha);
  // draw diamond shape
  beginShape();
  vertex(x, y - offset);
  vertex(x - offset, y - offset);
  vertex(x, y + offset);
  vertex(x + offset, y - offset);
  endShape();
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
