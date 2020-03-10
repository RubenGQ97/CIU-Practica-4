 
 

PImage fondo;
sistema system;
float x,y,z,x2,y2,z2;
boolean avanza,retrocede,izquierda,derecha,der,izq,down,up,camara;
void setup(){
  size(900,900,P3D);
    x=500;
    y=700;
    z=-1200;
    camara=false;
  noStroke();
  fondo= loadImage("fondo.jpg");
  system= new sistema();
  system.anadirPlaneta(new planeta(30,random(0,TWO_PI),0.005,600,0,0,"planeta1"));      //radio, angulo orbita, distancia, id, textura, 
  system.anadirPlaneta(new planeta(40,random(0,TWO_PI),0.02,400,1,1,"planeta2"));
  system.anadirPlaneta(new planeta(55,random(0,TWO_PI),0.009,500,2,2,"planeta3"));
  system.anadirPlaneta(new planeta(40,random(0,TWO_PI),0.01,700,3,3,"planeta4"));
  system.anadirPlaneta(new planeta(100,random(0,TWO_PI),0.0093,1000,4,4,"planeta5"));
  system.anadirPlaneta(new planeta(200,0,0,0,6,6,"Estrella1"));
  planeta aux= system.getPlaneta(3);
  aux.anadirSatelite(new satelite(8.0,random(0,TWO_PI),0.038,80,1,"Satelite 1"));    //radio orbita distancia id nombre
  aux=system.getPlaneta(4);
  aux.anadirSatelite(new satelite(20.0,random(0,TWO_PI),0.03,170,1,"Satelite 2"));
  aux.anadirSatelite(new satelite(15.0,random(0,TWO_PI),0.045,250,2,"Satelite 3"));
  
}

void draw(){
  fondo.resize(900,900);
  background(fondo);
  if(camara){
    pushMatrix();
    actualizaCamara();
    camera( width/2.0 -x, height/2-y,z,z,0,x2,0,1,0);
      system.mostrar();
      popMatrix();
  }else{
  
      x=500;
    y=700;
    z=-1200;
      translate(x,y,z);
      mostrarMenu();
  system.mostrar();
  }

  
}



void keyPressed(){
    if(key=='w')avanza=true;
    if(keyCode==RIGHT)der=true;
    if(keyCode==LEFT)izq=true;
    if( key=='s')retrocede=true;
    if( keyCode==DOWN)down=true;
    if( keyCode==UP)up=true;
    if(keyCode==ENTER){
      camara=!camara;
      z=-z;
      x=x+800;
  }
}



void keyReleased(){
    if(key=='w')avanza=false;
    if(keyCode==RIGHT)der=false;
    if(keyCode==LEFT)izq=false;
    if( key=='s')retrocede=false;
    if( keyCode==DOWN)down=false;
    
    if( keyCode==UP)up=false;

}
void actualizaCamara(){
    if(avanza){
      z=z-10;
      x=x-10;
    x2=x2+10;
    }     
    if(retrocede){
      z=z+10;
      x=x+10;
      x2=x2-10;
      }
    if(der){
    x=x-20;
    x2=x2+20;
    }
    if(izq){
      x=x+10;
      x2=x2-10;
      }
    if(up)y=y+10;
    if(down)y=y-10;
}

 void mostrarMenu(){
     textSize(120);
     text("Sistema planetario",-600,-700,1000);
     textSize(80);
     text("Enter: Camara libre",-1150,height-380);
     text("Flecha superior e inferior: Desplazamiento vertical",-1150,height-260);
     text("Flechas laterales: Desplazamiento horizontal",-1150,height-140);
     text("'W' y 'S': Avanzar y retroceder",-1150,height-40);
 }
