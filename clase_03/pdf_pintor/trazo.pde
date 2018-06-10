void trazo(float x, float y, color c, float spacer) {

  float h = hue(c);
  float s = saturation(c);
  float b = brightness(c);

  int numStrokes = round(map(b, 0, 255, 20, 0));
  float strokeRotation = map(h, 0, 255, 0, -HALF_PI);
  float strokeLenght = map(b, 0, 255, spacer*2, spacer/2);
  
  color n = color(h, s + 10, b);
  stroke(n);
  noFill();
  strokeWeight(.25);
  
  pushMatrix();
  {
    translate(x, y);
    rotate(strokeRotation);
    for(int i = 0; i < numStrokes; i++){
     
     float nX = random(-spacer/3, spacer/3); 
     float nY = random(-spacer/3, spacer/3); 
     
     beginShape();
     vertex(-spacer + nX, 0 + nY);
     vertex(-spacer + nX, 0 + nY);
     vertex(nX, nY - s);
     vertex(spacer + nX, nY);
     vertex(spacer + nX, nY);
     endShape();
    }
  }
  popMatrix();
}
