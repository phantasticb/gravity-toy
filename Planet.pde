class Planet extends Body {
  float mass;

  Planet(float mass, float x, float y) {
    super(x, y);
    this.mass = mass;
  }

  float getRadius() {
    return 3 * mass;
  }

  float getMass() {
    return this.mass;
  }
  
  PVector getLocation() {
    return loc;
  }

  void tick() {
    trail.add(new TrailPiece(loc.copy(), c));
    if (trail.size() > tLen) { 
      trail.remove(0);
    }
    sunAttract();
    display();
    for ( TrailPiece l : trail ) {
      l.drawPiece();
    }
  }

  void display() {
    fill(255, 255, 0);
    circle(loc.x, loc.y, 5);
  }

  void sunAttract() {
    PVector self = new PVector(loc.x, loc.y);
    PVector sun = new PVector(width/2, height/2);
    PVector toSun = sun.sub(self);

    float magnitude = G / pow(toSun.mag(), 2);
    toSun.setMag(magnitude);

    vel.add(toSun);
    loc.add(vel);
  }
}
