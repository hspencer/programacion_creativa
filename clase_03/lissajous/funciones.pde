void grilla(float xpos, float ypos, float rx, float ry){
  pushMatrix();
  translate(xpos,ypos);
  noFill();
  stroke(tinteOscuro,100);
  strokeWeight(1);
  rect(0,0, 2*rx, 2*ry);
  line(-1.1*rx,0, 1.1*rx, 0);
  line(0, -1.1*ry, 0, 1.1*ry);
  stroke(tinteOscuro,20);
  for (int i = int(-ry); i < ry; i += int(ry/10)){
    line(-rx, i, rx, i);
  }
  popMatrix();
}

void punto(float xpos, float ypos){
  pushMatrix();
  translate(xpos, ypos);
  noFill();
  stroke(tinte);
  line(0,0, x,y);
  fill(tinte);
  ellipse (x, y, rx/30, rx/30);// dibuja el punto que se mueve

  // la estela:
  // primero hay que mover todos los valores del [] a la izquierda
  for(int i = 1; i < largoEstela; i++){
    estela[i-1][0] = estela[i][0];
    estela[i-1][1] = estela[i][1];
  }
  //hay que poner un valor nuevo al final del []
  estela[largoEstela-1][0] = x;
  estela[largoEstela-1][1] = y;

  //dibujar la estela:
  if(dibujaEstela){
    for(int i = 1; i < largoEstela; i++){
      stroke(tinte, float(i)/largoEstela * 255);
      strokeWeight(3);
      line(estela[i-1][0],estela[i-1][1],estela[i][0],estela[i][1]);  
    }
  }
  popMatrix();
  strokeWeight(1);
}

void seno(float xpos, float ypos){
  stroke(tinte, 170);
  pushMatrix();
  translate(xpos,ypos);
  stroke(tinte);
  noFill();
  beginShape();
  for (float i = 0; i < 2*rx; i++){
    y = sin(theta*px+(i/(ry/PI)))*ry;
    vertex(i , y);
  }
  endShape();
  popMatrix();
}

void coseno(float xpos, float ypos){
  stroke(tinte, 170);
  pushMatrix();
  translate(xpos,ypos);
  stroke(tinte);
  noFill();
  beginShape();
  for (float i = 0; i < 2*ry; i++){
    x = cos(theta*py+(i/(rx/PI)))*rx;
    vertex(x , i - 2*ry);
  }
  endShape();
  popMatrix();
}

void lissajous(float xpos, float ypos){
  pushMatrix();
  translate(xpos, ypos);
  beginShape();
  for(float i = 0; i < TWO_PI; i+=TWO_PI/1000){
    lx = rx * cos(py*i);
    ly = ry * sin(px*i);
    stroke(tinte,130);
    vertex(lx,ly);
  }
  endShape();
  popMatrix();
}

void dibujaEjes(){
  pushMatrix();
  translate(cx,cy);
  line(x,y, rx, y);
  line(x,y, x, -ry);
  popMatrix();
}

/*
void borraCola(){
 for(int i = 0; i < largoEstela; i++){
 estela[i][0] = x;
 estela[i][1] = y;
 }
 }
 *//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

