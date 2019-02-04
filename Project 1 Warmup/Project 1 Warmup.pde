Coord sphere;
int dir = 1;
int prevTime = 0;
int currentTime = 0;
float dampening = 0.95;

void setup() {
  size(400, 400,P3D);
  background(255);
  PVector loc = new PVector(300,300,0);
  PVector vel = new PVector(-30,-500,0);
  PVector accel = new PVector(0,200,0);
  sphere = new Coord(loc,vel,accel);
}

void draw(){
    prevTime = currentTime;
    currentTime = millis(); //<>//
    ComputePhysics();
    pushMatrix();
    noStroke();
    lights();
    background(255);
    translate(sphere.loc.x, sphere.loc.y, sphere.loc.z);
    sphere(30);
    popMatrix();
}

void ComputePhysics(){
    sphere.updateVel(currentTime - prevTime);
    sphere.updateLoc(currentTime - prevTime); //<>//
    //sphere.updateVel(30);
    //sphere.updateLoc(30);
}

class Coord {
  PVector loc;
  PVector vel;
  PVector accel;
  
  Coord(PVector loc, PVector vel, PVector accel){
    this.loc = loc;
    this.vel = vel;
    this.accel = accel;
  }
  
  public void updateVel(int millisElapsed){ //<>//
    PVector tempAccel = this.accel.copy();
    tempAccel.mult((float)millisElapsed/1000.0);
    this.vel.add(tempAccel); //tempAccel.mult(millisElapsed/1000)
  } //<>//
  public void updateLoc(int millisElapsed){
    PVector tempVel = this.vel.copy(); //<>//
    tempVel.mult((float)millisElapsed/1000.0);
    this.loc.add(tempVel); //.mult(millisElapsed/1000)
     //<>//
    //collision with floor
    if (this.loc.y>=350){
      this.vel.y = -abs(this.vel.y)*dampening;
      this.loc.y = 350;
      println("Y velocity: ", this.vel.y);
    }
    //collision with walls
    if (this.loc.x>=350){
      this.vel.x = -abs(this.vel.x)*dampening;
      this.loc.x = 350;
    }
    if (this.loc.x<=50){
      this.vel.x = abs(this.vel.x)*dampening;
      this.loc.x = 50;
    }
    
    if (this.loc.x>=360 || this.loc.x<=40 || this.loc.y>=360){
      this.loc.x = 200;
      this.loc.y = 200;
      this.loc.z = 0;
    }
  }
}

//class Coord {
//  float xloc;
//  float yloc;
//  float zloc;
//  float xvel;
//  float yvel;
//  float zvel;
//  float xaccel;
//  float yaccel;
//  float zaccel;
  
//  Coord(float coordx, float coordy, float coordz, float xvel, float yvel, float zvel, float xaccel, float yaccel, float zaccel){
//    xloc = coordx;
//    yloc = coordy;
//    zloc = coordz;
//    this.xvel = xvel;
//    this.yvel = yvel;
//    this.zvel = zvel;
//    this.xaccel = xaccel;
//    this.yaccel = yaccel;
//    this.zaccel = zaccel;
    
//    PVector loc = 
//    PVector vel =
//    Pvector
//  }
  
//  public void updateVel(int millisElapsed){
//    this.xvel = this.xvel + this.xaccel*(millisElapsed)/1000;
//    this.yvel = this.yvel + this.yaccel*(millisElapsed)/1000;
//    this.zvel = this.zvel + this.zaccel*(millisElapsed)/1000;
//  }
//  public void updateLoc(int millisElapsed){
//    this.xloc = this.xloc + this.xvel*(millisElapsed)/1000;
//    this.yloc = this.yloc + this.yvel*(millisElapsed)/1000;
//    this.zloc = this.zloc + this.zvel*(millisElapsed)/1000;
    
//    //collision with floor
//    if (this.yloc>=350){
//      this.yvel = -abs(this.yvel)*0.8;
//      this.yloc = 350-(this.yloc-350)*0.8;
//    }
//    //collision with walls
//    if (this.xloc>=350){
//      this.xvel = -abs(this.xvel)*0.8;
//      this.xloc = 350-(this.xloc-350)*0.8;
//    }
//    if (this.xloc<=50){
//      this.xvel = abs(this.xvel)*0.8;
//      this.xloc = (50-this.xloc)*0.8+50;
//    }
//  }
//}
