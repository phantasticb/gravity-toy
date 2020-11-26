Sun sun = new Sun(2500);
final float G = sun.getMass();
Body ship;
int bJ = 0;

void setup() {
  frameRate(100);
  print("JIG Simulator a1.0");
  size(800, 800);

  ship = new Body(width/2, 300);
  ship.setVelocity(5, 0);
}

void draw() {
  //background(0, 240);
  sun.display();
  ship.tick();
  println(bJ);
}

void keyReleased() {
  ship.resetColor();
}

void keyPressed() {
  if (key == 'w') {
    ship.mush();
    bJ++;
  }
  if (key == 's') {
    ship.heel();
    bJ++;
  }
}
