float m = 33;
float inc = 15; 

void setup() {
  size(500, 500);
  noFill();

}


void draw() {
  background(255);
  inc = map(mouseX, 0, width, 1, 25);
  rect(m, m, width - 2 * m, height - 2 * m);
  
  stroke(0, 100);
  for (float x = m; x <= width - m; x += inc) {
    stroke(x*.5, 255 - x*.25, 200, 100);
    line(x, m, width-m, x);
    line(m, x, x, height - m);
  }
}
