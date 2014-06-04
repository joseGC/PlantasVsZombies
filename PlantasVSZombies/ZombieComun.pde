public class ZombieComun{
  float posX, posY, velocidad=3;
  int vida=100, cambioImg=0;
  PImage img;
  boolean vivo=true;
  
  public ZombieComun(float x, float y){
    posX=x;
    posY=y;
  }
  
   public void dibujar(){
    if(cambioImg<3)
    {
      img = loadImage("img/zombieBasico1.png");
      posX-=velocidad;
    }
    else
    {
      img = loadImage("img/zombieBasico2.png");
      if(cambioImg>6)
      {
        cambioImg=0;
        posX-=velocidad;
      }
    }
    
    cambioImg++;
    
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
  
    public boolean getVivo(){
    return vivo;
  }
 
  public void setVivo(boolean valor){
    vivo=valor;
  }
}
