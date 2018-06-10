Giro g;

void setup(){
  size(300,300);
  g = new Giro(width/2, height/2, -PI);
  background(#ddddcc);
  smooth();
}

void draw(){
  g.gira(); 
}

class Giro{
  float t; // ‡ngulo
  float r; // radio  
  float seed; // noise seed
  float x, y; // posici—n


  Giro(float x, float y, float t){
    this.x = x;
    this.y = y;
    this.t = t;
    
    seed = random(100);
    
    r = 0;
  }

  void gira(){
    
    noiseSeed((int)seed); //para que cada objeto "Giro" sea œnico
    
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
    
    // actualizaci—n de la posici—n segœn identidad circular 
    x += cos(t) * r;
    y += sin(t) * r;

    if(x > width) x = 0;
    if(x < 0) x = width;
    if(y > height) y = 0;
    if(y < 0) y = height;
  }
}

void keyPressed(){
background(#ddddcc);
}
