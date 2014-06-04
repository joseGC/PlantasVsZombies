public class Bala{
  
  float posX, posY, velocidad=20;
  int tipo,id;
  PImage img;
  ArrayList<Bala> balas;
  ArrayList<Object> arrayZombies;
  boolean vivo=true;
  


  public Bala(float x, float y, float vel, int tip,ArrayList<Bala> bal, ArrayList<Object>zom,int idB){
    posX=x;
    posY=y;
    velocidad=vel;
    tipo=tip;
    balas=bal;
    arrayZombies=zom;
    id=idB;
  }
  
  public void dibujar(){
    if(vivo)
    {
      img = loadImage("img/bala1.png");
      image(img, posX, posY);
      posX+=velocidad;
    }
    
  }
  
  public float getPosX(){
    return posX;
  }
  
  public float getPosY(){
    return posY;
  }
  
  public int getTipo(){
    return tipo;
  }
  
  public int getId(){
    return id;
  }
  
  public boolean getVivo(){
    return vivo;
  }
 
  public void setVivo(boolean valor){
    vivo=valor;
  }
 
}
