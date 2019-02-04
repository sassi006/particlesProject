float x = 70;
float centerX = 50.0;

PVector cameraloc = new PVector(70,35,120);
PVector cameraCenter = new PVector(50,50,0);

PVector mousePos = new PVector(0,0);
PVector mouseDist = new PVector(0,0);

void setup(){
  size(400, 400,P3D);
}

void draw(){
  pushMatrix();
  noStroke();
  lights();
  fill(100,100,100);
  background(255);
  camera(cameraloc.x, cameraloc.y, cameraloc.z, cameraCenter.x, cameraCenter.y, cameraCenter.z, 
       0.0, 1.0, 0.0);
  
  translate(50, 50, 0);
  //rotateX(-PI/6);
  //rotateY(PI/3);
  box(50);
  popMatrix();
  
   float z = cameraloc.z-cameraCenter.z;
   float x = cameraloc.x-cameraCenter.x;
   float HorAngle = tan(z/x); //<>//
   //HorAngle = (HorAngle+(mouseDist.x/1000))%1;
   //HorAngle += radians(0);
   float radius = sqrt(pow(x,2)+pow(z,2));
   cameraloc.x =  radius * cos(HorAngle) + cameraCenter.x;
   cameraloc.z = radius * sin(HorAngle) + cameraCenter.z;
   println(cameraloc.x, cameraloc.z);
   
   
}

void mouseMoved(){
  mousePos.x = mouseX;
  mousePos.y = mouseY;
}
void mouseDragged(){
  if (mouseButton == LEFT){
     mouseDist.x = mouseX - mousePos.x;
     mouseDist.y = mouseY - mousePos.y;
     
     float z = cameraloc.z-cameraCenter.z;
     float x = cameraloc.x-cameraCenter.x;
     float HorAngle = tan(z/x);
     HorAngle = (HorAngle+(mouseDist.x/1000))%1;
     //HorAngle += radians(0);
     float radius = sqrt(pow(x,2)+pow(z,2));
     cameraloc.x =  radius * cos(HorAngle) + cameraCenter.x;
     cameraloc.z = radius * sin(HorAngle) + cameraCenter.z;
     println(cameraloc.x, cameraloc.z); //<>//
  }
  mousePos.x = mouseX;
  mousePos.y = mouseY;
}
