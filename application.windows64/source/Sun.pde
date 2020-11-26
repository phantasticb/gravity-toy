class Sun {
  float mass;
  
  Sun(float mass) {
    this.mass = mass;
  }
  
  float getRadius() {
    return sqrt(mass);
  }
  
  float getMass() {
    return this.mass;
  }
  
  void display() {
    fill(255, 255, 0);
    circle(width/2, height/2, getRadius());
  }
}
