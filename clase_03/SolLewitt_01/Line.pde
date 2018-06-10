class Line {
  Point a, b;
  Line() {
    a = new Point();
    b = new Point();
  }

  Line(Point a, Point b) {
    this.a = a;
    this.b = b;
  }

  void draw() {
    line(a.x, a.y, b.x, b.y);
  }
}


