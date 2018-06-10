void keyPressed(){
  if (key == 'a'){
    px++;
  }
  if (key == 'z'){
    px--;
  }
  if (key == 's'){
    py++;
  }
  if (key == 'x'){
    py--;
  }
  if (key == 'd'){
    px+=0.01;
  }
  if (key == 'c'){
    px-=0.01;
  }
  if (key == 'f'){
    py+=0.01;
  }
  if (key == 'v'){
    py-=0.01;
  }
  if (key == 'g'){
    rx++;
  }
  if (key == 'b'){
    rx--;
  }
  if (key == 'h'){
    ry++;
  }
  if (key == 'n'){
    ry--;
  }
    if (key == 'e'){
    dibujaEstela = !dibujaEstela;
  }
  if (key == ' '){
    defineVariables(); // reset
  }
  //borraCola();
}
