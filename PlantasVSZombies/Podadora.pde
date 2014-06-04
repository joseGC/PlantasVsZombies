public class Podadora{
  float posX, posY, velocidad=30;
  PImage img;
  boolean booViva=true;
  ArrayList<Object> arrayZombies;
    //ZOMBIES AUX
ZombieComun auxComun;
ZombieCono auxCono;
ZombieCubo auxCubo;
Zombistein auxBistein;
Zombiecito auxCito;

  public Podadora(float x,float y, ArrayList<Object> zom){
    posX=x;
    posY=y;
    arrayZombies=zom;
  }
  
  public void dibujar(){
    img = loadImage("img/podadora.png");
    for(int y=0; y<arrayZombies.size(); y++)
    {
      String clase = arrayZombies.get(y).getClass().toString();
      clase=clase.substring(clase.indexOf("$")+1,clase.length());
      
          if(clase.equals("ZombieComun"))
          {
             auxComun=(ZombieComun)lvl.arrayZombies.get(y);
             
             if(posX>=auxComun.getPosX() && posX<=auxComun.getPosX()+50 && auxComun.getVivo() && posY>auxComun.getPosY() && posY<auxComun.getPosY()+90)
             {
                 auxComun.setVivo(false);
                 arrayZombies.remove(y);
                 booViva=false;
             }
          }
          else
          {
            if(clase.equals("ZombieCono"))
            {
              auxCono=(ZombieCono)lvl.arrayZombies.get(y);
            }
            else
            {
              
            }
          }
    }
    if(!booViva && posX<1000)
    {
      posX+=velocidad;
      image(img, posX, posY);
    }
    if(posX<1000 && booViva)
    {
      image(img, posX, posY);
    }
    
  }
}
