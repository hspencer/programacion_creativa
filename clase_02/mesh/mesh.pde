/**
 *
 *  Mesh Particles ~ hspencer
 *
 */


// Variables

int numParticles = 580;
float minDist    = 170;
float globalRadius = 800;
Particle[] p;


void setup() {
  size(2000, 2000);
  p = new Particle[numParticles];
  int n = 0;
  while (n < numParticles) {
    float x = random(width);
    float y = random(height);
    float d = dist(x, y, width/2, height/2);
    if (d < globalRadius) {
      p[n] = new Particle(x, y);
      n ++;
    }
  }
  background(255);
}

void draw() {
  
  noStroke();
  for (int i = 0; i < p.length; i++) {
    p[i].go();
  }

  for (int i = 0; i < p.length; i++) {
    for (int j = p.length - 1; j > i; j--) {
      float d = dist(p[i].x, p[i].y, p[j].x, p[j].y);
      if (d < minDist) {
        float a = map(d, 0, minDist, 255, 0);
        stroke(0, a);
        line(p[i].x, p[i].y, p[j].x, p[j].y);
      }
    }
  }
  
  noStroke();
  fill(255, 15);
  rect(0, 0, width, height);
}

// Particle

class Particle {
  float x, y, vx, vy, diam, alpha;
  Particle(float _x, float _y) {
    x = _x;
    y = _y;
    diam = random(2, 5);
    alpha = random(40, 200);
    vx = random(-1, 1);
    vy = random(-1, 1);
  }

  void go() {
    move();
    paint();
  }

  void move() {
    x += vx;
    y += vy;

    if (dist(x, y, width/2, height/2) > globalRadius) {
      vx *= -1;
      vy *= -1;
    }
  }

  void paint() {
    fill(0, alpha);
    ellipse(x, y, diam, diam);
  }
}

void keyPressed() {
  saveFrame("mesh.jpg");
}
