
Nivel lvl;
int opPlanta=0;
float ramSolX, ramSolY, posPlantaX, posPlantaY;
boolean booPlantar=false;

//PARA LOS SOLES
ArrayList<Sol> arraySoles;
int[][] tablero = new int[5][9];

ArrayList<Bala> arrayBalas;
ArrayList<Object> arrayZombies;

  //ZOMBIES AUX
ZombieComun auxComun;
ZombieCono auxCono;
ZombieCubo auxCubo;
Zombistein auxBistein;
Zombiecito auxCito;


void setup(){
 size(970,700);
 arraySoles = new ArrayList<Sol>();
 arrayBalas= new ArrayList<Bala>();
 arrayZombies = new ArrayList<Object>();
 lvl=new Nivel(arraySoles,1,tablero,arrayBalas,arrayZombies);

}

void draw(){
 
  lvl.pintar();
 
  
  if(lvl.arrayPlantas.size()!=0)
  {
    for(int x=0; x<lvl.arrayPlantas.size(); x++)
    {
      String clase = lvl.arrayPlantas.get(x).getClass().toString();
      clase=clase.substring(clase.indexOf("$")+1,clase.length());
      
      if(clase.equals("Girasol"))
      {
        Girasol aux=(Girasol)lvl.arrayPlantas.get(x);
        aux.dibujar();
      }
      else
      {
        if(clase.equals("Lanzaguisantes"))
        {
          Lanzaguisantes aux=(Lanzaguisantes)lvl.arrayPlantas.get(x);
          aux.dibujar();
        }
        else
        {
          
        }
      }
    }
  }
  
  if(arraySoles.size()>0)
  {
    for(int x=0; x<arraySoles.size(); x++)
    {
      arraySoles.get(x).movimiento();
    }
  }
  
  if(arrayBalas.size()>0)
  {
    for(int x=0; x<arrayBalas.size(); x++)
    {
      Bala auxBala=arrayBalas.get(x);
        auxBala.dibujar();
        for(int y=0; y<arrayZombies.size(); y++)
          {
            String clase = arrayZombies.get(y).getClass().toString();
            clase=clase.substring(clase.indexOf("$")+1,clase.length());
            
                if(clase.equals("ZombieComun"))
                {
                   auxComun=(ZombieComun)lvl.arrayZombies.get(y);
                   
                   if(auxBala.getPosX()>=auxComun.getPosX() && auxBala.getPosX()<=auxComun.getPosX()+50 && auxComun.getVivo() && auxBala.getPosY()>auxComun.getPosY() && auxBala.getPosY()<auxComun.getPosY()+90)
                   {
                     switch(auxBala.getTipo())
                     {
                       case 1:
                         if(auxBala.getVivo())
                         {
                           auxComun.setVida(10);
                           if(auxComun.getVida()<0)
                           {
                             auxComun.setVivo(false);
                             arrayZombies.remove(y);
                           }
                           auxBala.setVivo(false);
                         }
                         
                       break;
                       
                       case 2:
                       break;
                       
                       case 3:
                       break;
                     }
                     
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
      if(x<arrayBalas.size())
      {
        if(arrayBalas.get(x).getPosX()>890)
        {
          arrayBalas.remove(x);
        }
      }
    }
  }
  
  
  if(arrayZombies.size()>0)
  {
    for(int x=0; x<arrayZombies.size(); x++)
    {
      String clase = lvl.arrayZombies.get(x).getClass().toString();
      clase=clase.substring(clase.indexOf("$")+1,clase.length());
      
      if(clase.equals("ZombieComun"))
      {
        ZombieComun aux=(ZombieComun)lvl.arrayZombies.get(x);
        aux.dibujar();
      }
      else
      {
        if(clase.equals("ZombieCono"))
        {
          ZombieCono aux=(ZombieCono)lvl.arrayZombies.get(x);
          aux.dibujar();
        }
        else
        {
          
        }
      }
    }
  }
}


void mouseClicked(){
  
  float ratonX=mouseX;
  float ratonY=mouseY;
  println(ratonX+"     "+ratonY);
  if(!booPlantar)
  {
      if(ratonY<=135 && ratonX>170 && ratonX<800)
       {
         opPlanta=lvl.ElegirPlanta(ratonX,ratonY);
         booPlantar=true;
       }
       else
       {
         if(ratonX>173 && ratonX<814 && ratonY>140 && ratonY<640)
         {
           for(int x=0; x<arraySoles.size(); x++)
           {
             ramSolX=arraySoles.get(x).getX();
             ramSolY=arraySoles.get(x).getY();
             
             if(ratonX>ramSolX-50 && ratonX<ramSolX+50 && ratonY>ramSolY-50 && ratonY<ramSolY+50)
             {
               arraySoles.remove(x);
               lvl.sumarPuntos(25);
             }
           }
         }
       }
  }
  else
  {
     if(ratonX>173 && ratonX<814 && ratonY>215 && ratonY<640 && opPlanta!=0)
     {
       int tblX=numX(ratonX);
       int tblY=numY(ratonY);
       if(tablero[tblY][tblX]==0)
       {
         tablero[tblY][tblX]=1;
         lvl.Plantar(opPlanta, posPlantaX, posPlantaY,tblX, tblY);
       }
       
       posPlantaX=0;
       posPlantaY=0;
       opPlanta=0;
       
       //PINTAR EL TABLERO
//        for(int x=0; x<5; x++)
//         {
//           for(int y=0; y<9; y++)
//           {
//             print("["+tablero[x][y]+"]");
//           }
//           println("");
//         }
     }
  }  
}

public int numY(float ratonY){
  booPlantar=false;
  if(ratonY>214 && ratonY<298)
   {
     posPlantaY=224;
     return 0;
   }
   else
   {
       if(ratonY>298 && ratonY<384)
       {
         posPlantaY=308;
         return 1;
       }
       else
       {
           if(ratonY>384 && ratonY<470)
           {
             posPlantaY=394;
             return 2;
           }
           else
           {
               if(ratonY>470 && ratonY<566)
               {
                 posPlantaY=480;
                 return 3;
               }
               else
               {
                 posPlantaY=576;
                 return 4;
               }
           }
       }
   }
}

public int numX(float ratonX){

  if(ratonX>179 && ratonX<250)
  {
    posPlantaX=179;
    return 0;
  }
  else
  {
    if(ratonX>250 && ratonX<321)
    {
       posPlantaX=250;
      return 1;
    }
    else
    {
      if(ratonX>321 && ratonX<391)
      {
         posPlantaX=321;
         return 2;
      }
      else
      {
        if(ratonX>391 && ratonX<463)
        {
           posPlantaX=391;
           return 3;
        }
        else
        {
          if(ratonX>463 && ratonX<533)
          {
             posPlantaX=463;
             return 4;
          }
          else
          {
            if(ratonX>533 && ratonX<604)
            {
               posPlantaX=533;
               return 5;
            }
            else
            {
              if(ratonX>604 && ratonX<676)
              {
                 posPlantaX=604;
                 return 6;
              }
              else
              {
                  if(ratonX>676 && ratonX<746)
                  {
                     posPlantaX=676;
                     return 7;
                  }
                  else
                  {
                     posPlantaX=746;
                     return 8;
                  }
              }
            }
          }
        }
      }
    }
  }
}

