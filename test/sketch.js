let x, y, xs, ys, r, g, b;
let rs, gs, bs;
let drawFlag, nope;

let bop;
let circles = [];
let goofs = [];
let goofies = [];

function setup() {
  createCanvas(500, 500);
  background(0, 25, 150);

  x = 100;
  y = 100;
  xs = 3;
  ys = 2;

  bop = new Skoobop(mouseX, mouseY);

  r = int(random(15, 230));
  b = int(random(15, 230));

  rs = random(-3, 3);
  gs = random(-3, 3);
  bs = random(-3, 3);

  drawFlag = false;
  nope = false;

  frameRate(200);
}

function draw() {
  fill(r, 1, b);
  noStroke();

  bop.move();

  for (let i = 0; i < circles.length; i++) {
    let circ = circles[i];
    circ.display();
    circ.move();
    if (nope) circles.shift();
  }

  for (let i = 0; i < goofs.length; i++) {
    let goof = goofs[i];
    goof.display();
    goof.move();
    if (nope) goofs.shift();
  }

  for (let i = 0; i < goofies.length; i++) {
    let goofie = goofies[i];
    goofie.display();
    goofie.move();
    if (nope) goofies.shift();
  }

  if (drawFlag) {
    bop.display();
  }
}

function mousePressed() {
  if (mouseButton === LEFT) {
    circles.push(new Lilcircle(mouseX, mouseY));
  }
  if (mouseButton === RIGHT) {
    goofs.push(new Goof(mouseX, mouseY));
  }
}

function keyPressed() {
  if (key === ' ') noLoop();
  if (key === 'f') resizeCanvas(windowWidth, windowHeight);
  if (key === 'd') drawFlag = true;

  if (keyCode === DOWN_ARROW) {
    nope = true;
  }

  if (keyCode === UP_ARROW) {
    background(0, 25, 150);
  }
}

function keyReleased() {
  if (key === 'd') drawFlag = false;
  if (key === '+') goofies.push(new Goof2(mouseX, mouseY));
  if (keyCode === DOWN_ARROW) nope = false;
}

// ---------------- CLASSES ----------------

class Goof {
  constructor(x, y) {
    this.x = x;
    this.y = y;
    this.xs = 3;
    this.ys = 2;

    this.r = int(random(15, 230));
    this.g = int(random(15, 230));
    this.b = int(random(15, 230));

    this.rs = random(-3, 3);
    this.gs = random(-3, 3);
    this.bs = random(-3, 3);

    this.type1 = 'b';
    this.type2 = 'g';
  }

  display() {
    fill(this.r, this.g, this.b);
    noStroke();
    ellipse(this.x, this.y, 20, 20);
  }

  move() {
    let dude = createVector(this.x, this.y);
    let them = createVector(mouseX, mouseY);
    let move = p5.Vector.sub(them, dude);

    move.normalize();
    move.mult(10);

    this.x += move.x;
    this.y += move.y;

    this.updateColor();
  }

  updateColor() {
    if (this.type1 === 'r' || this.type2 === 'r') this.r += this.rs;
    if (this.type1 === 'g' || this.type2 === 'g') this.g += this.gs;
    if (this.type1 === 'b' || this.type2 === 'b') this.b += this.bs;

    if (this.r > 240 || this.r < 10) this.rs *= -1;
    if (this.g > 240 || this.g < 10) this.gs *= -1;
    if (this.b > 240 || this.b < 10) this.bs *= -1;
  }
}

class Goof2 extends Goof {
  move() {
    let dude = createVector(this.x, this.y);
    let them = createVector(mouseX, mouseY);
    let move = p5.Vector.sub(them, dude);

    move.normalize();
    move.mult(2);

    this.x += move.x;
    this.y += move.y;

    this.updateColor();
  }
}

class Lilcircle {
  constructor(x, y) {
    this.x = x;
    this.y = y;
    this.xs = 3;
    this.ys = 2;

    this.r = int(random(15, 230));
    this.g = int(random(15, 230));
    this.b = int(random(15, 230));

    this.rs = random(-3, 3);
    this.gs = random(-3, 3);
    this.bs = random(-3, 3);

    this.type1 = 'b';
    this.type2 = 'g';
  }

  display() {
    fill(this.r, this.g, this.b);
    noStroke();
    ellipse(this.x, this.y, 8, 8);
  }

  move() {
    this.x += this.xs;
    this.y += this.ys;

    if (this.x < 5 || this.x > width - 5) this.xs *= -1;
    if (this.y < 5 || this.y > height - 5) this.ys *= -1;
  }
}

class Skoobop extends Goof {
  move() {
    this.x = mouseX;
    this.y = mouseY;
    this.updateColor();
  }

  display() {
    fill(this.r, this.g, this.b);
    ellipse(this.x, this.y, 15, 15);
  }
}
