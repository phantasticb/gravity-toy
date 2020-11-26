class Body {
  PVector loc;
  PVector vel;
  PVector accel;
  color c = color(255, 255, 255);
  
  Body(float x, float y) {
    loc = new PVector(x, y);
    vel = new PVector(0, 0);
    accel = new PVector(0, 0);
  }
  
  void setVelocity(float x, float y) {
    vel.set(x, y);
  }
  
  void orbit() {
    
  }
  
  void display() {
    fill(c);
    circle(loc.x, loc.y, 10);
  }
  
  void resetColor() {
    c = color(255, 255, 255);
  }
  
  void mush() {
    c = color(255, 0, 0);
    PVector thrust = vel.normalize(null).mult(0.01);
    print(thrust);
    vel.add(thrust);
  }
  
  void heel() {
    c = color(0, 0, 255);
    PVector thrust = vel.normalize(null).mult(0.01);
    vel.sub(thrust);
  }
  
  void tick() {
    attract();
    display();
  }
  
  void attract() {
    PVector self = new PVector(loc.x, loc.y);
    PVector sun = new PVector(width/2, height/2);
    PVector toSun = sun.sub(self);
    
    float magnitude = G / pow(toSun.mag(), 2);
    // print(magnitude);
    toSun.setMag(magnitude);
    
    vel.add(toSun);
    loc.add(vel);
  }
}
