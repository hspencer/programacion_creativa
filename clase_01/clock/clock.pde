// clock
// by Herbert Spencer

float variance = 0;
int prevSec;
int millisRolloverTime;
int S = second();

void setup(){
  size(300,300);
  smooth();
  rectMode(CORNER);
  cursor(HAND);
  millisRolloverTime = 0;
}


void draw(){
  background(255);

  if (prevSec != S){
    millisRolloverTime = millis();
  }

  prevSec = S;

  float realHour = hour() + (minute()/60.0);
  float realMinute = minute() + (second()/60.0);
  float realSecond = S + ((millis())/1000.0);
  int realMillis = millis() - millisRolloverTime;

  float myMillis = realMillis/100;
  float mySecond = realSecond + variance;
  float myMinute = realMinute + (variance/60);
  float myHour = realHour + (variance/3600);

  drawclock(myHour,myMinute,mySecond);

  // time accelerator  
  if (mousePressed == true) {
    int xdim = abs(mouseX - pmouseX);
    int ydim = abs(mouseY - pmouseY);
    variance += (xdim+ydim)/10;
    background(255,mouseX/2,mouseY/2);
    drawclock(myHour,myMinute,mySecond);
  }

  // time accelerator  
  if(keyPressed){
    if (key == 'A' || key == 'a') {
      int xdim = abs(mouseX - pmouseX);
      int ydim = abs(mouseY - pmouseY);
      variance -= (xdim+ydim)/10;
      background(mouseX/2,mouseY/2,255);
      drawclock(myHour,myMinute,mySecond);
    }
  }
}


void drawclock(float hora, float minu, float seg){
  stroke(255);
  pushMatrix();
  {
    //draw the clock in the middle
    translate(width/2,height/2);

    //the big circle
    fill(200);
    stroke(0);
    strokeWeight(10);
    ellipse(0,0,200,200);
    noStroke();


    //the marks
    pushMatrix();
    strokeWeight(0.5);
    noFill();
    {
      for(int i=0; i<200; i+=10){
        stroke(20,30);
        ellipse(0,0 ,i,i);
      }
    }
    noStroke();
    popMatrix();

    //second
    pushMatrix();
    {
      fill(255);
      ellipse(0,0,17,17);
      fill(200,0,0);
      rotate(radians(-90+seg*6));
      triangle(-3,-3.5, -3,3.5, 90,0);//secundero, the long and fast one
    } 
    popMatrix();

    pushMatrix();
    {
      fill(0);
      strokeWeight(1);
      rotate(radians(-90+minu*6));
      rect(-1,-1.5, 84, 3);//minutero, the medium one
    } 
    popMatrix();

    pushMatrix();
    {
      rotate(radians(-90+hora*30));//the magical rotation
      fill(0);
      rect(-2,-3, 60, 6); //horario, the short one
      ellipse(0,0,13,13);
      noFill();
      stroke(150);
      ellipse(0,0, 8,8);
    } 
    popMatrix();
  } 
  popMatrix();
}
