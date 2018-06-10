/*
 Helix
 por Herbert Spencer
 e[ad] Escuela de Arquitectura y Diseño
 
 en este ejemplo las rotaciones son acumulativas usando arreglos
 */

int margen = 20;  // margen del dibujo
int esp = 15;     // espaciador
int numElements;  // total de hélices
float[] punto;    // nuevo arreglo para almacenar las rotaciones
int counter = 0;  // contador para recorrer el arreglo de puntos


void setup(){
  size(700, 700);
  
  /* calcular cuantas hélices existen.
  Como esta variable es un int, los números están cuidadosamente asignados
  para que el resultado no tenga parte decimal */
  
  numElements = 1;
  // println(numElements); /* para saber el número de elementos */
    for (int y = margen; y < height-margen; y += esp){
    for (int x = margen; x < width-margen; x += esp){
numElements++;
    }
  }
  // inicializar el arreglo de floats "puntos"
  punto = new float[numElements];
  fill(0);
  stroke(0);
  smooth();
}

void draw(){
  background(255);
  for (int y = margen; y < height-margen; y += esp){
    for (int x = margen; x < width-margen; x += esp){
      helix(x, y, counter);
      counter++;
    }
  }
  counter = 0;
}

void helix(int _x, int _y, int rot){
  
  // calcula la distancia ente el mouse y las coordenadas de entrada
  float d = dist(mouseX, mouseY, _x, _y); 
  
  pushMatrix();
  { // resetea el sistema de coordenadas
    translate(_x , _y);
    
    /* la rotación de cada hélice se incrementa en una
    cantidad proporcional a la distancia 'd' (entre su posición y el mouse)
    acumulando diferencias entre cada una de ellas */
    
    punto[rot] += d/500;
    rotate(punto[rot]);
    
    // el eje
    stroke(0);
    line(-esp/3, 0, esp/3, 0); 
    
    // las aspas
    noStroke();
    ellipse(-esp/3, 0, 2, 4);
    ellipse(esp/3, 0, 2, 4);
  }
  popMatrix();
}

void keyPressed(){
 saveFrame("dp/helix####.png"); 
}

