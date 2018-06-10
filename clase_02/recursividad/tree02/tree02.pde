
void setup() {
  size(700, 500);
  smooth();
  background(255);
}


void drawTree(float x, float y, float big, int levels, boolean tronco) {
  pushMatrix();

  {
    translate(x, y);
    if (!tronco) {
      rotate(random(-.5, .5));
    }
    tronco = false;
    
    strokeWeight(big * 0.1);
    line(0, 0, 0, -big/2);            // tronco

    float altIzq = -big * random (.9, 1.9);
    float altDer = -big * random (.9, 1.9);

    strokeWeight(big * 0.09);
    line(0, -big/2, -big/2, altIzq);  // brazo izquierdo
    line(0, -big/2, big/2, altDer);   // brazo derecho

    // recursividad
    if (levels > 0) {
      drawTree(-big/2, altIzq, big * random(.5, 1), levels - 1, false); // Y izquierda
      drawTree( big/2, altDer, big * random(.5, 1), levels - 1, false);  // Y derecha
    }
  }
  popMatrix();
}

void draw() {
}

void mouseReleased() {
  stroke(random(100), random(0, 20), random(80, 90), random(200, 255));
  drawTree(mouseX, mouseY, pow(mouseY, 1.7)*0.002, round(random(6, 15)), true);
}

void keyPressed(){
 background(255); 
}
