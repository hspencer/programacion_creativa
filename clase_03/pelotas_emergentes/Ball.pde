class Ball {
  float x, y;
  float maxDiameter, diameter;
  float vx = 0;
  float vy = 0;
  int id;
  boolean growing, fertil;
  color col;

  Ball(float xin, float yin, int idin) {
    x = xin;
    y = yin;
    maxDiameter = random(2, 20);
    id = idin;
    growing = true;
    fertil = false;
    diameter = 0;
    float h = map(maxDiameter, 2, 20, 0, 255);
    col = color(h, 200, 255, 180);
  } 

  void collide() {
    for (int i = 0; i < temp; i++) {
      if(id != i){
        float dx = balls[i].x - x;
        float dy = balls[i].y - y;
        float distance = sqrt(dx*dx + dy*dy);
        float minDist = balls[i].diameter/2 + diameter/2;
        if (distance < minDist) { 
          float angle = atan2(dy, dx);
          float targetX = x + cos(angle) * minDist;
          float targetY = y + sin(angle) * minDist;
          float ax = (targetX - balls[i].x) * spring;
          float ay = (targetY - balls[i].y) * spring;
          vx -= ax;
          vy -= ay;
          balls[i].vx += ax;
          balls[i].vy += ay;       

          pushMatrix();
          translate(x,y);
          float ang = atan2(balls[i].x - x, balls[i].y - y) * -1 + HALF_PI;
          popMatrix();
          float newX = x + cos(ang) * (diameter/2);
          float newY = y + sin(ang) * (diameter/2);

          if(drawLines){
            fill(255);
            ellipse(newX, newY, 5, 5);
            stroke(255);
            line(x,y, balls[i].x, balls[i].y);
            noStroke();   
          }

          ////////////////////////////////////////////////////  create new ball
          if(fertil && count < (TOTAL-1)){
            fertil = false;
            balls[i].fertil  = false;


            balls[count] = new Ball(newX, newY, count);
            count ++;
            //print("plink! \t");
          } 
        }
      }
    }   
  }

  void move() {
    vy += gravity;
    x += vx;
    y += vy;
    if (x + diameter/2 > width) {
      x = width - diameter/2;
      vx += -0.9; 
    }
    else if (x - diameter/2 < 0) {
      x = diameter/2;
      vx *= -0.9;
    }
    if (y + diameter/2 > height) {
      y = height - diameter/2;
      vy *= -0.9; 
    } 
    else if (y - diameter/2 < 0) {
      y = diameter/2;
      vy *= -0.9;
    }
  }

  void display() {
    if(growing){
      float dif = maxDiameter - diameter;
      diameter += dif * 0.05;
      if(dif < 0.01){
        diameter = maxDiameter;
        growing = false;
        fertil = true;
      }
    }
    fill(col);
    ellipse(x, y, diameter, diameter);
    if(!fertil &&  !growing && frameCount % 48 == 0)fertil = true;
  }
}

