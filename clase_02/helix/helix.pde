/*
 Helix
 por Herbert Spencer
 e[ad] Escuela de Arquitectura y Diseño
 
 en este ejemplo las rotaciones son acumulativas usando arreglos
 */

float margen = 75;  // margen del dibujo
float esp;          // espaciador
int numSide = 20;   // total de hélices por lado
float[] giro;       // nuevo arreglo para almacenar las rotaciones
int counter = 0;    // contador para recorrer el arreglo de giros


void setup() {
  size(700, 700);

  /* calcular cuantas hélices existen.
   Como esta variable es un int, los números están cuidadosamente asignados
   para que el resultado no tenga parte decimal */

  esp = (width - (2*margen)) / float(numSide - 1);
  giro = new float[numSide * numSide];
  fill(0);
  stroke(0);
}

void draw() {
  background(255);
  for (float y = margen; y <= height-margen; y += esp) {
    for (float x = margen; x <= width-margen; x += esp) {
      helix(x, y, counter);
      counter++;
    }
  }
  counter = 0;
}

void helix(float _x, float _y, int index) {

  // calcula la distancia ente el mouse y las coordenadas de entrada
  float d = dist(mouseX, mouseY, _x, _y); 

  pushMatrix();
  { // resetea el sistema de coordenadas
    translate(_x, _y);

    /* la rotación de cada hélice se incrementa en una
     cantidad proporcional a la distancia 'd' (entre su posición y el mouse)
     acumulando diferencias entre cada una de ellas */

    giro[index] += pow(10, -d/500);
    rotate(giro[index]);

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

void keyPressed() {
  saveFrame("dp/helix####.png");
}
