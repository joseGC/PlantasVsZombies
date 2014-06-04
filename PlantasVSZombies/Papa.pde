public class Papa{
  float posX, posY, ancho, largo;
  int x,y;
  int vida=100;
  PImage img;
  public Papa(float px, float py, int x, int y){
    posX=px;
    posY=py;
    x=x;
    y=y;
  }
  
   public void dibujar(){
    img = loadImage("img/sol3.png");
    image(img, posX, posY);
  }
  
  public void setPosX(int x){
    posX=x;
  }
  
  public void setPosY(int y){
    posY=y;
  }
  
  public int getY(){
    return y;
  }
  
  public int getX(){
    return x;
  }
}
