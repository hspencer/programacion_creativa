PImage ColorPal;

color buenColor(){
  int pal = ColorPal.pixels.length;
  int index = (int)random(pal);
  return ColorPal.pixels[index];
}

