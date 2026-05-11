class Target {
  int tx, ty, xs, ys, r, g, b ;
  float rs, gs, bs;
  char type1, type2;
  PImage jeff;

  Target( int tx, int ty) {
    this.tx= tx;
    this. ty= ty;
    xs=3;
    ys=2;
    r = int(random(15, 230));
    g = int(random(15, 230));
    b = int(random(15, 230));
    rs = random(-3, 3);
    gs = random(-3, 3);
    bs = random(-3, 3);
    type1= 'b';
    type2 ='g';
    jeff = loadImage("Germaphobe.png");
  }

  void display() {
    fill (r, g, b);
    noStroke();
    //ellipse(tx, ty, 20, 20);
    imageMode(CENTER);
    image(jeff,tx,ty);
  }
  void move() {
    PVector dude = new PVector(tx, ty);
    PVector them = new PVector (mouseX, mouseY);
    PVector move = PVector.sub(them, dude);
    move.normalize();
    move.mult(10); 
    tx+=move.x;
    ty+=move.y;
    //if (type1=='r'||type2=='r') {r+=rs;
    //}
    ////else r = 1;
    //if (type1=='g'||type2=='g'){g+=gs;
    //}//else g = 1;
    //if (type1=='b'||type2=='b'){b+=bs;
    //}//else b = 1;
    //if (type1=='r'||type2=='r')if (r>240||r<10) {
    //  rs*=-1;
    //  r+=rs*2;
    //}
    //if (type1=='g'||type2=='g')if (g>240||g<10) {
    //  gs*=-1;
    //  g+=gs*2;
    //}
    //if (type1=='b'||type2=='b') if (b>240||b<10) {
    //  bs*=-1;
    //  b+=bs*2;
    //}
    if (tx<5||tx>width-5) {
      xs*=-1;
    }
    if (ty<5||ty>height-5) {
      ys*=-1;
    }
  }

void move2() {
    PVector dude = new PVector(tx, ty);
    PVector them = new PVector (x, y);
    PVector move = PVector.sub(dude, them);
    move.normalize();
    move.mult(8); 
    tx+=move.x;
    ty+=move.y;
tx= constrain (tx,25,975);
ty = constrain (ty,50,750);
}


boolean whacked() {

  float d=dist(x,y,tx,ty);

    if (d<50) {return true;}
    else {return false;}

}

boolean smacked() {
float d2 = dist(x2,y2,tx,ty);
    if (d2<50) {return true;}
    else {return false;}

}
}
