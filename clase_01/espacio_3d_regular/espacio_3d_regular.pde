void setup() {
  size(600, 600, P3D);
}


void draw() {
  background(255);
  float rx = map(mouseY, 0, height, 0, TWO_PI);
  float ry = map(mouseX, 0, width, 0, TWO_PI);
  pushMatrix();
  {
    translate(width/2, height/2, 0);
    rotateX(-rx);
    rotateY(ry);
    for (int z = -100; z < 100; z += 10) {
      for (int y = -100; y < 100; y += 10) {
        for (int x = -100; x < 100; x += 10) {
          point(x, y, z);
        }
      }
    }
  }
  popMatrix();
}

