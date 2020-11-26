class Body {
  PVector loc;
  PVector vel;
  PVector accel;
  int tLen;
  color c = color(255, 255, 255);

  class TrailPiece {
    PVector loc;
    color col;

    TrailPiece(PVector l, color c) {
      loc = l;
      col = c;
    }

    void drawPiece() {
      fill(col);
      circle(loc.x, loc.y, 3);
    }
  }

  ArrayList<TrailPiece> trail = new ArrayList<TrailPiece>();

  Body(float x, float y) {
    tLen = 100;
    loc = new PVector(x, y);
    vel = new PVector(0, 0);
    accel = new PVector(0, 0);
  }
  
  void setTrailLength(int x) {
    tLen = x;
  }

  void setVelocity(float x, float y) {
    vel.set(x, y);
  }

  void orbit() {
  }

  void display() {
    fill(c);
    circle(loc.x, loc.y, 5);

    for ( TrailPiece l : trail ) {
      l.drawPiece();
    }
  }

  void resetColor() {
    c = color(255, 255, 255);
  }

  void mush() {
    c = color(255, 0, 0);
    PVector thrust = vel.normalize(null).mult(0.01);
    vel.add(thrust);
  }

  void heel() {
    c = color(0, 255, 255);
    PVector thrust = vel.normalize(null).mult(0.01);
    vel.sub(thrust);
  }

  void tick() {
    trail.add(new TrailPiece(loc.copy(), c));
    if (trail.size() > tLen) { 
      trail.remove(0);
    }
    
    sunAttract();
    planetAttract(planet);
    display();
  }

  void sunAttract() {
    PVector self = new PVector(loc.x, loc.y);
    PVector sun = new PVector(width/2, height/2);
    PVector toSun = sun.sub(self);

    float magnitude = G / pow(toSun.mag(), 2);
    // print(magnitude);
    toSun.setMag(magnitude);

    vel.add(toSun);
    loc.add(vel);
  }
  
  void planetAttract(Planet p) {
    PVector self = new PVector(loc.x, loc.y);
    PVector planet = p.getLocation().copy();
    PVector toPlanet = planet.sub(self);

    float magnitude = p.getMass() / pow(toPlanet.mag(), 2);
    toPlanet.setMag(magnitude);

    vel.add(toPlanet);
    loc.add(vel);
  }
}
