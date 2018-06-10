float sides, increment;

void setup() {
  fullScreen();
  //pixelDensity(2);
  //size(500, 500, P3D);
  background(0);
  sides = 2;
  increment = TWO_PI / sides;
  strokeWeight(2);
  smooth();
}

void draw() {
  translate(width/2, height/2);
  for (float t = 0; t < TWO_PI; t += increment) {
    doodle();
    rotate(increment);
  }
}

void doodle() {
  if (mousePressed) {
    stroke(255, 100);
    line(mouseX-width/2, mouseY-height/2, pmouseX-width/2, pmouseY-height/2);
  }
}

void keyPressed() {
  if (key == 'a') { 
    sides ++;
  }
  if (key == 'z') { 
    sides --;
  }
  if (key == ' ') { 
    background(0);
  }
  sides = constrain(sides, 2, 999);
  increment = TWO_PI / sides;
  
}
