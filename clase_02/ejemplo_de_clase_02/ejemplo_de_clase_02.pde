float m = 20; // margen;
float inc = 5;

void setup() {
  size(500, 500);
  noStroke();
  ellipseMode(CENTER);
  colorMode(RGB, width);
}


void draw() {
  float rot = map(mouseY, 0, height, 0, TWO_PI);
  translate(width/2, height/2);
  
  background(0);
  pushMatrix();
  rotate(rot);
  inc = map(mouseX, 0, width, 5, 35);
  for (float y = m - height/2; y < height - m - height/2; y += inc) {
    for (float x = m - width/2; x < width - m - width/2; x += inc) {
      fill(x, y, 255);
      ellipse(x, y, inc * .75, inc * .75);
    }
  }
  popMatrix();
}
