import processing.core.*; import java.applet.*; import java.awt.*; import java.awt.image.*; import java.awt.event.*; import java.io.*; import java.net.*; import java.text.*; import java.util.*; import java.util.zip.*; public class random_vs_noise extends PApplet {PFont georgia;
float num, y;
String funcion; // texto de la funci\u00f3n
boolean f; // switch entre la func\u00f3n noise y random

public void setup(){
  size(300,300);
  georgia = createFont("Georgia", 24);
  textFont(georgia, 24);
  f = true;
}

public void draw(){
  background(255);
  for (int x = 0; x < width; x++){
    num = millis()*0.0003f + PApplet.parseFloat(x) / mouseX+1;

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

public void keyPressed(){
  f =! f;
}

  static public void main(String args[]) {     PApplet.main(new String[] { "random_vs_noise" });  }}