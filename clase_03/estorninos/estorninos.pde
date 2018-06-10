int cuantosEstorninos = 600; 
Estornino[] estorninos;

float inc, zoom;

void setup() {
  size(500, 500, P3D);
  estorninos = new Estornino[cuantosEstorninos];
  int cuantos = 0;

  while (cuantos < cuantosEstorninos) {
    float x = random(-width, width);
    float y = random(-width, width);
    float z = random(-width, width);
    float d = dist(0, 0, 0, x, y, z);

    if (d < 150) {
      estorninos[cuantos] = new Estornino(x, y, z);
      cuantos++;
    }
  }
  zoom = 100.0;
  sphereDetail(4);
}

void draw() {
  background(255);
  inc = millis()/2000.0;
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateY(inc * .05);
  // línea entre los estorninos cercanos
  for (int i = 0; i < estorninos.length; i++) {
    for (int j = 1; j < i; j++) {
      color c = color(
                map(i, 0, cuantosEstorninos, 0, 250), 
                map(j, 1, cuantosEstorninos, 0, 250),
                100);
                stroke(c, 160);
      float d = dist(
        estorninos[i].x, 
        estorninos[i].y,
        estorninos[i].z,
        estorninos[j].x, 
        estorninos[j].y,
        estorninos[j].z
        );
      if (d < 30) {
        line(
        estorninos[i].x, 
        estorninos[i].y,
        estorninos[i].z,
        estorninos[j].x, 
        estorninos[j].y,
        estorninos[j].z
        );
      }
    }
  }

  // dibuja todos los estorninos
  for (int i = 0; i < estorninos.length; i++) {
    estorninos[i].draw();
  }
  popMatrix();
}


class Estornino {
  float x, y, z;
  float dirXY, dirXZ;
  float step;
  int seed;
  Estornino(float _x, float _y, float _z) {
    x = _x;
    y = _y;
    z = _z;
    dirXY = random(TWO_PI);
    dirXZ = random(TWO_PI);
    step = random(.1, .3);
    seed = round(random(99999));
  }

  void calc() {
    noiseSeed(seed);
    dirXY += noise((x+inc)/zoom, (y+inc)/zoom) - .5;
    dirXZ += noise((x+inc)/zoom, (z+inc)/zoom) - .5;
    x += cos(dirXY) * step;
    y += sin(dirXY) * step;
    z += cos(dirXZ) * step;
  }

  void draw() {
    calc();
    noStroke();
    fill(0, 190);
    pushMatrix();
      translate(x, y, z);
      sphere(1.5);
    popMatrix();
  }
}