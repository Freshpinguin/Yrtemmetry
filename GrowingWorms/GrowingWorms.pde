ArrayList<painter> lista = new ArrayList<painter>();




void setup() {
  size(1000, 1000);

  background(30);

  for(int i = 0; i < 30 ; i++){
      painter pai = new painter(300,300);
  lista.add(pai);
  }
}

void draw() {
  for(painter pai : lista){
    pai.draw();
  pai.move();
  }

  
}


class painter{
  float x;
  float y;
  float dy;
  float dx;
  float size = 60;
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
ellipse(this.x, this.y, this.size, this.size);
}

void move(){
this.x += this.dx;
this.y += this.dy;
this.dx += 3*random(-0.1,0.1);
this.dy += 3*random(-0.1,0.1);
this.size += this.dsize;
this.dsize += random(-0.05,0.05);

  this.toCenter();


}

void toCenter(){
  if( abs(this.x - width/2) > width/2 || abs(this.y - height/2) > height/2) {
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
