class Circle {
  float x;
  float y;
  float r;
  final float snapSize = 100;
  final float startSnapSpeed = 0.1;
  float snapSpeed = 0.1;
  final float snapAcc = 1.2;
  
  float dX;
  float dY;
  final float momentumDecay = 0.98;
  final float momentumMultiplier = 0.5;
  
  boolean moveToDest;
  float destX;
  float destY;
  
  Circle(float _x, float _y) {
    set(x, y);
    r = 50;
    moveToDest = false;
  }
  
  void show() {  
    fill(255);
    ellipse(x,y,r*2,r*2);
    fill(255,0,0);
    ellipse(destX, destY, 5, 5);
  }
  
  void move() {
    if (moveToDest) {
      x -= (x - destX)*snapSpeed - dX*momentumMultiplier;
      y -= (y - destY)*snapSpeed - dY*momentumMultiplier;
      
      if (snapSpeed + snapAcc < 1) {
        snapSpeed *= snapAcc;
      }
      
      dX *= momentumDecay;
      dY *= momentumDecay;
      
      if (dist(x, y, destX, destY) < 0.1) {
        moveToDest = false;
        snapSpeed = startSnapSpeed;
      }
    }
  }
  
  void snap() {
    setDestination(
      round(x/snapSize)*snapSize, 
      round(y/snapSize)*snapSize
    );
  }
  
  void setDestination(float _x, float _y) { 
    destX = _x;
    destY = _y;
    moveToDest = true;
  }
  
  void set(float _x, float _y) {
    dX = _x-x;
    dY = _y-y;
    
    x = _x;
    y = _y;
  }
  
  boolean within(float mx, float my) {
    return (mx <= x + r) && (mx >= x - r) && (my <= y + r) && (my >= y - r); 
  }
 
}
