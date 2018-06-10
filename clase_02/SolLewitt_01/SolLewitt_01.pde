/*
*    10,000 random straight lines about four inches long.
*
*                                             Sol LeWitt
*/

ArrayList Lines;
int numLines = 10000;
float linesLength = 30;

void setup() {
  size(900, 600);
  Lines = new ArrayList();
  createLines();
  noLoop();
  stroke(0, 90);
}

void createLines() {
  for (int i = 0; i < numLines; i++) {
    Point a = new Point(); 
    float ang = random(TWO_PI);
    float limit = ang + TWO_PI;
    for (float t = ang; t < limit; t++) {
      float x = a.x + cos(t) * linesLength;
      float y = a.y + sin(t) * linesLength;
      if (x > 0 && x < width && y > 0 && y < height) {
        Point b = new Point(x, y);
        Line l = new Line(a, b);
        Lines.add(l);
        println("línea número "+i+" ha sido agregada"); 
        break;
      }
    }
  }
}


void draw() {
  background(255);
  for (int i = 0; i < Lines.size(); i ++) {
    Line l = (Line)Lines.get(i);
    l.draw();
  }
}
