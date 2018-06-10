/*

 Diseño Eduardo Joselevich y Fanny Fingerman de 1965,
 visto en el MAMBA, Buenos Aires, noviembre de 2014
 
 imagen de referencia:
 http://verrev.files.wordpress.com/2013/10/eduardo-joselevich-y-fanny-fingelman.jpg
 
 */

import processing.video.*;

Capture cam;
color negro = color(3);
color blanco = color(255);
float sq = 20;

// umbrales de gris
float[] rango = {
  64, 128, 192
};

void setup() {
  size(640, 420);
  rectMode(CENTER);
  ellipseMode(CENTER);
  stroke(255, 10);
  cam = new Capture(this, 320, 240);
  cam.start();
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  trama();
}

void trama() {
  for (float y = sq/2; y < height; y += sq) {
    for (float x = sq/2; x < width; x += sq) {

      // la proporción de las coordenadas respecto al espacio total
      float xfactor = float(width)/x;
      float yfactor = float(height)/y;
      
      // conversión al espacio y escala de la cámara
      float xget = cam.width * xfactor;
      float yget = cam.height * yfactor;
      
      // obtener el pixel de la cámara y su brillo
      color c = cam.get(round(x/2), round(y/2));
      float brillo = brightness(c);
      
      // construir el punto de la trama
      punto(brillo, x, y);
    }
  }
}

void punto(float brillo, float x, float y) {
  
  // negro
  if (brillo < rango[0]) {
    fill(negro);
    rect(x, y, sq, sq);
  }
  
  // gris oscuro
  if (brillo >= rango[0] && brillo < rango[1]) {
    fill(negro);
    rect(x, y, sq, sq);
    fill(blanco);
    ellipse(x, y, sq*.5, sq*.5);
  }
  
  // gris claro
  if (brillo >= rango[1] && brillo < rango[2]) {
    fill(blanco);
    rect(x, y, sq, sq);
    fill(negro);
    ellipse(x, y, sq*.5, sq*.5);
  }
  
  // blanco
  if (brillo >= rango[2]) {
    fill(blanco);
    rect(x, y, sq, sq);
  }
}

void keyPressed() {
  if (key == 'a') {
    sq ++;
  } 
  if (key == 'z') {
    sq --;
  } 
  if (key == ' ') {
    String filename = "img/"+year()+month()+day()+hour()+minute()+second()+".png";
    saveFrame(filename);
  }
}

