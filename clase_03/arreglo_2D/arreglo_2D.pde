
int numPuntos = 10000;
float[][] cord = new float[numPuntos][2]; // coordenadas
float[] coso;
float margen = 100;

void setup() {
  size(500, 500);
  for (int i = 0; i < numPuntos; i++) {
    cord[i][0] = random(margen, width - margen);
    cord[i][1] = random(margen, height - margen);
  }
  strokeWeight(.25);
}

void draw() {
  for (int i = 0; i < numPuntos; i++) {
    point(cord[i][0], cord[i][1]);
    cord[i][1] += 1;
    if (cord[i][1] > height) {
      cord[i][1] = 0;
      cord[i][0] = random(width);
    }
  }
}
