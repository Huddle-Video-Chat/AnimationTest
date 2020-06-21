ArrayList<Circle> c = new ArrayList<Circle>();
Circle grabbed;

void setup() {
  size(640, 360);
  //c = new ArrayList<Circle>();
  c.add(new Circle(100,100));
}

void draw() {
  background(0);
  for (Circle cl : c) {
    cl.show();
    cl.move();
  }
  
  if (grabbed != null) {
    grabbed.set(mouseX, mouseY);
  }
}

void mousePressed() {
  //c.get(0).setDestination(random(640),random(360));

  for (Circle cl : c) {
    if (cl.within(mouseX, mouseY)) {
      grabbed = cl;
      break;
    }
  }
}

void mouseReleased() {
  if (grabbed != null) {
    grabbed.snap();
    grabbed = null;
  }
}
