ArrayList<Cluster> c = new ArrayList<Cluster>();
Circle grabbed;

void setup() {
  size(1920, 1080);

  Cluster c1 = new Cluster(320,180);
  c1.add(new Circle(100,100));
  c1.add(new Circle(100,100));
  c1.add(new Circle(100,100));
  c1.add(new Circle(100,100));
  c1.add(new Circle(100,100));
  c1.add(new Circle(100,100));
  
  Cluster c2 = new Cluster(720, 720);
  c2.add(new Circle(100,100));
  c2.add(new Circle(100,100));
  c2.add(new Circle(100,100));
  
  c.add(c1);
  c.add(c2);
}

void draw() {
  background(0);
  for (Cluster cl : c) {
    cl.draw();
  }
  
  if (grabbed != null) {
    grabbed.show();
    grabbed.set(mouseX, mouseY);
  }
}

void mousePressed() {
  for (Cluster clr : c) {
    if (clr.within(mouseX, mouseY)) {
      grabbed = clr.grab(mouseX, mouseY);
      break;
    }
  }
}

void mouseReleased() {
  if (grabbed != null) {
    for (Cluster clr : c) {
      if (clr.within(mouseX, mouseY)) {
        clr.add(grabbed);
        grabbed = null;
        break;
      }
    }
    
    if (grabbed != null) {
      Cluster newCluster = new Cluster(mouseX, mouseY);
      newCluster.add(grabbed);
      c.add(newCluster);
      grabbed = null;
    }
  }
}
