void trazo(float x, float y, color c, float spacer) {
  colorMode(HSB);
  
  float h = hue(c);
  float s = saturation(c);
  float b = brightness(c);
  
  color n = color(h, s + 10, b);
  
  float grosor = map(b, 0, 255, 3, 0);
  
  cruz(x+random(-spacer/2, spacer/2) , y+random(-spacer/2, spacer/2), n, grosor);
  
}


void cruz(float x, float y, color c, float grosor) {
  float t = 6; // tamaño de la cruz
  pushMatrix();
  translate(x, y);
  stroke(c);
  strokeWeight(grosor);
  
  line(-t/2, 0, t/2, 0);
  line(0, -t/2, 0, t/2);
  
  popMatrix();
}

