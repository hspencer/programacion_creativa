float p[][];
int num;

void setup() {
  size(500, 500, P3D);
  noFill();
  stroke(0, 100);
  
  num = 200;
  p = new float[num][3];
  
  genPoints();
}

void genPoints() {
  float amp = 100;
  for (int i = 0; i < num; i++) {
    p[i][0] = random(-amp, amp);
    p[i][1] = random(-amp, amp);
    p[i][2] = random(-amp, amp);
  }
}

void draw() {
  background(255);
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateX(((float)mouseY / (float)height) * PI);
  rotateY(((float)mouseX / (float)width) * -PI);
  rotateY((float)millis()/2500);
  drawThing(0, 0, 0);
  popMatrix();
}

void drawThing(float x, float y, float z) {

  beginShape();
  for (int i = 0; i < num; i++) {
    vertex(p[i][0], p[i][1], p[i][2]);
  }
  endShape();
}

void keyPressed() {
  genPoints();
}

