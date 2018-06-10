/*
 *   Arcs from two adjacent corners and the midpoint of one side, between.
 *
 *                                                         Sol LeWitt
 */



import processing.pdf.*;

void setup() {
  size(900, 600);
  smooth();
  beginRecord(PDF, "Sol LeWitt Wall Drawing 140.pdf");
  background(255);
}

void gridCircle(float x, float y, int repetitions, float spacing) {
  for (int i = 0; i < repetitions; i ++) {
    stroke(0, 90);
    strokeWeight(.2);
    noFill();
    ellipse(x, y, i*spacing, i*spacing);
  }
}

void draw() {

  gridCircle(0, 0, 120, 20);
  gridCircle(width/2, 0, 120, 20);
  gridCircle(width, 0, 120, 20);
  /*
  String txt = "Arcs from two adjacent corners and the midpoint of one side, between.";
   PFont t = createFont("Helvetica", 8);
   textFont(t, 8);
   textAlign(CENTER);
   fill(255, 80);
   rectMode(CENTER);
   noStroke();
   rect(width/2, height - 44 + textDescent(), textWidth(txt)+10, textAscent()+textDescent()+5);
   fill(200, 0, 0);
   text(txt, width/2, height - 40);
   */
  endRecord();
  exit();
}

