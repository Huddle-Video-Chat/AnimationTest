class Cluster {
  ArrayList<Circle> c = new ArrayList<Circle>();
  float x;
  float y;
  
  Cluster(float _x, float _y) {
    x = _x;
    y = _y;
  }
  
  int nextSquareRoot(int num) {
    if (Math.floor(sqrt(num)) == sqrt(num)) {
        return (int) Math.floor(sqrt(num));
    } else {
        return (int) Math.floor(sqrt(num)) + 1;
    }
  }
    
    
  ArrayList<Integer> getArrangement() {
      int num = c.size();
      
      ArrayList<Integer> arr = new ArrayList<Integer>();
      int nsr = nextSquareRoot(num);

      while (num != 0) {
          int row = min(nsr, num);
          num -= row;
          arr.add(row);
      }
          
      return arr;
  }
  
  void arrange() {
    int index = 0;
    ArrayList<Integer> arr = getArrangement();
    float sizeY = -(arr.size() * 100)/2;
    for (int row = 0; row < arr.size(); row++) {
      if (row > 0 && arr.get(row) % 2 != arr.get(row-1) % 2) {
        sizeY -= 11;
      }
      
      float sizeX = -(arr.get(row) * 100)/2;
      for (int i = 0; i < arr.get(row); i++) {
        c.get(index).setDestination(x + sizeX + 50, y + sizeY + 50);
        sizeX += 100;
        index++;
      }
      sizeY += 100;
    }
  }
  
  boolean within(float mX, float mY) {
    return dist(mX, mY, x, y) <= 2*nextSquareRoot(c.size())*100/sqrt(2);
  }
    
  Circle grab(float mX, float mY) {
    for (Circle cl : c) {
      if (cl.within(mX, mY)) {
        remove(cl);
        return cl;
      }
    }
    
    return null;
  }
  
  void draw() {
    fill(0,0,255);
    float size = 2*nextSquareRoot(c.size())*100/sqrt(2);
    ellipse(x,y,size,size);
    for (Circle cl : c) {
      cl.show();
      cl.move();
    }
  }
  
  void remove(Circle _c) {
    c.remove(_c);
    arrange();
  }
  
  void add(Circle _c) {
    c.add(_c);
    arrange();
  }
}
