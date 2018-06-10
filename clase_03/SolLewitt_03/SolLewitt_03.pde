/*
 *    Fifty randomly placed points all connected by straight lines.
 *
 *                                                         Sol LeWitt
 */



import processing.pdf.*;

int numPoints = 100;
Point[] points = new Point[numPoints];

void setup() {
  size(900, 600);
  for (int i = 0; i < numPoints; i++) {
    points[i] = new Point();
  }
  noLoop();
  smooth();
  beginRecord(PDF, "Sol Lewitt 3.pdf");
  background(255);
}


void draw() {
  for (int i = 0; i < numPoints; i++) {
    for (int j = 0; j < i; j++) {
      Line l = new Line(points[i], points[j]);
      l.draw();
    }
  }
  String txt = "Fifty randomly placed points all connected by straight lines.";
  PFont t = createFont("Helvetica", 8);
  textFont(t, 8);
  textAlign(CENTER);
  fill(255, 80);
  rectMode(CENTER);
  noStroke();
  rect(width/2, height - 44 + textDescent(), textWidth(txt)+10, textAscent()+textDescent()+5);
  fill(200, 0, 0);
  text(txt, width/2, height - 40);
  endRecord();
 // exit();
}

