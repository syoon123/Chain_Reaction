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
 
 void bounce() {
   if (x<=0 || x >= 600) {
     dx = -dx;
   }
   if (y<=0 || y>=600) {
     dy = -dy;
   }
 }
 
 boolean isTouching( Ball other ) {
   if ((other.state==1 || other.state==2) && (rad+other.rad)/2 > dist(x,y,other.x,other.y)) {
     return true;
   }
   return false;
 }
 

 void process() {
   if (state == 0) {
     move();
     fill(c);
     noStroke();
     ellipse(x,y,2*rad,2*rad);
   }
   if (state == 1) {
     if (rad<50) rad+=0.25;
     else state = 2;
     fill(c);
     noStroke();
     ellipse(x,y,2*rad,2*rad);
   }
   if (state == 2) {
     if (rad>0) rad-=0.25;
     else state = 3;
     fill(c);
     noStroke();
     ellipse(x,y,2*rad,2*rad);
   }
 }
     
  
}//end class Ball