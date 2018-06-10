PFont f;
Point[] points;

void setup(){
  size(300,300);
  f = createFont("Verdana", 10);
  textFont(f, 10);
  textAlign(CENTER);
  ellipseMode(CENTER);
  points = new Point[4];
  for (int i=0; i < points.length; i++){
    points[i] = new Point(random(width), random(height), i);
  }
  smooth();
}

void draw(){
  background(255);
  noFill();
  strokeWeight(3);
  curve(points[0].x, points[0].y, points[1].x, points[1].y, points[2].x, points[2].y, points[3].x, points[3].y);
  for (int i=0; i < points.length; i++){
    points[i].render();
    points[i].update();
  }
}

class Point{

  int num;
  float x, y, radius;
  boolean over, dragging;

  Point(float _x, float _y, int _num){
    x = _x;
    y = _y;
    num = _num;
    over = dragging = false;
    radius = 9;
  }

  void update(){
    float d = dist(x, y, mouseX, mouseY);
    if (d < radius){
      over = true;
      if (mousePressed){
        dragging = true;
      }
    }
    else{
      over = false;
    }
    if(dragging){
      float difx = x - mouseX;
      float dify = y - mouseY;
      x 
    }
  }
  
  void render(){
    stroke(0);
    strokeWeight(1.5);
    if (over){
     fill(#FF4A36);
    }
    else{
     fill(255);
    }
    ellipse(x, y, 2*radius, 2*radius);
    fill(0);
    text(num+1, x, y+ textAscent()/3);
  }
}

void mouseReleased(){
  for (int i=0; i < points.length; i++){
    points[i].dragging = false;
  }
}
