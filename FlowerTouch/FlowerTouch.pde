ArrayList<painter> lista = new ArrayList<painter>();

float angle = 0;

float mouseXX;
float mouseYY;

float col1 = 1231230;
float col2 = 203;
float col3 = 3230;
int travX = 0;
int travY = 0;

void setup() {
  size(2000, 1200);
  frameRate(60);
  background(30);
  
  
  col1 += random(1230);
  col2 += random(123);
  col3 += random(123123);
  for(int i = 0; i < 500 ; i++){
     // painter pai = new painter(300,300);
  //lista.add(pai);
  }
}

void draw() {
  strokeWeight(0.7);
  noStroke();
  for(painter pai : lista){
    pai.draw();
  pai.move();
  //pai.fill = ChangeColor(pai.fill);
  }  
  
  for(int i = 0; i < lista.size(); i++){
    painter el = lista.get(i);
    if (el.size <= 5){
      lista.remove(i);
    }
  }
  for(int i = 0; i < 5; i ++){
  if(mouseXX >= 2200){
  mouseXX = -200;
  mouseYY += 20;
  }
  if(mouseYY >= 1400){
  return;
  }
  
  mouseXX += 20;
  mouseClicked();
  }
}
  


void mouseClicked(){
//save("Images/worms"+frameCount+".png");
if  (!(pow(abs(mouseXX-width/2),2)+pow(abs(mouseYY-height/2),2)< pow(300,2) )){
for (int i = 0; i < 3; i++){
  angle += PI/20;
  float dx = 2*sin(angle);
  float dy = 2*cos(angle);
  float scale = 2-i/11;
  painter pai = new painter(mouseXX, mouseYY, color(noise(col1)*255, noise(col2)*255, noise(col3)*255), dx, dy, scale/4);
  col1 += 0.0005;
  col2 -= 0.0005;
  col3 += 0.0005;
  lista.add(pai);
}
}
if (mouseButton == RIGHT){
   painter pai = new painter(mouseXX, mouseYY, color(noise(col1)*255, noise(col2)*255, noise(col3)*255), 0,0, 0.8);
  lista.add(pai);
}
}


class painter{
  float x;
  float y;
  float dy;
  float dx;
  float size = 3;
  float dsize = 10;
  float scale;
  color stroke = color(0);
  color fill = color(255,165,0);
  
painter(
  float x,
  float y,
  color fill)
  {
    this.x = x;
    this.y = y;
    this.dx = 20*random(-1,1);
    this.dy = 20*random(-1,1);
    this.fill = fill;
    this.scale = 1;
}
painter(
  float x,
  float y,
  color fill,
  float dx,
  float dy,
  float scale
  )
  {
    this.x = x;
    this.y = y;
    this.dx = dx;
    this.dy = dy;
    this.fill = fill;
    this.scale = scale;
}



void draw(){

  if(this.size > 0 && true)  {
stroke(this.stroke);
fill(this.fill);
ellipse(this.x, this.y, scale*this.size/4, scale*this.size/4);
  }
}

void move(){
this.x += this.dx/2;
this.y += this.dy/2;
this.dx += 5*random(-0.1,0.1);
this.dy += 5*random(-0.1,0.1);
this.size += this.dsize*3;
this.dsize -= 0.05*random(0,1);

  this.toCenter();
if( pow(abs(this.x-width/2),2) +pow(abs(this.y-height/2),2)< pow(300,2)){
  this.dsize -= 10;
}

}

void toCenter(){

  this.dsize -= (this.size -10)/1000;
  
  if (abs(this.dx)+abs(this.dy) > 10){
    this.dx/=5;
    this.dy/=5;
  }
}
}


color ChangeColor(color col){
 float r = red(col)/255;
 float g = green(col)/255;
 float b = blue(col)/255;
 
 r = (r + noise(frameCount/1000+1020))/2;
  g = (g + noise(frameCount/1000))/2;
   b = (b + noise(frameCount/1000 + 32456))/2;
   
   
   return color(r*255,g*255,b*255);

}
