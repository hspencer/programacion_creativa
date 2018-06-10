import processing.pdf.*; // importar la librería de PDF

PImage foto;   // declaro foto (objeto PImage)
PFont font;    // declaro font (objeto PFont)
String[] code; // declaro un arreglo[] de texto

// los márgenes 
float margenIzquierda = 120;
float margenArriba  = 50;    
float margenDerecha = 120;
float margenAbajo   = 100;   
float escala;

void setup() {
  size(545, 779, PDF, "tarea4.pdf");
 
  // construyo los objetos
  foto = loadImage("paisaje.jpg");
  font = createFont("Courier", 8); // monoespaciada
  code = loadStrings("trazo.pde");

  // definiciones plásticas
  textFont(font, 8);
  //colorMode(HSB, 255);
  strokeCap(SQUARE);

  float ancho = width - (margenIzquierda + margenDerecha);
  escala = ancho/(float)foto.width;
  background(255); 
}

void draw() {
  float spacer = 20;

  // el muestreo
  for (int y = 0; y < foto.height; y += spacer) {
    for (int x = 0; x < foto.width; x += spacer) {

      color c = foto.get(x, y);
      
      // mapeo de coordenadas a la hoja de papel
      float plotX = map(x, 0, foto.width, margenIzquierda, width-margenDerecha);
      float plotY = map(y, 0, foto.height, margenArriba, margenArriba + (foto.height * escala));
      
      trazo(plotX, plotY, c, spacer);
    }
  }
  printCode();
  println("----> OK! PDF done");
  exit();
}

void printCode() {
  fill(0);
  float interlinea = 0;
  for (int i = 0; i < code.length; i++) {
    // escribo cada línea de código en la pantalla
    text(code[i], width/5, 1.5 * margenArriba + foto.height * escala + interlinea);
    interlinea += 11;
  }
}

