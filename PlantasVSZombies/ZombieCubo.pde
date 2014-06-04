public class ZombieCubo{
  float posX, posY, ancho, largo;
  int vida=100;
  PImage img;
  public ZombieCubo(){
  }
  
   public void dibujar(){
    img = loadImage("img/sol3.png");
    image(img, posX, posY);
  }
  
  public float getPosX(){
    return posX;
  }
  
  public float getPosY(){
    return posY;
  }
  
  public void setVida(int golpe){
    vida-=golpe;
  }
  
   public int getVida(){
    return vida;
  }
}
