/**
 * <strong>Sin - Perlin noise envelope</strong><br/>
 * Click on en el applet para ganar foco. Luego mueva su mouse horizontalmente.
 *
 * Herbert Spencer, Nov. 2006
 */

void setup(){
  size(300,300);
  colorMode(RGB, height);
}

// variables
float mouseFactor; // posición del mouse en X entre 0..1
float noisy; // ruido de los milisegundos (el terreno)
float sinEnvelope; // la envolvente de la función seno
float fraq; // la multiplicación de las anteriores (la resultante)
float y; // la aimplificación de fraq * el alto de la película

void draw(){

  for (int x=0; x<width; x++){
    
    mouseFactor = ((float)mouseX/(float)width);
    sinEnvelope = (abs(sin(x/(width/PI))));    //0..1..0
    noisy = noise((millis()/1000.0)+(x/100.0));
    fraq = mouseFactor * sinEnvelope * noisy;             //0..1
    y =  height - (fraq * (float)height);

    //paint the background with vertical lines
    stroke(height-y);
    line(x,0, x,height);
    
    //draw the dotted red line
    strokeWeight(2);
    stroke(200,0,0);
    point(x,y);
    
  }
}
