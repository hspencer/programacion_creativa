float m = 20; // margen;
float inc = 5;

void setup() {
  size(500, 500);
  noStroke();
  ellipseMode(CENTER);
}


void draw() {
  background(0);
  inc = map(mouseX, 0, width, 5, 35);
  for (float y = m; y < height - m; y += inc) {
    for (float x = m; x < width - m; x += inc) {
      ellipse(x, y, inc * .75, inc * .75);
    }
  }
}
