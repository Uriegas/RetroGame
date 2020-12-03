class Raqueta{
    float x,y;
    float ancho, alto;
   
    Raqueta(float a, float b, float c, float d){
        x = a;
        y = b;
        ancho = c;
        alto = d;
    }
   
    public void dibujarRaqueta(){
        fill(27,170,100);
        rect(x,y,ancho,alto); //PRIMITIVA DE GRAFICACION: RECTANGULO
    }
    
    public boolean colisionPelota(Pelota a){
      if ( (a.ubicacion.x + a.diametro/2 > x  && a.ubicacion.x -a.diametro/2 < (x+ancho) )
      && ( a.ubicacion.y-a.diametro/2 < (y+alto) && a.ubicacion.y-a.diametro/2 > y ) ){
        a.velocidad.y = -1*(a.velocidad.y);
        return true;
      }
      if ( (a.ubicacion.x + a.diametro/2 > x  && a.ubicacion.x -a.diametro/2 < (x+ancho) )
      && ( a.ubicacion.y+a.diametro/2 < (y+alto) && a.ubicacion.y+a.diametro/2 > y ) ){
        a.velocidad.y = -1*(a.velocidad.y);
        return true;
      }else if ((a.ubicacion.y+ a.diametro/2 > y && a.ubicacion.y+ a.diametro/2 < y+alto  )
      && ( a.ubicacion.x + a.diametro/2 > x && a.ubicacion.x + a.diametro/2 < x+ancho )){
        a.velocidad.x = -1*(a.velocidad.x);
        return true;
      }
     
      if ((a.ubicacion.y+ a.diametro/2 > y && a.ubicacion.y+ a.diametro/2 < y+alto  )
      && ( a.ubicacion.x - a.diametro/2 < x+ancho && a.ubicacion.x - a.diametro/2 > x )){
        a.velocidad.x = -1*(a.velocidad.x);
        return true;
      }
      return false;

   }
}
