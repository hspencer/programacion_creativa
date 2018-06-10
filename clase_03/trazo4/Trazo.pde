//--------------clase-trazo-------------------

class Trazo{

  float x, y; // posición
  float velX, velY; // velocidad
  float grosor;
  color col;
  float R,G,B,A;
  float rnd;
  boolean fertil;

  // esta es la función constructora del objeto
  Trazo(float px, float py, float ax, float ay, float g, color c){
    // que define y asigna las variables
    x = ax;
    y = ay;
    velX = ax - px;
    velY = ay - py;
    grosor = g;
    col = c;
    R = red(col);
    G = green(col);
    B = blue(col);
    rnd = random(0, 0.5);
    fertil = true;
    if(grosor < 0.1) fertil = false;
  }

  // una función que engloba las demás
  void trace(){
    dibuje(); 
    actualiceDatos(); // haga que la línea avance y se curve
    rebote(); // en los bordes de la pantalla
    hagaTrazo(); // haga nuevos brotes si las probabilidades lo permiten
  }

  void dibuje(){
    stroke(col);
    strokeWeight(grosor);
    line(x,y, x+velX, y+velY);
  }

  void actualiceDatos(){
    x += velX;
    y += velY;
    //añadir un poco de ruido
    velX += random(-rnd, rnd);
    velY += random(-rnd, rnd);
    grosor *= 0.999;
    A = map(grosor, 0.1, 2.99, 5, 255);
    col = color(R,G,B,A);
  }

  void rebote(){
    if(x < 0 || x > width) { 
      velX *= -1;
    }
    if(y < 0 || y > height) {
      velY *= -1;
    }

    if(abs(velX) > maxVel) velX *= 0.888;
    if(abs(velY) > maxVel) velY *= 0.888;
  }

  void hagaTrazo(){
    float num = random(0,1);
    if(num < FERTILIDAD && click < TOTAL){
      float newR = red(col) + 7;
      float newG = green(col) + 11;
      float newB = blue(col) + 14;
      color newCol = color(R,G,B);
      t[click] = new Trazo(x-rnd, y-rnd, x, y, grosor * 0.9, newCol);
      click ++;
      if(click == TOTAL - 1) {
        click = 0;
        todos = true;
      }
    }
  }
}

