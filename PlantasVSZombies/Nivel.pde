public class Nivel{
  PImage img, imgPuntos, imgGirasol, imgPapa, imgLanzaGuisante, imgPapapum, imgCarta_Girasol, imgCarta_Papa, imgCarta_LanzaGuisante, imgCarta_Papapum;
  float posX=0, posY=0;
  public ArrayList<Object> arrayPlantas;
  int[][] tablero;
  int puntos=25, numLvl, numOrda=1, contBala=0;
  boolean booIniciado=false;
  Thread hiloNivel, hiloOrdasZombies;
  
  PFont fuente;
  
  //PODADORA
  Podadora[] podadoras=new Podadora[5];
  
  
  //MEDIDAAS DEL  TABLERO rect(173,215,640,425);
  
  //PARA LOS SOLES
  ArrayList<Sol> arraySoles;
  
  ArrayList<Bala> arrayBalas;
  ArrayList<Object> arrayZombies;
  
  
  public Nivel(ArrayList<Sol> sol, int numlvl, int[][] tbl, ArrayList<Bala> bala, ArrayList<Object> zom){
    
    numLvl=numlvl;
    arrayBalas=bala;
    arrayZombies=zom;
    
     hiloNivel = new Thread(){
      public void run(){
        while(booIniciado)
        {
          try{
            Thread.sleep(6000);
            float solX=random(170,600);
            float lim=random(240,400);
            arraySoles.add(new Sol(solX,lim));
            
           } catch (InterruptedException e) {
          // TODO Auto-generated catch block
          e.printStackTrace();
          
          
        }
      }
   }};
   
   hiloOrdasZombies = new Thread(){
     public void run(){
       try{
       Thread.sleep(20000);
         } catch (InterruptedException e) {
          // TODO Auto-generated catch block
          e.printStackTrace();
          
             }
       while(booIniciado)
       {
          try{
              if(arrayZombies.size()==0)
              {
                crearOrdaZombie();
              }
              Thread.sleep(2000);
                
                
             } catch (InterruptedException e) {
          // TODO Auto-generated catch block
          e.printStackTrace();
          
             }
       }
   }
 };
   
   tablero=tbl;
   
   for(int y=0; y<9; y++)
   {
     for(int x=0; x<5; x++)
     {
       tablero[x][y]=0;
     }
   }
 
   podadoras[0]= new Podadora(75,220,arrayZombies);
   podadoras[1]= new Podadora(75,305,arrayZombies);
   podadoras[2]= new Podadora(75,389,arrayZombies);
   podadoras[3]= new Podadora(75,469,arrayZombies);
   podadoras[4]= new Podadora(75,549,arrayZombies);
   
   arrayPlantas= new ArrayList<Object>();
   
    arraySoles = sol;
  }
  
  public void pintar(){
    if(!booIniciado)
    {
      booIniciado=true;
      hiloNivel.start();
      hiloOrdasZombies.start();
    }
    img = loadImage("img/escenario1.png");
    image(img, posX, posY);
    
    imgPuntos=loadImage("img/puntos.png");
    image(imgPuntos, 20, 10);
    
    fill(0);
    fuente= createFont("Arial",16,true);
    textFont(fuente,36); 
    text(puntos+"",60,150);  
    
    switch(numLvl)
    {
      case 1:
      imgCarta_Girasol =loadImage("img/carta_girasol1.png");
      image(imgCarta_Girasol, 170, 10);
      imgCarta_Papa = loadImage("img/carta_guisante1.png");
      image(imgCarta_Papa, 293, 10);
      imgCarta_LanzaGuisante = loadImage("img/carta_papapum1.png");
      image(imgCarta_LanzaGuisante, 411, 10);
      imgCarta_Papapum = loadImage("img/papa1.png");
      image(imgCarta_Papapum, 539, 10);
        
      break;
      
      case 2:
      break;
      
      case 3:
      break;
      
      case 4:
      break;
      
      case 5:
      break;
    }
    
    for(int contPoda=0; contPoda<5; contPoda++)
    {
      podadoras[contPoda].dibujar();
    }
    
//    fill(155);
//    rect(179,214,67,82);
//    rect(250,214,67,82);
//    rect(321,214,67,82);
//    rect(391,214,67,82);
//    rect(463,214,67,82);
//    rect(533,214,67,82);
//    rect(604,214,67,82);
//    rect(676,214,67,82);
//    rect(746,214,67,82);
//    
//    rect(179,298,67,82);
//    rect(250,298,67,82);
// 
//    rect(179,384,67,82);
//    rect(250,384,67,82);
//    
//    rect(179,470,67,82);
//    rect(250,470,67,82);
//    
//     rect(179,556,67,82);
//    rect(250,556,67,82);
    
    
  }
  
  public void crearOrdaZombie(){
    
    for(int x=0; x<3*numOrda; x++)
    {
      int ram=(int) random(1,5);
      float zomX=920, zomY=0;
      switch(ram)
      {
        case 1:
            zomY=204;
          break;
        case 2:
            zomY=288;
          break;
        case 3:
            zomY=374;
          break;
        case 4:
            zomY=460;
          break;
        case 5:
            zomY=556;
          break;
          
      }
      arrayZombies.add(new ZombieComun(zomX,zomY));
    }
    
    
    numOrda++;
  }
  
  public int ElegirPlanta(float mousX,float mousY){
     if(mousX>170 && mousX<260 && mousY>10 && mousY<135)
      {
        
        println(1);
        return 1;
      }
      else
      {
        if(mousX>263 && mousX<353 && mousY>10 && mousY<135)
        {
          println(2);
          return 2;
        }
        else
        {
           if(mousX>356 && mousX<446 && mousY>10 && mousY<135)
            {
              println(3);
              return 3;
            }
            else
            {
              if(mousX>449 && mousX<539 && mousY>10 && mousY<135)
              {
                println(4);
                return 4;
              }
              else
              {
                if(mousX>542 && mousX<545 && mousY>10 && mousY<135)
                {
                  println(1);
                  return 5;
                }
                else
                {
                  println(6);
                  return 6;
                }
              }
            } 
        }
      }
  }
  
  public void Plantar(int op, float rtX, float rtY, int x, int y){
    switch(op)
    {
      case 1:
        arrayPlantas.add(new Girasol(rtX,rtY,x,y,arraySoles));
      break;
      
      case 2:
        arrayPlantas.add(new Lanzaguisantes(rtX,rtY,x,y,arrayBalas,arrayZombies,contBala));
      break;
      
      case 3:
      break;
      
      case 4:
      break;
      
      case 5:
      break;
      
      case 6:
      break;
    }
  }
  
  public int getPuntos(){
    return puntos;
  }
  
   public void sumarPuntos(int punt){
    puntos+=punt;
  }
  
  public void restarPuntos(int punt){
    puntos-=punt;
  }
}
