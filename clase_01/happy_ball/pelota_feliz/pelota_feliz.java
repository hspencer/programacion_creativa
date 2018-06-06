import processing.core.*; import java.applet.*; import java.awt.*; import java.awt.image.*; import java.awt.event.*; import java.io.*; import java.net.*; import java.text.*; import java.util.*; import java.util.zip.*; import javax.sound.midi.*; import javax.sound.midi.spi.*; import javax.sound.sampled.*; import javax.sound.sampled.spi.*; import java.util.regex.*; import javax.xml.parsers.*; import javax.xml.transform.*; import javax.xml.transform.dom.*; import javax.xml.transform.sax.*; import javax.xml.transform.stream.*; import org.xml.sax.*; import org.xml.sax.ext.*; import org.xml.sax.helpers.*; public class pelota_feliz extends PApplet {/**

<strong>Pelota Feliz</strong>
<br />
Herbert Spencer - 2008
<br />
Esta pelota sigue al c\u00edrculo y cuando llega se pone feliz
*/


float pelotaX, pelotaY; // las coordenadas de la pelota
float difX, difY; // la diferencia con el c\u00edrculo
float ROCE = 0.051f; // lo que le cuesta avanzar
boolean feliz = false; // no es feliz, por ahora

public void setup(){
  size(300, 300);
  // supongamos que la pelota est\u00e1 en la mitad
  // n\u00f3tese que puedo inicializar los valores del mouse tambi\u00e9n
  pelotaX = mouseX = width/2;
  pelotaY = mouseY = height/2;
  
  noCursor(); // sin cursor
  smooth(); 
}

public void draw(){
  
  background(0xffddddcc);

  // calcule la diferencia entre el mouse y la pelota en 2 dimensiones
  difX = mouseX - pelotaX;
  difY = mouseY - pelotaY;
  
  // defina la posici\u00f3n de la pelota a\u00f1adi\u00e9ndole roce
  pelotaX += difX * ROCE;
  pelotaY += difY * ROCE;
  
  // dibuje la pelota (funci\u00f3n propia)
  pelota(pelotaX, pelotaY);
  
  // haga el c\u00edrculo donde est\u00e1 el mouse (invisible)
  stroke(0);
  noFill();
  ellipse(mouseX, mouseY, 20, 20);
}

public void pelota(float x, float y){
  
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
    fill(0xffCC0000);
    ellipse(x, nuevaY, 5 + d/5, 5 + d/5);
  }else{
    // si no es feliz, entonces que siga tratando de seguir a la pelota
  fill(0);
  ellipse(x, y, 5 + d/5, 5 + d/5);
  }
}

public void mouseMoved(){
  feliz = false;
}

  static public void main(String args[]) {     PApplet.main(new String[] { "pelota_feliz" });  }}