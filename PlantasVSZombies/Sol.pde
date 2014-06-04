public class Sol{
  float posX, posY=0, gravedad=6, limite;
  PImage img;
  int cambioImg=0,tipo=0;
  boolean creado=false;
  
  public Sol(float x, float lim){
    posX=x;
    limite=lim;
  }
  public Sol(float x, float y, int tip){
    posX=x;
    posY=y;
    tipo=tip;
    limite=posY;
  }
  
  
  void movimiento(){
    if(cambioImg<2)
    {
      img = loadImage("img/sol2.png");
    }
    else
    {
      img = loadImage("img/sol3.png");
      if(cambioImg>4)
      {
        cambioImg=0;
      }
    }
    
    cambioImg++;
    
    image(img, posX, posY);
    
    if(tipo==0)
    {
       if(posY<limite)
        {
           posY+=gravedad; 
        }
    }
    else
    {
      if(!creado)
      {
        posY-=gravedad+10;
       if(posY<(limite-100))
        {
          creado=true;
        }
      }
      else
      {
        if(posY<limite)
        {
           posY+=gravedad; 
        }
      }
    }
   
    
  }
  
  public float getX(){
    return posX;
  }
  
  public float getY(){
    return posY;
  }
}
