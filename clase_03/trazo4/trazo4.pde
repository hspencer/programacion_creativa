/**
 * 
 * <strong>Trazos 2 (Pollock)</strong><br />
 * Herbert Spencer, 2008<br />
 * <br />
 * <pre>
 * 'i' : trazos blancos
 * 'k' : trazos negros
 * ' ' : fondo balnco
 * 'r' : reset
 * </pre>
 */

Trazo[] t; // hay un arreglo de trazos 't' 

boolean todos = false;


float FERTILIDAD = 0.015; //quÔøΩ probabilidades tiene un trazo de reproducirse
int click; // contador de trazos
int TOTAL = 600; // trazos mÔøΩximos posibles
float maxVel = 5;

void setup(){ 
  t = new Trazo[TOTAL]; //contruye el arreglo
  size(800, 600);
  background(0);
  click = 0; //counter reset
  ColorPal = loadImage("van_gogh_church.jpg");
  smooth();
}


void draw(){

  if(todos){
    for(int i = 0; i < TOTAL-1; i++){
      if(t[i].fertil) t[i].trace(); // trace todos los 'i' trazos
    }
  }

  else{
    for(int i = 0; i < click; i++){
      if(t[i].fertil) t[i].trace(); // trace todos los 'i' trazos
    }

  }
}

void mousePressed(){
  t[click] = new Trazo(pmouseX, pmouseY, mouseX, mouseY, 3, buenColor());
  click ++;
}



void keyPressed(){
  if(key == ' '){
    background(0);
  }
  if(key == 'i'){
    for(int i = 0; i < click; i++){
      t[i].col = color(255, 150);
    }
  }
  if(key == 'k'){
    for(int i = 0; i < click; i++){
      t[i].col = color(0, 150);
    }
  }
  if(key == 'r'){
    setup(); //inicialize el programa
  }
  if(key == 'q'){
    exit();
  }
}

