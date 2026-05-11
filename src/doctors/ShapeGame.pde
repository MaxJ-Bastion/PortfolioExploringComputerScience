//Maxwell Johnson | March 3 | ShapeGame
int x, y, xs, ys, score,score2, score3,x2,y2;
boolean u, d, l, r,u2,d2,l2,r2;
PImage crobey, viry, background;
char screen;

ArrayList<Target> targets = new ArrayList<Target>();

void setup() {
  size (1000, 800);
  background(#0055FF);
  x=width/2-50;
  y=width/2;
  
  x2=width/2+50;
  y2=width/2;
  
  xs=10;
  ys= 10;
  targets.add(new Target (100, 100));
  score = 0;
  score2= 0;
  score3 =0;
  crobey = loadImage("Microbe.png");
  viry = loadImage("Virus.png");
  background= loadImage("DoctorsOrders.png");
  screen = 's';
}

void draw () {
switch (screen) {
case 's':
startScreen();
break;
case '3':
three();
break;

case '2':
two();
break;
case '1':
one();
break;
}
gameOver();
}


void keyPressed() {
    if( key == '1') screen = '1';
    if( key == '2') screen = '2';
      if( key == '3') screen = '3';
  
  if (key == 'w' || key == 'W') {
    u=true;
  } else if (key == 's' || key == 'S') {
    d=true;
  } else if (key == 'd' || key == 'D' ) {
    r=true;
  } else if (key == 'a' || key == 'A' ) {
    l=true;
  }

  if (keyCode == UP) {
    u2=true;
  } else if (keyCode == DOWN) {
    d2=true;
  } else if (keyCode == RIGHT) {
    r2=true;
  } else if (keyCode == LEFT) {
    l2=true;
  }
}

void keyReleased() {
  

      
  
  // Detection for wsad keys
  if (key == 'w' || key == 'W') {
    u=false;
  } else if (key == 's' || key == 'S') {
    d=false;
  } else if (key == 'd' || key == 'D') {
    r=false;
  } else if (key == 'a' || key == 'A') {
    l=false;
  }
  if (keyCode == UP) {
    u2=false;
  } else if (keyCode == DOWN) {
    d2=false;
  } else if (keyCode == RIGHT) {
    r2=false;
  } else if (keyCode == LEFT) {
    l2=false;
  }
}

void move() {
  if (y>25) {
    if (u == true) {
      y -= ys;
    }
  }
  if (y<height-25) {
    if (d == true) {
      y += ys;
    }
  }

  if (x>25) {
    if (l == true) {
      x -= xs;
    }
  }
  if (x<975) {
    if (r == true) {
      x += xs;
    }
  }
  
  
  //boundaries for p2
    if (y2>25) {
    if (u2 == true) {
      y2 -= ys;
    }
  }
  if (y2<height-25) {
    if (d2 == true) {
      y2 += ys;
    }
  }

  if (x2>25) {
    if (l2 == true) {
      x2 -= xs;
    }
  }
  
  if (x2<975) {
    if (r2 == true) {
      x2 += xs;
    }
  }
}

void scoreboard () {

  fill(127, 127);
  rect(width/2, height-25, width, 50);
  fill (255);
  textSize(20);
  text ("Billy Bacteria: "+score, 100, height-20);
  
    if (screen == '3')text ("Viny the Virus: "+score2, 300, height-20);
        text ("Jeff: "+score3, 500, height-20);
}

void startScreen() {
background (background);

}

void three () {
  score3+=2;
  background(#0055FF);
  fill(255);
  rectMode(CENTER);
  //square (x, y, 50);
  
  image(crobey,x,y);
  
    image(viry,x2,y2);
  move();
  for (int i = 0; i < targets.size(); i++) {
    
    Target t = targets.get(i);
    if (targets.size()>1) {targets.remove(t);}
    t.display();
    t.move();
    if (t.whacked()) {
      score+=100;
      targets.remove (t);
      targets.add(new Target (int(random(width)), int(random(height))));
      score3-=150;
    }
    
        if (t.smacked()) {
      score2+=150;
      targets.remove (t);
      targets.add(new Target (int(random(width)), int(random(height))));
      score3-=100;
    }
  }
  scoreboard();
}

void two () {

  score3+=2;
  background(#0055FF);
  fill(255);
  rectMode(CENTER);
  //square (x, y, 50);
  
  image(crobey,x,y);
  
    //image(viry,x2,y2);
  move();
  for (int i = 0; i < targets.size(); i++) {
    
    Target t = targets.get(i);
    if (targets.size()>1) {targets.remove(t);}
    t.display();
    t.move();
    if (t.whacked()) {
      score+=100;
      targets.remove (t);
      targets.add(new Target (int(random(width)), int(random(height))));
      score3-=100;
    }
    
      //  if (t.smacked()) {
      //score2+=100;
      //targets.remove (t);
      //targets.add(new Target (int(random(width)), int(random(height))));
      //score3-=50;
    
  }
  scoreboard();}
  
  void one() {
    score3+=1;
  background(#0055FF);
  fill(255);
  rectMode(CENTER);
  //square (x, y, 50);
  
  image(crobey,x,y);
  
    //image(viry,x2,y2);
  move();
  for (int i = 0; i < targets.size(); i++) {
    
    Target t = targets.get(i);
    if (targets.size()>1) {targets.remove(t);}
    t.display();
    t.move2();
    if (t.whacked()) {
      score+=100;
      targets.remove (t);
      targets.add(new Target (int(random(width)), int(random(height))));
      score3-=100;
    }
    
    //    if (t.smacked()) {
    //  score2+=100;
    //  targets.remove (t);
    //  targets.add(new Target (int(random(width)), int(random(height))));
    //  score3-=50;
    //}
  }
  scoreboard();
  }
  
  void gameOver () {
  if (score >4999) {
  background(1);
  fill(255);
  textAlign(CENTER);
  textSize(100);
  text ("Billy Bacteria wins!!!",width/2,height/2);
  noLoop();
  
  }
  
    if (score2 >4999) {
  background(1);
  fill(255);
  textAlign(CENTER);
  textSize(100);
  text ("Viny the Virus wins!!!",width/2,height/2);
  noLoop();
  
  }
  
    if (score3 >4999) {
  background(1);
  fill(255);
  textAlign(CENTER);
  textSize(100);
  text ("Jeff wins!!!",width/2,height/2);
  noLoop();
  
  }
  
  
  }
  
