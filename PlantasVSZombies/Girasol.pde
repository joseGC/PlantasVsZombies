public class Girasol{
  float posX, posY, ancho, largo;
  int x,y;
  int vida=100, cambioImg=0;
  PImage img;
  Thread hiloSol;
  ArrayList<Sol> arraySoles;
  boolean produccion=false,iniciar=true;
  
  public Girasol(float px, float py, int x, int y, ArrayList<Sol> sol){
    arraySoles=sol;
    posX=px;
    posY=py;
    x=x;
    y=y;
  
    hiloSol= new Thread(){
      public void run(){
        while(iniciar)
        {
          try{
             Thread.sleep(10000);
             arraySoles.add(new Sol(posX,posY+40,1));
           } catch (InterruptedException e) {
          // TODO Auto-generated catch block
          e.printStackTrace();
        }
         
        }
      }
    };
    produccion=true;
  }
  
  public void dibujar(){
    
    if(produccion)
    {
      produccion=false;
      hiloSol.start();
    }
    
    if(cambioImg<2)
    {
      img = loadImage("img/girasol.png");
    }
    else
    {
      img = loadImage("img/girasol2.png");
      if(cambioImg>4)
      {
        cambioImg=0;
      }
    }
    
    cambioImg++;
    
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
