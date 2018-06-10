
int[] g;
PImage monalisa;
PGraphics otraTela;
PImage veloSobreMonalisa;

int nPoints = 1000;

void setup(){
  size(300, 300);
  noStroke();
  otraTela = createGraphics(width, height);
  monalisa = loadImage("monalisa.png");
  veloSobreMonalisa = loadImage("madera.png");
}

void draw(){
  actualizarMascara();
  image(monalisa, 0, 0);
  image(veloSobreMonalisa, 0, 0);
}


void actualizarMascara(){
  float diam = (sin(millis()/2000.0)/2 + 0.5) * 200;
  otraTela.beginDraw(); // necesarios para declarar el comienzo del dibujo en la otra tela
  otraTela.background(255);
  otraTela.fill(0);
  otraTela.ellipse(width/2, height/2, diam, diam);
  otraTela.filter(BLUR, 5);
  otraTela.endDraw(); // necesarios para declarar el fin del dibujo en la otra tela
  veloSobreMonalisa.mask(otraTela);
}

void keyPressed(){
  background(otraTela);
}
