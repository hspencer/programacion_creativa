class Polar{
  float ang, rad;
  float x, y;
  int seed;
  float tang; // target angle
  float ix, iy, tx, ty;
  boolean sigue, free, merodea;
  color c;

  Polar(){
    x = ix = tx = random(margen, width-margen);
    y = iy = ty = random(margen, height-margen);
    ang = random(TWO_PI);
    rad = random(.5, 1); 
    seed = round(random(100000));
    sigue = false;
    free = false;
    merodea = false;
    getCol();
  }

  Polar(float px, float py){
    x = ix = tx = px;
    y = iy = ty = py;
    ang = random(TWO_PI);
    rad = random(.5, 1); 
    seed = round(random(100000));
    sigue = true;
    free = false;
    merodea = false;
    getCol();
  }

  void getCol(){
    c = color(255 - random(10), 255 - random(10), 255 - random(10), 80); 
  }

  void calc(){
    if(free) {
      sigue = false;    
    }
    else{
      if(merodea){ 
        go();
      };
      check(); 
    }

    noiseSeed(seed);
    ang += (noise(millis()/900) - 0.5) * 0.5;
    ang %= TWO_PI;

    if(sigue){
      tang = atan2(tx - x, ty - y) * -1 + HALF_PI;
      float difang = tang - ang;
      float nang = ang + difang * 0.877;
      x += cos(nang) * rad;
      y += sin(nang) * rad;
    }
    else{
      x += cos(ang) * rad;
      y += sin(ang) * rad;
    }
  }

  void check(){
    float d = dist(x, y, tx, ty); 
    if(d < 1){
      sigue = false;
    }
    else{
      sigue = true;
    }
  }

  void follow(float fx, float fy){
    tx = fx;
    ty = fy; 
  }

  void origin(){
    follow(ix, iy); 
  }

  void doquier(){
    follow(random(margen, width-margen), random(margen, height-margen)); 
  }

  void go(){
    tx = merodeador.x;
    ty = merodeador.y;
  }

  void warp(){
    if(x > width) x -= width;
    if(x < 0) x += width;
    if(y > height) y -= height;
    if(y < 0) y += height;  
  }
}
