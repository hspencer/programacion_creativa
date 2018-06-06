/**

<strong>Pelota Feliz</strong>
<br />
Herbert Spencer - 2008
<br />
Esta pelota sigue al círculo y cuando llega se pone feliz
*/


float pelotaX, pelotaY; // las coordenadas de la pelota
float difX, difY; // la diferencia con el círculo
float ROCE = 0.051; // lo que le cuesta avanzar
boolean feliz = false; // no es feliz, por ahora

void setup(){
  size(300, 300);
  // supongamos que la pelota está en la mitad
  // nótese que puedo inicializar los valores del mouse también
  pelotaX = mouseX = width/2;
  pelotaY = mouseY = height/2;
  
  noCursor(); // sin cursor
  smooth(); 
}

void draw(){
  
  background(#ddddcc);

  // calcule la diferencia entre el mouse y la pelota en 2 dimensiones
  difX = mouseX - pelotaX;
  difY = mouseY - pelotaY;
  
  // defina la posición de la pelota añadiéndole roce
  pelotaX += difX * ROCE;
  pelotaY += difY * ROCE;
  
  // dibuje la pelota (función propia)
  pelota(pelotaX, pelotaY);
  
  // haga el círculo donde está el mouse (invisible)
  stroke(0);
  noFill();
  ellipse(mouseX, mouseY, 20, 20);
}

void pelota(float x, float y){
  
  noStroke(); //sin contorno
  
  // calcule la distancia lineal entre la pelota y el mouse
  float d = dist(pelotaX, pelotaY, mouseX, mouseY);

  // si esa distancia es menor que 1, la pelota es feliz 
  if(d < 1){
  feliz = true;
  }
  
  // y si es feliz, haga que se ponga roja y salte de felicidad
  if(feliz){
    float nuevaY = y + sin(millis()/30) * 8;
    fill(#CC0000);
    ellipse(x, nuevaY, 5 + d/5, 5 + d/5);
  }else{
    // si no es feliz, entonces que siga tratando de seguir a la pelota
  fill(0);
  ellipse(x, y, 5 + d/5, 5 + d/5);
  }
}

void mouseMoved(){
  feliz = false;
}
