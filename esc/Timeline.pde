//Maxwell Johnson | February 25, 2026 | Timeline

//int x,y;
void setup() {
  size(950, 400);
}

void draw() {
  background(0, 115, 200);
  fill(255);
  drawRef();
  histEvent(150, 300, 100, "Feb 1932", "Born in Queens, NY");
  histEvent(400, 200, 435, "March 1952", "Assigned to the Northeast Air Command 596th Air Force Band");
  histEvent(450, 300, 530, "March 1958","First movie score released in the film Daddy-O");
  histEvent(600, 200, 660, "Dec 1967","Valley of the Dolls premiers, first film for which he was nominated the Academy Award");
  histEvent(700, 300, 735, "Nov 1971", "Fiddler on the Roof movie comes out, for which he later received an Oscar");
  histEvent(740, 200, 770, "March 1974", "First film with Spielberg releases, Sugarland Express");
  histEvent(850, 300, 790, "June 1975",  "Jaws releases, a famous collaboration between Williams and Spielberg");
  histEvent(870, 200, 830, "May 1977", "First Star Wars film releases, one of his most famous scores included");
}

void drawRef() {
  textSize(50);
  textAlign(CENTER);
  text ("John Williams was a human being", width/2, 90);
  textSize(20);
  text ("By Maxwell Johnson", width/2, 120);
  strokeWeight(5);
  line(50, 250, 900, 250);

  strokeWeight(2);
  textSize(15);
  text("1930", 75, 240);
  line(75, 240, 75, 260);

  text("1940", 235, 240);
  line(235, 240, 235, 260);

  text("1950", 395, 240);
  line(395, 240, 395, 260);

  text("1960", 555, 240);
  line(555, 240, 555, 260);

  text("1970", 715, 240);
  line(715, 240, 715, 260);

  text("1980", 875, 240);
  line(875, 240, 875, 260);
}


void histEvent(int x, int y, int lx, String name, String detail) {
  strokeWeight(1);
  textSize(20);
  line(x, y, lx, 250);
  fill(50, 10, 180);
  rectMode(CENTER);
  rect(x, y, 100, 30, 10);
  fill(200);
  text(name, x, y+6);
  textSize (25);
  fill(#F5A005);
  if (mouseX<x+50&&mouseX>x-50&&mouseY>y-15&&mouseY<y+15) {text (detail,width/2, 370);}
}

//1.Feb 1932: Born in Queens, NY

//2.March 1952: Assigned to the Northeast Air Command 596th Air Force Band

//3.March 1958: First movie score released in the film Daddy-O

//4.Dec 1967: Valley of the Dolls premiers, first film for which he was nominated the Academy Award

//5.Nov 1971: Fiddler on the Roof movie comes out, for which he later received an Oscar

//6.March 1974: First film with Spielberg releases, Sugarland Express

//7.June 1975: Jaws releases, a famous collaboration between Williams and Spielberg

//8.May 1977: First Star Wars film releases, for which he did the music
