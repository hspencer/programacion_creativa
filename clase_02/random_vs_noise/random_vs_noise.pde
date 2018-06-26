PFont georgia;
float num, y;
String funcion; // texto de la función
int f;      // switch entre la funcón noise y random

void setup() {
  size(300, 300);
  georgia = createFont("Georgia", 24);
  textFont(georgia, 24);
  f = 0;
}

void draw() {
  background(255);
  for (int x = 0; x < width; x++) {
    num = millis()*0.0003 + float(x) / mouseX+1;

    switch(f) {
    case 0:
      y = random(height);
      funcion = "random";
      break;

    case 1:
      y = noise(num)*height;
      funcion = "noise";  
      break;
    case 2:
      y = norm(randomGaussian(), -1, 1) * height/4 + height/3;
      funcion = "gaussian";
      break;
    }
    line (x, 0, x, y);
  }
  fill(255);
  text(funcion, 15, 33);
}

void keyPressed() {
  f++;
  f%=3;
  println("f = "+f);
}
