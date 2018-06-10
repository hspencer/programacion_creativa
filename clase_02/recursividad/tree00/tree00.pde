
void setup() {
  size(700, 500);
  smooth();
  background(255);
}


void drawY(float x, float y, float big) {

  pushMatrix();
  {
    translate(x, y);               // redefino el origen
    line(0, 0, 0, -big/2);         // tronco
    line(0, -big/2, -big/2, -big); // brazo izquierdo
    line(0, -big/2, big/2, -big);  // brazo derecho
  }
  popMatrix();
}

void draw() {                      // debo dejar la función "draw"
                                   // para que corra el motor
}

void mouseReleased() {
  drawY(mouseX, mouseY, random(5, 30));
}

