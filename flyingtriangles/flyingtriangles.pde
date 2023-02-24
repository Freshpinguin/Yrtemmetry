float x = 400;
float y = 400;
float dx = 0.5;
float dy = 0;
float ddx = 0;
float ddy = 0;
float angle = 0;
float dangle = 0;




int rows = 20;
int cols = 20;
float rowS;
float colS;
float PIPI = 0;
void setup(){
  size(900,900);
  surface.setLocation(100, 100);
  background(0);
  
  colS = width/cols;
  rowS = height/rows;

}

float angle(float x1,float y1,float x2, float y2){
  return acos((x1*x2+y1*y2)/len(x1,y1)*len(x2,y2));
}

float len(float x, float y){
  return sqrt(x*x + y*y);
}

float angle(PVector v1, PVector v2) {
  float a = atan2(v2.y, v2.x) - atan2(v1.y, v1.x);
  if (a < 0) a += TWO_PI;
  return PI-a;
}

void draw(){
  background(0);
  PIPI += 0.1;
  float angl = angle(new PVector(dx,dy), new PVector(1,0));
  //
  for(int cx = 0; cx < rows; cx++){
    for(int cy = 0; cy < cols; cy++){
      push();
      translate(cx*rowS,cy*colS);
      rect(0,0,rowS, colS);
      translate(rowS/2, colS/2);
      if( x < (cx+1)*rowS &&  x > cx*rowS && y < (cy+1)*colS && y > cy*colS){
      rotate(PI+angl);
      } 
      //rotate(PIPI);
      quad(3*rowS/8,0,-rowS/6,colS/4,0,0, -rowS/6,-colS/4);
      pop();
    }
  }
  
  
  
  
  //
  
  fill(255,160,0,70);
  //float angl = angle(new PVector(-mouseX+x,-mouseY+y), new PVector(x,y));
  
  translate(x,y);
  rotate(angl);
translate(-x,-y);
stroke(70,20,1);
  quad(x,y,x+30,y+15,x+15,y,x+30,y-15);

  x += dx;
  y += dy;
  dx += ddx;
  dy += ddy;
  
  ddx += random(-1,1)/100;
  ddy += random(-1,1)/100;
  
  dx /= len(dx,dy);
  dy /= len(dx,dy);
  
  ddx/= len(ddy,ddx)*10;
  ddy/= len(ddx,ddy)*10;
  
  

}


class VectorField{
  
  class Vector{
  
  
  
  
  }
  
  
  Vector [][] fields;











}
