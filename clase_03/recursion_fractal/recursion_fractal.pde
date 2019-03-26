int i = 0;

void setup() {
  size(400, 400);
  stroke(0);
  mouseX = 10;
}

void draw() {
  background(255);
  drawTri(0, 400, 400, 400);
}

void drawCantor(float x1, float y1, float x2, float y2) {
  float h = mouseX;
  float third = (x2 - x1)/3.0;
  rect(x1, y1, x2-x1, h);
  if (third > 1) {
    drawCantor(x1, y1+h, x1+third, y1+h);
    drawCantor(x1+2*third, y1+h, x2, y1+h);
  }
}


void drawTri(float x1, float y1, float x2, float y2) {/*

             4  
 
 
 1       3        5       2
 
 
 */

  float l = dist(x1, y1, x2, y2);

  if (l > 1.0) {
   
    float x3 = lerp(x1, x2, 0.33333333);
    float y3 = lerp(y1, y2, 0.33333333);
    float x5 = lerp(x1, x2, 0.66666666);
    float y5 = lerp(y1, y2, 0.66666666);

    line(x1, y1, x3, y3);
    line(x5, y5, x2, y2);
    
    float x4 = x3 + cos(-PI/3) * l/3;
    float y4 = y3 + sin(-PI/3) * l/3;

    drawTri(x1, y1, x3, y3); 
    drawTri(x3, y3, x4, y4); 
    drawTri(x4, y4, x5, y5); 
    drawTri(x5, y5, x2, y2);
    
    i++;
  }
}
