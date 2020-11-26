import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class gravity extends PApplet {

Sun sun = new Sun(2500);
final float G = sun.getMass();
Body ship;
int bJ = 0;

public void setup() {
  frameRate(100);
  print("JIG Simulator a1.0");
  

  ship = new Body(width/2, 300);
  ship.setVelocity(5, 0);
}

public void draw() {
  //background(0, 240);
  sun.display();
  ship.tick();
  println(bJ);
}

public void keyReleased() {
  ship.resetColor();
}

public void keyPressed() {
  if (key == 'w') {
    ship.mush();
    bJ++;
  }
  if (key == 's') {
    ship.heel();
    bJ++;
  }
}
class Body {
  PVector loc;
  PVector vel;
  PVector accel;
  int c = color(255, 255, 255);
  
  Body(float x, float y) {
    loc = new PVector(x, y);
    vel = new PVector(0, 0);
    accel = new PVector(0, 0);
  }
  
  public void setVelocity(float x, float y) {
    vel.set(x, y);
  }
  
  public void orbit() {
    
  }
  
  public void display() {
    fill(c);
    circle(loc.x, loc.y, 10);
  }
  
  public void resetColor() {
    c = color(255, 255, 255);
  }
  
  public void mush() {
    c = color(255, 0, 0);
    PVector thrust = vel.normalize(null).mult(0.01f);
    print(thrust);
    vel.add(thrust);
  }
  
  public void heel() {
    c = color(0, 0, 255);
    PVector thrust = vel.normalize(null).mult(0.01f);
    vel.sub(thrust);
  }
  
  public void tick() {
    attract();
    display();
  }
  
  public void attract() {
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
class Sun {
  float mass;
  
  Sun(float mass) {
    this.mass = mass;
  }
  
  public float getRadius() {
    return sqrt(mass);
  }
  
  public float getMass() {
    return this.mass;
  }
  
  public void display() {
    fill(255, 255, 0);
    circle(width/2, height/2, getRadius());
  }
}
  public void settings() {  size(800, 800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "gravity" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
