ArrayList<painter> lista = new ArrayList<painter>();
void setup() {
  size(1200, 1200);
  pixelDensity(1);
  background(30);

  for(int i = 0; i < 500 ; i++){
     // painter pai = new painter(300,300);
  //lista.add(pai);
  }
}

void draw() {
  for(int i = 0; i < lista.size(); i++){
    painter pai = lista.get(i);
    pai.draw();
  pai.move();
  //pai.fill = ChangeColor(pai.fill);
  if(pai.size <= 5 && frameCount >= 300){
  lista.remove(i);
}
  
  }  
  
  for(int i = 0; i < lista.size(); i++){
    
  }
}

void mouseClicked(){
//save("Images/worms"+frameCount+".png");
for (int i = 0; i < 3; i++){
  painter pai = new painter(mouseX, mouseY);
  lista.add(pai);
}
}


class painter{
  float x;
  float y;
  float dy;
  float dx;
  float size = 30;
  float dsize = 0;
  color stroke = color(0);
  color fill = color(255,165,0);

painter(
  float x,
  float y)
  {
    this.x = x;
    this.y = y;
    this.dx = random(-1,1);
    this.dy = random(-1,1);
}

void draw(){

stroke(this.stroke);
fill(this.fill);
ellipse(this.x, this.y, this.size/2, this.size/2);
}

void move(){
this.x += this.dx;
this.y += this.dy;
this.dx += 3*random(-0.1,0.1);
this.dy += 3*random(-0.1,0.1);
this.size += this.dsize;
this.dsize -= 0.5;

  this.toCenter();


}

void toCenter(){
  if( abs(this.x - width/2)+100 > width/2 || abs(this.y - height/2)+100 > height/2) {
  this.dx -= (this.x - width/2)/1000;
  this.dy -= (this.y - height/2)/1000;
  }
  this.dsize -= (this.size -10)/1000;
  
  if (abs(this.dx)+abs(this.dy) > 10){
    this.dx/=2;
    this.dy/=2;
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
