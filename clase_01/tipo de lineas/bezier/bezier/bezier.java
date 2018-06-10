import processing.core.*; import java.applet.*; import java.awt.*; import java.awt.image.*; import java.awt.event.*; import java.io.*; import java.net.*; import java.text.*; import java.util.*; import java.util.zip.*; public class bezier extends PApplet {int numNodos = 4;
int vertices;
boolean vis = true;
Nodo[] nodos;
PFont pixel;
float m = 100.0f;
public void setup(){
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
    float num = PApplet.parseFloat(i)/3.0f; // esto es para ver si i es m\u00faltiplo de tres
    if ((i/3) == num){
     nodos[i].col = 0xffFF7040; // si es m\u00faltiplo de 3 significa que ser\u00e1 un v\u00e9rtice, as\u00ed que as\u00edgnele otro color
     vertices += 1; // cuente los v\u00e9rtices;  
    } 
  }
}

public void draw(){
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

  // haga las l\u00edneas de control
  if(vis){
    strokeWeight(0.5f);
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

public void texto(){
  fill(0);
  text("Bezier", width/2, 20); 
  String t = "presione 'a' para aumentar nodos, 'z' para disminuir n\u00famero de nodos y ESPACIO para ocultarlos";
  text(t, width/2, height-25);
 fill(0xffFF7040);
 text(vertices +" nodos y "+(numNodos-vertices)+ " puntos de control"  , width/2, height-10);
}

public void keyPressed(){
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

class Nodo{
  float x, y;
  float d = 19.0f;
  String num;
  boolean over;
  int col;

  Nodo(float _x, float _y, String _num){
    x = _x;
    y = _y;
    num = _num;
    over = false;
    col = 0xffD3FF95;
  }

  public void update(){
    float dis = dist(mouseX, mouseY, x, y);
    if (dis <= d/2){
      over = true;
    }else{
      over = false;
    }
   }

  public void draw(){
    if (over) {
      strokeWeight(3);
      stroke(0);
    }
    else{
      stroke(100);
      strokeWeight(1);
    }
    fill(col);
    ellipse(x,y, d, d);
    fill(0);
    text(num, x, y+4);
  }
  
  public void render(){
    update();
    if(vis){
    draw();
    }
  }
}

public void mouseReleased(){
  for(int i = 0; i < numNodos; i++){
    nodos[i].over = false;
  }
}

public void mouseDragged(){
  for(int i = 0; i < numNodos; i++){
    if (nodos[i].over == true){
      nodos[i].x = mouseX;
      nodos[i].y = mouseY;
        for(int j = 0; j < numNodos; j++){
          if (j != i){
          nodos[j].over = false;
          }
        }
      }
    }
}


  static public void main(String args[]) {     PApplet.main(new String[] { "bezier" });  }}