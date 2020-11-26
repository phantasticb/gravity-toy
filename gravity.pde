Sun sun = new Sun(2500);
final float G = sun.getMass();
Planet planet;
Body ship;
int bJ = 0;

void setup() {
  frameRate(100);
  print("JIG Simulator b1.0");
  size(1500, 1000);

  ship = new Body(width/2, 800);
  ship.setTrailLength(150);
  ship.setVelocity(-1, 0);
  
  planet = new Planet(25, width/2, 100);
  planet.setTrailLength(150);
  planet.setVelocity(2.5, 0);
}

void draw() {
  background(0);
  sun.display();
  
  planet.tick();
  ship.tick();
  
  textSize(24);
  fill(0, 255, 0);
  text("Fuel Used: " + bJ, 50, 50);
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
