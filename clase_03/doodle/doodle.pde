Giro g;

void setup(){
  fullScreen();
  // pixelDensity(2);
  g = new Giro(width/2, height/2, -PI);
  background(255);
  strokeWeight(5);
  stroke(0, 100);
}

void draw(){
  g.gira(); 
}

class Giro{
  float t; // ángulo
  float r; // radio  
  float seed; // noise seed
  float x, y; // posición


  Giro(float x, float y, float t){
    this.x = x;
    this.y = y;
    this.t = t;
    
    seed = random(100);
    
    r = 0;
  }

  void gira(){
    
    noiseSeed((int)seed); //para que cada objeto "Giro" sea �nico
    
         // noise(millis()/ zoom ) * amplificacion
         
    t += (noise(millis()/400.0) - 0.5) * HALF_PI;
    r += (noise(millis()/600.0) - 0.5);
    
    // para que r no se "arranque", lo confino en un rango:
    r = constrain(r, -4, 4);
    
    // dibujo
    pushMatrix();
    {
      translate(x,y);
      rotate(t);
      line(0,0, r,0);
    }
    popMatrix();
    
    // actualización de la posición según identidad circular 
    x += cos(t) * r;
    y += sin(t) * r;

    if(x > width) x = 0;
    if(x < 0) x = width;
    if(y > height) y = 0;
    if(y < 0) y = height;
  }
}

void keyPressed(){
background(255);
}
