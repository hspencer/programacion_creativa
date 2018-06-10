/**
 *   SlowDust ~ hspencer
 */

import processing.video.*;

Capture cam;

int num = 9999;
float maxSpeed = 10.0;
float speed;
float[] x = new float[num];
int[] y = new int[num];

void setup() {
  size(640, 480);
  cam = new Capture(this, 640, 480);
  cam.start();
  stroke(255);
  for(int i = 0; i < num; i++){
    x[i] = (int)random(width);
    y[i] = (int)random(height);
  }
}


void draw() {
  if (cam.available() == true) {
    cam.read();
    //image(cam, 0, 0);
    background(0);
    for (int i = 0; i < num; i++){
      color c = cam.get((int)x[i],y[i]);
      float b = brightness(c);
      float speed = ((255-b)/255.0)*maxSpeed+0.1+random(0,0.2);
      x[i] += speed;
      if (x[i] > width){
        x[i] = 0;
        y[i] = int(random(height));
      }
      point(x[i],y[i]);
    }
  }
} 
