float m = 63;
float inc = 100; 

void setup() {
  size(500, 500);
  noFill();
}


void draw() {
  background(255);

  rect(m, m, width - 2 * m, height - 2 * m);

  stroke(0, 100);
  for (float x = m; x <= width - m; x += inc) {

    line(x, m, width-m, x);
    line(m, x, x, height - m);
  }

  inc -= 5;
  saveFrame("img/######.png");
  if (inc < 1) {
    print("listo!");
    exit();
  }
}
