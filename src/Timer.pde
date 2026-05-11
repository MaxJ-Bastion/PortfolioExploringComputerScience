//Maxwell Johnson | March 25 2026 | Timer
Button test, start, stop, reset;
float time;
boolean hi,on;
void setup() {
  frameRate(100);
  size(1500, 600);
  background(1, 50, 100);
  test = new Button("DO NOT PRESS", width/2+200, height/2, 100, 100, "giggles.png", false);

  start = new Button("Start Armageddon", width/2+200, 75, 250, 50, "giggles.png", false);

  stop = new Button("Stop human happiness", width/2+200, 150, 250, 50, "giggles.png", false);

  reset = new Button("Reset the Cosmic timeline", width/2+200, 225, 250, 50, "giggles.png", false);
  hi=false;
  time = 0;
  on=false;
}

void draw() {
  background(1, 50, 100);

  start.display();
  if (start.reallyClicked()) on =true;
  stop.display();
  if (stop.reallyClicked()) on =false;
  reset.display();
  if (reset.reallyClicked())time = 0;
textSize(150);
textAlign(CENTER,CENTER);
text("TIMER THING",500,500);
  //test.display();
  //if (test.reallyClicked()) {
  //hi=true;
  //}

  //if (hi==true)
  //{
  //  fill(1);
  //  rect(100, 100, 100, 100);
  //}
  timer();
}

void timer(){
if (on == true){
time+=.01;
}
textSize(200);
text(time,400,100);

}
