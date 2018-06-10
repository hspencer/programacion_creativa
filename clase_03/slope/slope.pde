// SLOPE


float angle, slope, x1, x2, y1, y2;
PFont f;

void setup(){
  size(400, 400);
  f = createFont("Helvetica", 24);
  textFont(f);
  
  x1 = width/2;
  y1 = height/2;
  
  pixelDensity(2);
  noCursor();
}

void draw(){
  x2 = mouseX;
  y2 = mouseY;
  
  // y es invertido
  slope = (y1 - y2) / (x2 - x1);
  
  angle = atan2((y1 - y2), (x2 - x1));
  background(0);
  
  stroke(255, 50);
  strokeWeight(20);
  line(x1, y1, x2, y2);
  stroke(255);
  strokeWeight(1);
  fill(0);
  ellipse(x1, y1, 20, 20);
  ellipse(x2, y2, 20, 20);
  fill(255);
  textAlign(LEFT);
  textFont(f);
  text("ang = "+angle, x1/2, textAscent()+textDescent());
  text("m = "+slope, x1/2, height - textAscent());
  
  textAlign(CENTER);
  textFont(f, 13);
  text("x1, y1", x1, y1 + textAscent()*3);
  text("x2, y2", x2, y2 + textAscent()*3);
}