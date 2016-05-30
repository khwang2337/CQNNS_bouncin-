
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
  
  void draw() {
    if (state != DEAD) {
      ellipse(x,y,rad,rad);
      fill(c);
    }
  }
  
  void process() {
    if (state == MOVING) move();
    else if (state == GROWING) {
      rad+=.3;
      if (rad >= 50) state = SHRINKING;
    }
    else if (state == SHRINKING) {
      rad-=.3;
      if (rad <= 0) state = DEAD;
    }
  }
  
  void bounce() {
    if (x >= width || x<= 0) dx = -dx;
    if (y >= height || y<= 0) dy = -dy;
  }
 
 
 boolean isTouching( Ball other ) {
 return Math.sqrt(Math.pow((x-other.x)*2,2) + Math.pow((y-other.y)*2, 2)) <= 10+other.rad;
 }
 
  
}//end class Ball