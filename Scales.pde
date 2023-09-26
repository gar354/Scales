
int[] scaleSizeRange = {50, 70};
int screenSize = 500;

void setup() {
  size(500, 500);  //processing sucks and requires a constant to be inside of this function
  noLoop(); //stops the draw() function from repeating
}
void draw() {
  for (int x = 0; x <= screenSize; x += scaleSizeRange[0] / 2) {
    for (int y = 0; y <= screenSize; y += scaleSizeRange[0] / 2) {
      scale(x, y);
    }
  }
}
void scale(int x, int y) {
  int scaleSize = (int)lerp((float)scaleSizeRange[0], (float)scaleSizeRange[1] + 1, (float)Math.random());
  fill(#ec5b94);
  ellipse(x, y, scaleSize, scaleSize);
}
