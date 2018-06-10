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
    float num = float(i)/3.0; // esto es para ver si i es mœltiplo de tres
    if ((i/3) == num){
     nodos[i].col = #FF7040; // si es mœltiplo de 3 significa que ser‡ un vŽrtice, as’ que as’gnele otro color
     vertices += 1; // cuente los vŽrtices;  
    } 
  }
}

void draw(){
  background(255);
  texto();
  // dibuje la curva bezier por todos los nodos.... de 3 en 3.
  noFill();
  strokeWeight(3);
  stroke(0);
  beginShape();
  vertex(nodos[0].x, nodos[0].y); // el punto ancla inicial
  for (int i = 1; i < (numNodos - 2); i+=3){
    bezierVertex(nodos[i].x, nodos[i].y, nodos[i+1].x, nodos[i+1].y, nodos[i+2].x, nodos[i+2].y);
  }
  endShape();

  // haga las l’neas de control
  if(vis){
    strokeWeight(0.5);
    stroke(100);
    for (int i = 1; i < (numNodos - 2); i+=3){
      line(nodos[i-1].x, nodos[i-1].y, nodos[i].x, nodos[i].y);
      line(nodos[i+1].x, nodos[i+1].y, nodos[i+2].x, nodos[i+2].y);
    }
  }

  for(int i = 0; i < numNodos; i++){
    String numero = nfs(i, 1);
    nodos[i].render();
  }
}

void texto(){
  fill(0);
  text("Bezier", width/2, 20); 
  String t = "presione 'a' para aumentar nodos, 'z' para disminuir nœmero de nodos y ESPACIO para ocultarlos";
  text(t, width/2, height-25);
 fill(#FF7040);
 text(vertices +" nodos y "+(numNodos-vertices)+ " puntos de control"  , width/2, height-10);
}

void keyPressed(){
  if (key == 'a'){
    numNodos += 3;
    setup();
  }
  if (key == 'z'){
    numNodos -= 3;
    setup();
  }
  if (key == ' '){
    vis = !vis;
  }
}
