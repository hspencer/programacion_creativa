import processing.core.*; import java.applet.*; import java.awt.*; import java.awt.image.*; import java.awt.event.*; import java.io.*; import java.net.*; import java.text.*; import java.util.*; import java.util.zip.*; public class croquera extends PApplet {/*
croquera simple
por Herbert Spencer
e.[ad] Escuela de Arquitectura y Dise\u00f1o
*/

//definir una tipograf\u00eda
PFont verdana;

public void setup(){
  size(525, 378);
  verdana = createFont("sans-serif", 12);
  textFont(verdana);
  background(0xffDDDDCC);
  smooth();
  fill(0,190);
  text("pulsa 'ESPACIO' para borrar, 's' para salvar el dibujo", 10, 365);
}

public void draw(){
  //dibuja marco
  noFill();
  rect(0,0, width-1, height-1);
  // si el bot\u00f3n del mouse es apretado
  if(mousePressed){
    // dibuja una l\u00ednea desde el punto previo del mouse
    // al punto actual del mouse
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}

public void keyPressed(){
  
  if(key == ' '){
    setup();
  }  
  
  if((key == 's') || (key == 'S')){
    save("croquis.jpg");
  }
}

  static public void main(String args[]) {     PApplet.main(new String[] { "croquera" });  }}