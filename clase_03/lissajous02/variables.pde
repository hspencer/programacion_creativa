// variables
int w, h;
float cx, cy; // centrox, centroy
float px, py; // perÌodos de onda 'x' e 'y'
int largoEstela; 
float x, y, r, rot, theta, rx, ry, lx, ly, inc;
PFont font, pixel, tit; // fuentes
color tinte, tinteOscuro; //colores
float[][] estela;// puntos de la estela
boolean dibujaEstela;
void defineVariables(){
  w = 800;
  h = 800;
  //r = float(w)/5;
  rx = float(w)/5;
  ry = float(w)/5;
  cx = 1.5*rx;
  cy = h - cx;
  theta = 0;
  px = 1;
  py = 1;
  lx = 0;
  ly = 0;
  inc = 0.01;
  tinte = #EEFFC4;
  tinteOscuro = #8D9577;
  largoEstela = 80;
  dibujaEstela = true;
  estela = new float[largoEstela][2];
  for(int i = 0; i < largoEstela; i++){
  estela[i][0] = r;
  estela[i][1] = 0;
  }
}

