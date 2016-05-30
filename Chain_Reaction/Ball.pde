class Ball {
  
  final static int MOVING = 0;
  final static int GROWING = 1;
  final static int SHRINKING = 2;
  final static int DEAD = 3;
      
  //other constants necessary?
  
  float x;
  float y;
  float rad;
  color c;
  float dx;
  float dy;
  int state;

  
  Ball() {
    float r = random(256);
    float g = random(256);
    float b = random(256);
    c = color( r, g, b );
    
    rad = 10;
    
    x = random( (width - r) + r/2 );
    y = random( (height - r) + r/2 );

    dx = random(10) - 5;
    dy = random(10) - 5;
    
    state = MOVING;
  }
  

  void move() {
    x = x + dx;
    y = y + dy;
    bounce();
  }
 
 
 boolean isTouching( Ball other ) {
   if (Math.pow((x - other.x),2)+Math.pow((y-other.y),2) < Math.pow((rad+other.rad),2)){
     return true;
   }
   else{
     return false;
   }
 }
 
 void draw(){
     ellipse(x,y,rad,rad);
     fill(c);
 }
 void bounce(){
     if (x <= 0 || x >= width){
         dx = -dx;
     }
     if (y <= 0 || y >= height){
         dy = -dy;
     }
 }
 void process(){
   move();
 }
  
}//end class Ball