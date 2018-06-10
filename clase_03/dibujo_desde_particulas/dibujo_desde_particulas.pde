
Polar merodeador;
ArrayList polys;
ArrayList polares;
PImage scr;
float margen = 200;

void setup(){
  size(1280, 700, OPENGL); 
  polys = new ArrayList();
  polares = new ArrayList();
  smooth();
  stroke(0, 20);
  merodeador = new Polar(width/2, height/2);
  merodeador.rad = 3;
  merodeador.free = true;
  background(255);
  cursor(CROSS);
}

void draw(){
  merodeador.calc();
  merodeador.warp();
  /*
  scr = get();
   scr.filter(BLUR, .5);
   background(scr);
   */
  for(int i = 0; i < polys.size(); i++){
    Poly p = (Poly)polys.get(i);
    p.draw(); 
  }

  for(int i = 0; i < polares.size(); i++){
    Polar p = (Polar)polares.get(i);
    p.calc();
    point(p.x, p.y);
  }
}

void mouseDragged(){
  Polar nuevo, viejo;
  float d = 21;
  if(polares.size() > 0){
    viejo = (Polar)polares.get(polares.size()-1);
    d = dist(mouseX, mouseY, viejo.x, viejo.y);
  }

  if(mouseButton == LEFT && d > 20){
    nuevo = new Polar(mouseX, mouseY);
    polares.add(nuevo);
  } 
}

void mousePressed(){
  if(mouseButton == RIGHT){
    for(int i = 0; i < polys.size(); i++){
      Poly poly = (Poly)polys.get(i);
      for(int j = 0; j < poly.p.length; j++){
        poly.p[j].follow(mouseX, mouseY);
      } 
    }
  }
}

void keyPressed(){
  if(polares.size() > 2 && key ==' '){
    int len = polares.size();
    Polar[] polis = new Polar[len];
    polares.toArray(polis);
    Poly poligono = new Poly(polis);
    polys.add(poligono);
    polares.clear();
  }

  if(key == 'x'){
    for(int i = 0; i < polys.size(); i++){
      Poly poly = (Poly)polys.get(i);
      for(int j = 0; j < poly.p.length; j++){
        poly.p[j].free = !poly.p[j].free;

      } 
    }
  }

  if(key == 'm'){
    for(int i = 0; i < polys.size(); i++){
      Poly poly = (Poly)polys.get(i);
      for(int j = 0; j < poly.p.length; j++){
        poly.p[j].merodea = !poly.p[j].merodea;
      } 
    }
  }
  if(key == 'z'){
    for(int i = 0; i < polys.size(); i++){
      Poly poly = (Poly)polys.get(i);
      for(int j = 0; j < poly.p.length; j++){
        poly.p[j].origin();
      } 
    }
  }

  if(key == 'c'){
    for(int i = 0; i < polys.size(); i++){
      Poly poly = (Poly)polys.get(i);
      poly.collapse();
    }
  }

  if(key == 'q'){
    polys.clear();
    polares.clear();
    background(255);
  }

  if(key == 's'){
    saveFrame("dg#######.png");
  }
}
