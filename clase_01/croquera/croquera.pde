/*
croquera simple
por Herbert Spencer
*/

PFont verdana;

void setup(){
  size(525, 378);
  verdana = createFont("sans-serif", 12);
  textFont(verdana);
  background(255);
  smooth();
  fill(0,190);
  text("pulsa 'ESPACIO' para borrar, 's' para salvar el dibujo", 10, 365);
}

void draw(){
  //dibuja marco
  noFill();
  rect(0,0, width-1, height-1);
  // si el botÛn del mouse es apretado
  if(mousePressed){
    // dibuja una lÌnea desde el punto previo del mouse
    // al punto actual del mouse
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}

void keyPressed(){
  
  if(key == ' '){
    setup();
  }  
  
  if((key == 's') || (key == 'S')){
    save("croquis.jpg");
  }
}
