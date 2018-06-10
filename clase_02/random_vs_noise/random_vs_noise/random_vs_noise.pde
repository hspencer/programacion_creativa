PFont georgia;
float num, y;
String funcion; // texto de la función
boolean f; // switch entre la funcón noise y random

void setup(){
  size(300,300);
  georgia = createFont("Georgia", 24);
  textFont(georgia, 24);
  f = true;
}

void draw(){
  background(255);
  for (int x = 0; x < width; x++){
    num = millis()*0.0003 + float(x) / mouseX+1;

    if (f) {
      y = random(height);
      funcion = "random";
    }
    else{
      y = noise(num)*height;
      funcion = "noise";  
    }
    line (x,0, x,y);
  }
  fill(255);
  text(funcion, 15, 33);
}

void keyPressed(){
  f =! f;
}
