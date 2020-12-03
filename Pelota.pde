class Pelota{
    float x_pos;
    float y_pos;
    float velocidad_x;
    float velocidad_y;
    float diametro;
    PVector ubicacion; // Vector estático
    PVector velocidad;  //Vector dinámico
    Pelota(float a, float b, float c){
       x_pos = a;
       y_pos = b;
       diametro = c;
       ubicacion = new PVector(a,b);
       velocidad = new PVector(2.5,5);
    }  
    void dibujarPelota(){
       ubicacion.add(velocidad);
       ellipse(ubicacion.x, ubicacion.y, diametro, diametro);
       colisionParedes();
    }  
    void colisionParedes(){
        if ( ( ubicacion.x > width-diametro/2 )  || (ubicacion.x < diametro/2)   ){
          velocidad.x *= -1;  
        }
        if ( ( ubicacion.y > height-diametro/2 )  || (ubicacion.y < diametro/2)   ){
          velocidad.y *= -1;  
        }
    }
    
    public boolean colisionAbajo(){
        if ( ( ubicacion.y == height)   )
          return true;
        else
          return false;
    }
}
