ArrayList<painter> lista = new ArrayList<painter>();


float col1 = 1231230;
float col2 = 203;
float col3 = 3230;
void setup() {
  size(1500, 800);
  frameRate(120);
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
}

void mouseClicked(){
//save("Images/worms"+frameCount+".png");
for (int i = 0; i < 10; i++){
  painter pai = new painter(mouseX, mouseY, color(noise(col1)*255, noise(col2)*255, noise(col3)*255));
  col1 += 0.05;
  col2 -= 0.05;
  col3 += 0.05;
  lista.add(pai);
}
}


class painter{
  float x;
  float y;
  float dy;
  float dx;
  float size = 3;
  float dsize = 20;
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
}

void draw(){

  if(this.size > 0){
stroke(this.stroke);
fill(this.fill);
ellipse(this.x, this.y, this.size/4, this.size/4);
  }
}

void move(){
this.x += this.dx;
this.y += this.dy;
this.dx += 5*random(-0.1,0.1);
this.dy += 5*random(-0.1,0.1);
this.size += this.dsize;
this.dsize -= 0.05*random(0,1);

  this.toCenter();


}

void toCenter(){
  if( abs(this.x - width/2)+100 > width/2 || abs(this.y - height/2)+100 > height/2) {
  this.dx -= (this.x - width/2)/1000;
  this.dy -= (this.y - height/2)/1000;
  }
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
