public class Lanzaguisantes{
  float posX, posY, ancho, largo;
  int x,y;
  int vida=100, contBala;
  PImage img;
  Thread hiloDisparo;
  ArrayList<Bala> balas;
  boolean booCreado=false;
  ArrayList<Object> arrayZombies;
  
  public Lanzaguisantes(float px, float py, int x, int y, ArrayList<Bala>bala, ArrayList<Object> zom, int contBal){
    posX=px;
    posY=py;
    x=x;
    y=y;
    balas=bala;
    arrayZombies=zom;
    contBala=contBal;
    
    hiloDisparo= new Thread(){
      public void run(){
        while(true)
        {
           try{
             Thread.sleep(5000);
             balas.add(new Bala(posX+40,posY,10,1,balas,arrayZombies,contBala));
             contBala++;
           } catch (InterruptedException e) {
          // TODO Auto-generated catch block
          e.printStackTrace();
          }
        }
        
      }
    };
    booCreado=true;
  }
  
  public void dibujar(){
    if(booCreado)
    {
      booCreado=false;
      hiloDisparo.start();
    }
    img = loadImage("img/lanzaguisante1.png");
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
