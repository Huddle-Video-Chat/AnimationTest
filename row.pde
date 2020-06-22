class Row {
  ArrayList<Circle> c = new ArrayList<Circle>();
  float x;
  float y;
  
  Row(float _x, float _y) {
    x = _x;
    y = _y;
  }
  
  void draw() {
    for (Circle cl : c) {
      cl.show();
      cl.move();
    }
  }
  
  void add(Circle _c) {
    c.add(_c);
    
    float size = -(c.size() * 100)/2;
    
    for (Circle cl : c) {
      cl.setDestination(x + size + 50, y);
      size += 100;
    }
  }
}
