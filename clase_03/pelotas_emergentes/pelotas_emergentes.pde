/**
 * <strong>Pelotas Emergentes</strong><br />
 * Modificación del código: <a href="http://processing.org/learning/topics/bouncybubbles.html">http://processing.org/learning/topics/bouncybubbles.html</a><br />
 * En cada choque de 2 pelotas nace una tercera que se agrega al arreglo de pelotas<br />
 * presione ESPACIO para prender y apagar la visualizaci&oacute;n de choques
 */

float spring = 0.09;        // resorticidad del sistema
float gravity = 0.08;       // gravedad del sistema
Ball[] balls;
int count, temp;            // 'count' cuenta las pelotas y 'temp' se usa para los ciclos for, es una copia temporal de count
                            // ocurre que cada vez que 2 pelotas chocan, count++
                            // si se usa 'count' en el ciclo 'for' que calcula colisiones
                            // el programa se cuelga porque la cota superior ( i < count) no se cumplirÔøΩa nunca.
int TOTAL = 400;

boolean drawLines = false;  // dibujar lines de colisiones, se manipula con ESPACIO


void setup() {
  colorMode(HSB);
  balls = new Ball[TOTAL];
  count = temp = 0;
  //size(510, 255);
  fullScreen();
  noStroke();
}

void draw() {
  background(0);
  for (int i = 0; i < temp; i++) {
    balls[i].collide();
    balls[i].move();
    balls[i].display();  
  }
  temp = count;
}

void mousePressed(){
}


void mouseReleased(){
  if(count < (TOTAL-1)){
    balls[count] = new Ball(mouseX, mouseY, count);
    count ++;
  }
}

void keyPressed(){
  if(key == 'r' || key =='R'){
    setup();
  }
  if(key == ' '){
    drawLines = !drawLines;
  }
  if(key == 'q'){
    exit();
  }
}
