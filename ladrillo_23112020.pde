Ladrillo ld1;
Pelota pelota;
Raqueta raqueta;

PImage fondo, manzana, gameover, mario;

boolean ban=false;
String msg="Bienvenido";
ArrayList ladrillos;
int numeroDeLadrillos;
int idcount = 0;
int lifes = 3, points;
PFont pro;

public void setup(){
   fondo = loadImage("persia.jpg");
   manzana = loadImage("manzana.png");
   gameover = loadImage("gameover.png");
   mario = loadImage("mario.png");
   
   pro = createFont("FFFFORWA.ttf", 15);
   textFont(pro);
    
   numeroDeLadrillos = 8;
   size(533,300);
   ladrillos = new ArrayList();
   
     
   for(int i = 0; i < numeroDeLadrillos; i++){
        ld1 = new Ladrillo(27+(60 * i),70, 60, 20, i);
        ladrillos.add(ld1);
    }
    for(int j = 0; j < numeroDeLadrillos; j++){
        ld1 = new Ladrillo(27+(60 * j),90, 60, 20, j);
        ladrillos.add(ld1);
    }
    for(int y = 0; y < numeroDeLadrillos; y++){
        ld1 = new Ladrillo(27+(60 * y),110, 60, 20, y);
        ladrillos.add(ld1);
    }
    
   raqueta = new Raqueta(width/2-50, height-20,60,10);
    msg= "hola";
   pelota = new Pelota(width/2, height-40,10);
 
}

public void draw(){
   background(fondo);
   for(int i = 0; i < lifes; i++)
     image(manzana, i*25+5, 16, 30, 30);
   
   if(lifes > 0 && points < 1200){
     fill(106,255,61);
     text(points, width-70, 45);
     for(int i=0; i <ladrillos.size();i++){
      ld1 = (Ladrillo)ladrillos.get(i);
      ld1.dibujarLadrillo();
     }
     
     raqueta.dibujarRaqueta();
     pelota.dibujarPelota();
     fill(0);
   
     for(int i=0; i < ladrillos.size();i++){
     ld1 = (Ladrillo)ladrillos.get(i);
     if(ld1.colisionPelota(pelota)){
       // msg ="colision";
        ladrillos.remove(ld1);
        points += 50;
     }
   }
   raqueta.colisionPelota(pelota);
   if(pelota.colisionAbajo())
     lifes--;
   }
   
   else if(lifes == 0 || points == 1200 ){
      if(lifes == 0){
        image(gameover, 65, 60);
        fill(106,255,61);
        text("PUNTUACION: " + points, 180, height/2+10);
      }
      else{
        image(mario, 225, 15);
        fill(106,255,61);
        text("¡¡GANASTE!!", 210, height/2+10);
      }
      fill(106,255,61);
      rect(width/2-50,height/2+22, 100, 25);
      rect(width/2-50,height/2+52, 100, 25);
      fill(0);
      text("REINICIAR", width/2-45, height/2+45);
      text("SALIR", width/2-25, height/2+75);
      
      if(mouseX > width/2-50 && mouseX < width/2-40+100 && mouseY > height/2+22 && mouseY < height/2+22+25 && mousePressed==true){
        lifes = 3;
        points = 0;
        pelota.ubicacion.x = width/2;
        pelota.ubicacion.y = height-40;
        setup();
        draw();
      }
      
      if(mouseX > width/2-50 && mouseX < width/2-40+100 && mouseY > height/2+52 && mouseY < height/2+52+25 && mousePressed==true){
        exit();
      }
   }
 /*  if(ban)
      fill(0,255,0);
   else
      fill(255,0,0);
   text(msg,100,40);
*/
}


public void mouseClicked(){
      msg = "No has selecionado ningun ladrillo.";
      ban = false;
      int k=-1;
      for(int i=0; i < ladrillos.size();i++){
          ld1 = (Ladrillo)ladrillos.get(i);
          if(ld1.isLadrillo(mouseX, mouseY)){
             ban = true;
             k = ld1.id;
             msg = "Estas en el ladrillo "+ k;
             ladrillos.remove(ld1);            
             break;
          }      
      }
}

void keyPressed(){
    if(keyCode == LEFT && raqueta.x > 0){
        msg="IZQUIERDA";
        raqueta.x -= 50;
    }
    if(keyCode == RIGHT && raqueta.x < 450){
        msg="DERECHA";
        raqueta.x += 50;
    }    
}
