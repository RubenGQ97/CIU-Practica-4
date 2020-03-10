# Sistema planetario con cámara libre
Practica 4 de CIU
# CIU - Práctica 4
# Rubén García Quintana

## Visualización de sistema planetario desde una camara libre.

Esta práctica consiste en crear una opción de cámara libre para el sistema planetario desarrolado en la anterior práctica.

Aqui podemos ver un gif con una pequeña demostración de su ejecución. 

![](planetas.gif)


### Desarrollo de la práctica

Para la realización de esta práctica, se ha usado como base la práctica 3 desarrollada anteriormente y se le ha añadido una opción para pode navegar por el sistema planetario.

Para el desarrollo de la práctica se ha añadido una variable que funcione como selector de modo libre o el modo de observación normal.

Para el desarrollo de la camara se ha utilizado el metodo "camera()" que nos permite posicionar la vision de nuestro modelo 3D.


Con la siguiente linea de código creamos nuestra cámara que tendrá como parametros las distintas variables que el usuario puede ir editando gracias al metodo actualizaCamara().

```
camera( width/2.0 -x, height/2-y,z,z,0,x2,0,1,0);
```


```
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
```
