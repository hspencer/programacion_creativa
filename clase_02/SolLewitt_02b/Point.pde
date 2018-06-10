class Point {
  float x, y;
  Point() {
    x = random(width);
    y = random(height);
  } 

  Point(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void draw() {
    ellipse(x, y, 3, 3);
  }
}

