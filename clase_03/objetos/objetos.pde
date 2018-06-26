int numPelotas = 100;

Pelota[] pel;
String t;


void setup() {
  pel = new Pelota[numPelotas];
  size(700, 700);
  for (int i = 0; i < numPelotas; i++) {
    pel[i] = new Pelota();
  }

  int especial = 99; //int(random(numPelotas));

  pel[especial].col = color(0);
  pel[especial].diam = 300;
  pel[especial].x = random(pel[especial].diam/2, width - pel[especial].diam/2);
  pel[especial].y = random(pel[especial].diam/2, height - pel[especial].diam/2);
}

void draw() {
  background(255);
  for (int i = 0; i < numPelotas; i++) {
    pel[i].existe();
  }
}


class Pelota {

  float x, y;   // posición
  float vx, vy; // desplazamiento
  float diam;   // diámetro
  color col;
  int edad, edadMax;
  // constructor
  Pelota() {

    diam = random(10, 40);
    x = random(diam/2, width - diam/2);
    y = random(diam/2, height - diam/2);
    vx = random(-2, 2);
    vy = random(-2, 2);
    col = color(200, 0, 0, 200);
    edad = 0;
    edadMax = round(random(50, 500));
  }

  void existe() {
    if (edad < edadMax) {
      actualiza();
    };
    choca();
    dibuja();
    edad ++;
  }

  void actualiza() {
    // actualiza la posición x,y con la velocidad x,y
    x += vx;
    y += vy;
  }

  void choca() {
    if (x < diam/2 || x > (width - diam/2)) {
      vx *= -1;
    }

    if (y < diam/2 || y > (height - diam/2)) {
      vy *= -1;
    }
  }

  void dibuja() {
    fill(col);
    if (edad > edadMax) {
      col = color(0);
    }
    ellipse(x, y, diam, diam);
  }
}

void keyPressed() {
  setup();
}
