int numNodos = 4;
int vertices;
boolean vis = true;
Nodo[] nodos;
PFont pixel;
float m = 100.0;
void setup(){
  vertices = 0;
  pixel = loadFont("pixel.vlw");
  nodos = new Nodo[numNodos];
  textFont (pixel, 8);
  textAlign(CENTER);
  ellipseMode(CENTER);
  size(800, 600);
  smooth();

  // construya todos los nodos indicados
  for(int i = 0; i < numNodos; i++){
    String numero = nfs(i, 0); // transforme 'i' en un string con cero decimal  
    nodos[i] = new Nodo(m+random(width-(2*m)), m+random(height-(2*m)), numero);
  }
}

void draw(){
  background(255);
  texto();
  
  noFill();
  strokeWeight(3);
  stroke(0);
  
  beginShape();
  
  //vertex(nodos[0].x, nodos[0].y); // el punto ancla inicial
  
  for (int i = 0; i < numNodos; i++){
    curveVertex(nodos[i].x, nodos[i].y);
  }
  endShape();


  for(int i = 0; i < numNodos; i++){
    nodos[i].render();
  }
}

void texto(){
  fill(0);
  text("curveVertex", width/2, 20); 
  String t = "presione 'a' para aumentar nodos, 'z' para disminuir número de nodos y ESPACIO para ocultarlos";
  text(t, width/2, height-25);
  fill(#FF7040);
  text(numNodos +" nodos"  , width/2, height-10);
}


void keyPressed(){
  
  if (key == 'a'){
    numNodos ++;
    setup();
  }
  
  if (key == 'z' && numNodos > 2){
    numNodos --;
    setup();
  }
  
  if (key == ' '){
    vis = !vis;
  }
}

