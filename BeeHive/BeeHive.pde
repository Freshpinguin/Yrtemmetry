int cols = 30;
int rows = 30;
float cellW;
float cellH;


ArrayList<Particle> k;

void setup(){
  k = new ArrayList();
size(900,900);
background(25);
cellW = width/cols;
cellH = height/rows;



for(int x = 0; x < cols; x++){
  for (int y = 0; y < rows; y++){
    //rect(x*cellW, y*cellH, cellW, cellH);
  }
}
for(int i = 0; i < 100; i++){
  Particle a = new Particle();
  k.add(a);
}
background(25);
}



void draw(){
  noStroke();
  fill(0,1);
//rect(0,0,width,height);


  for (Particle p : k){
  p.draw();
}

}

void mouseClicked(){
save("Images/Bees"+frameCount+".png");
}


class Particle{
  float x;
  float y;
  float dx;
  float dy;
  float ddx;
  float ddy;
  
  float size = 25;
  float dsize = 0;
  Particle(){
    this.x = random(0,width);
    this.y = random(0, height);
    
  }
  
  void draw(){
    stroke(255,165,0);
    fill(10);
   ellipse(this.x,this.y, size,size);
   this.move();
   this.size += this.dsize;
  
  }
  
  void move(){
  this.x += dx;
  this.y += dy;
  
  this.dx += ddx;
  this.dy += ddy;
  
  if(this.x > width+size || this.x+size < 0){
  this.x = random(0,width);
}
  if(this.y > size+height || this.y+size < 0){
  this.y = random(0, height);}
  float div = 100;
  
  this.ddy = noise(this.x/div ,this.y/div, frameCount/1000)-0.5;
  this.ddx = noise(this.y/div,this.x/div+12314, frameCount/1000)-0.5;
  
  this.dx += 2*random(-0.1,0.1);
  this.dy += 2*random(-0.1, 0.1);

  
  float len = sqrt(dx*dx + dy*dy);
  this.dx /= len;
  this.dy /= len;
  
  this.dx *= 3;
  this.dy *= 3;
    if (size > 10) {
  //this.dsize = -0.1;
  }
  this.size = 200*noise(this.x/300, this.y/300);
  
  }
  

  
}
