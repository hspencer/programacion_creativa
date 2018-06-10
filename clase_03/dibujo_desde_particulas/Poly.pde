class Poly{
  Polar[] p; 

  Poly(Polar[] pol){
    p = pol; 
  }

  void draw(){
    stroke(0, 10);
    beginShape();
    for(int i = 0; i < p.length; i++){
      p[i].calc();
      fill(p[i].c);
      vertex(p[i].x, p[i].y);
    }
    endShape(CLOSE);
  }

  void collapse(){
    float x = 0;
    float y = 0;
    for(int i = 0; i < p.length; i++){
      x += p[i].x;
      y += p[i].y;
    }
    x /= (float)p.length;
    y /= (float)p.length;
    for(int i = 0; i < p.length; i++){
      p[i].follow(x,y);

    }
  }
}
