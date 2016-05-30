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
    
    ellipse(x,y,2*rad, 2*rad);
    state = MOVING;
  }
  

  void move() {
    x = x + dx;
    y = y + dy;
    bounce();
  }
 
 void explode() {
   state = GROWING;
   while (rad < 30) {
    rad++;
   }
   state = SHRINKING;
   while (rad > 0) {
     rad--;
   }
   state = DEAD;
 }
 
 void bounce() {
   if (x == 0 || x == 600) {
     dx = -dx;
   }
   if (y==0 || y == 600) {
     dy = -dy;
   }
 }
 
 boolean isTouching( Ball other ) {
   if ((dist(x, y, other.x, other.y) == rad + other.rad) && 
   (other.state==GROWING || other.state == SHRINKING)) {
      return true;
   }
   else return false;
 }
 
  
}//end class Ball