/**
*     Persecusión de Puntos
*     (introduccón a los arreglos, Imagen Escrita, Abril 2012)
*     e[ad] Escuela de Arquitectura y Diseño PUCV
*
*/

float[][] coords;   // arreglo bidimensional de coordenadas x e y
int numDots = 222;  // numero de puntos
float c = 0.01;     // constante de "suavizado" (ver abajo c´mo se utiliza)

void setup() {
  size(700, 700);

  coords = new float[numDots][2]; // inicializo el arrelgo


  for (int i = 0; i < numDots; i++) {
    // recorro el arreglo y asigno valores aleatorios
    coords[i][0] = random(width);   // [i][0] para los valores en x
    coords[i][1] = random(height);  // [i][1] para los valores en 7
  }
  smooth();
  background(255);
}

void draw() {


  for (int i = 0; i < numDots; i++) {
    // para cada uno de los puntos (o valores del arreglo)...

    // defino al siguiente que es el actual (i)+1
    // este valor es modulado (%) por el total de puntos para no salirme del arreglo
    int next = (i + 1) % numDots; 

    // calculo la diferencia en x e y entre el actual y el siguiente
    // y almaceno esos valores en difx, dify
    float difx = coords[i][0] - coords[next][0];
    float dify = coords[i][1] - coords[next][1];

    // ahora deino unas nuevas coordenadas que son:
    // las coordenadas actuales menos la diferencia ponderada por la constante c
    float nx = coords[i][0] -= difx * c;
    float ny = coords[i][1] -= dify * c;

    // dibujo un trazo entre la ubicaci´n actual y la siguiente
    stroke(0, 20);
    line(coords[i][0], coords[i][1], nx, ny);
  }
}

void keyPressed() {
  // si presiono 'r' hago un 'reset'
  if (key == 'r') {
    setup();
  }
  if (key == ' ') {
    // si preciono ESPACIO pongo un velo blanco sobre el dibujo
    noStroke();
    fill(255, 160);
    rect(0, 0, width, height);
    stroke(0, 60);
  }
}

