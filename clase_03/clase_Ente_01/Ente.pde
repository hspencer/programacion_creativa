
class Ente {

  float x, y;     // posición
  float vx, vy;   // velocidad
  color col;      // su color

  /* el constructor sin atributos de posición */
  Ente() {
    x = random(width);
    y = random(height); 
    col = color(random(255), random(255), random(200, 255));
    vx = random(-3, 3);
    vy = random(-3, 3);
  }
  
  /* el constructor con posción explícita */
    Ente(float _x, float _y) {
    x = _x; // podría ser también this.x = x;
    y = _y; 
    col = color(random(255), random(255), random(200, 255));

    vx = random(-3, 3);
    vy = random(-3, 3);
  }

  void paint() {
    noStroke();
    fill(col, 150);
    ellipse(x, y, 20, 20);
  }

  void move() {
    x += vx;
    y += vy;
    
    /*
    vx *= 0.998;
    vy *= 1.013;
    */
    
    if (x < 0 || x > width) {
      vx *= -1;
    }
    if (y < 0 || y > height) {
      vy *= -1;
    }
  }
}
