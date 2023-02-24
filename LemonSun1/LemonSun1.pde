void setup(){
size(900,900);
background(25);

noLoop();





translate(width/2, height/2);
rotate(PI/15*6.5);
stroke(25);
strokeWeight(9);

fill(255,255,29);
ellipse(0,0, 830, 830);

fill(235,180,10);
ellipse(0,0,800,800);
int parts = 15;

//rotate(PI*2/parts);

for( int i = 0; i < parts; i++){

  stroke(25);
  strokeWeight(7);
  line(0,0, 395,0);
  rotate(PI*2/parts);
noFill();
arc(0,0,200,200,0,PI*2/parts);

}
noFill();

stroke(15);
ellipse(0,0, 800, 800);


}


void draw(){}
