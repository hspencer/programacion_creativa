void setup(){
  
}

  void draw() {
  background(204);
  translate(width/2, height/2);
  float a = atan2(mouseY-height/2, mouseX-width/2);
  rotate(a);
  fill(255);
  rect(-30, -5, 60, 10);
  fill(0);
  rect(30, -5, 10, 10);
}
