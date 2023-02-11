void setup(){
size(1000,1000);
//noLoop();
}

int i = 0;
float K = random(0,1)*1234;

void draw(){
//background(50);
noStroke();
rec_circle(width/2,height/2,250,4, color(255,165,0));
rec_circle(width/2,height/2,200,5, color(255,20,20));
rec_circle(width/2,height/2,170,5, color(0,0,0));
i ++;
K++;
}




void rec_circle(float x, float y, float size, int level, color col){
  //col = changecolor(col,level);
  translate(x,y);
  rotate(PI/500*i);
  fill(col);
    ellipse(0,0,size,size);
    if(level > 1){
        rec_circle(x/2,y/2, size/3*2*noise(K/100), level-1, col);
        rec_circle(-x/2,y/2, size/3*2*noise(K/100+100), level-1, col);
        rec_circle(x/2,-y/2, size/3*2*noise(K/100+100000), level-1, col);
        rec_circle(-x/2,-y/2, size/3*2+noise(K/100-124), level-1, col);
    }
    rotate(-PI/500*i);
    translate(-x,-y);
}


color changecolor(color col, int level){
float r = red(col)/255;
float g = green(col)/255;
float b = blue(col)/255;

print(r);
float[] change = new float[]{-0.1,0,0.1};

r += change[int(random(0,3))];
g += change[int(random(0,3))];
b += change[int(random(0,3))];

r = r<= 1 ? r : 1;
r = r>=0 ? r : 0;

g = g<= 1 ? g : 1;
g = g>=0 ? g : 0;

b = b<= 1 ? b : 1;
b = b>=0 ? b : 0;

//r = ((255*noise(K+level*10)));
//g = ((255*noise(K*4+level*10)));
//b = ((255*noise(K*17+level*10)));

print(r);
K++;
return color(r*255,g*255,b*255,70);

}
