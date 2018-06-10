// Lissajous
// H. Spencer - 2007
//
// 'a' - 'z' controlan período en X
// 's' - 'x' controlan período en Y

void setup() {
  defineVariables();
  size(800, 800);
  font = loadFont("font.vlw");
  pixel = loadFont("pixel.vlw");
  tit = loadFont("tit.vlw");
  smooth();
  ellipseMode(CENTER);
  rectMode(CENTER);
  frameRate(30);
}

void draw() {
  theta += inc; // incremento negativo constante del ángulo

  // identidad circular
  x = cos(theta*py)*rx;
  y = sin(theta*px)*ry;

  background(0);
  grilla(cx, cy, rx, ry); // dibuja la grilla
  grilla(cx, cy-2*ry, rx, ry);
  grilla(cx + 2*rx, cy, rx, ry);
  punto(cx, cy);

  seno(cx+rx, cy);    // dibuja la proyecciÛn del seno en y
  coseno(cx, cy - ry); // dibuja la proyecciÛn del coseno en x
  lissajous(cx, cy);
  dibujaEjes();

  fill(tinte);
  textFont(font, 16);
  text("x = cos(at)r, y = sin(bt)r\na:b = "+px+":"+py, 2.6*rx, cx);
  textFont(pixel, 8);
  fill(tinte, 150);
  text("las teclas 'a' y 'z' modifican 'a'\n y 's' y 'x' modifican el valor de 'b'", 2.6*rx, 1.3*cx);
  textFont(tit, 48);
  text("Lissajous", 2.6*rx, cx*0.6);
}

