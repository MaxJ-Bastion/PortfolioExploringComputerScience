class Button {
  String label, pic;
  float x, y, w, h;
  PImage grug;
  boolean p;

  Button(String label, float x, float y, float w, float h, String pic, boolean p) {
    this.label = label;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.pic = pic;
    this.p = p;

  }

  void display() {
if (p==true){
    grug = loadImage(pic);
  
      grug.resize(int(w), int(h));
      imageMode(CENTER);

    

    image(grug, x, y);} else {
      if(clicked() ==true) {fill(0,255,0);}else
      fill(255,0,0);
      rectMode(CENTER);
    rect(x,y,w,h,10);
    }
    fill(255);
    stroke(0);



 

    fill(255);
    textAlign(CENTER,CENTER);
    textSize(20);
    text(label, x, y);
    textSize(13);

    //rect(x, y, w, h, 10);
  }

  boolean clicked() {

    return (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2);
  }
  
  boolean reallyClicked() {
  if (clicked()==true&&mousePressed) {return true;}else return false;
  }
}
