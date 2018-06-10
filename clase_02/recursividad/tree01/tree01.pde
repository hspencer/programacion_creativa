
void setup() {
  size(700, 500);
  smooth();
  background(255);
}


void drawTree(float x, float y, float big, int levels) {
  pushMatrix();

  {
    translate(x, y);

    line(0, 0, 0, -big/2);         // tronco
    line(0, -big/2, -big/2, -big); // brazo izquierdo
    line(0, -big/2, big/2, -big);  // brazo derecho

    // recursividad
    if (levels > 0) {
      drawTree(-big/2, -big, big*.5, levels - 1);  // Y izquierda
      drawTree( big/2, -big, big*.5, levels - 1);  // Y derecha
    }
  }
  popMatrix();
}

void draw() {
}

void mouseReleased() {
  drawTree(mouseX, mouseY, 100, 8);
}


