void setup() {
  //fullScreen();
  size(800, 500);
  background(#FAECBD);
  stroke(#403202, 150);
}

void draw() {
  if (mousePressed) {
    float vel = dist(mouseX, mouseY, pmouseX, pmouseY);
    println(vel);
    float sw = map(vel, 0, 200, 10, 0);
    strokeWeight(sw);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}

void keyPressed() {
  if(key == 's'){
    /* s de "save" */
   saveFrame("img/#####.png"); 
  }
  if(key == 'c'){
    /* c de "clear" */
   background(#FAECBD);
  }
  
}
