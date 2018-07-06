int num = 48;
Ente[] e;

void setup() {
  size(600, 600);
  e = new Ente[num];
  for (int i = 0; i < num; i++) {
    e[i] = new Ente();
  }
  background(255);
}

void draw() {
  fill(255, 15);
  noStroke();
  rect(0, 0, width, height);
  for (int i = 0; i < num; i++) {
    e[i].move();
    e[i].paint();
    for (int j = 0; j <= i; j++) {

      float d = dist(e[i].x, e[i].y, e[j].x, e[j].y);
      if (d < 100) {
        stroke(e[i].col);
        line(e[i].x, e[i].y, e[j].x, e[j].y);
      }
    }
  }
}
