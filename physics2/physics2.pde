Platform1 p1;
Platform2 p2;
Ball b;
Mover m;
int score;

boolean aIsPressed;
boolean dIsPressed;
boolean jIsPressed;
boolean lIsPressed;
float constantForce;

void setup() {
  size (600,400);
  p1 = new Platform1(width/2,height/15);
  p2 = new Platform2(width/2,height-height/15);
  b = new Ball(width/3,height/8);
  m = new Mover(width/2, height/2);
  constantForce = 1.8;

  score = 0;
}

void draw() {
  background(230);
  
  PVector force = new PVector(b.pos.x, m.pos.y);
  force.sub(m.pos);
  
  if (b.pos.x >= 50 || b.pos.y <= (width-50)) {
  float distance = force.mag();
  distance = constrain(distance, 5, 40);
  force.normalize();
  float strength = (constantForce * b.mass * m.mass) / (distance*distance);
  force.mult(strength);
  b.applyForce(force);
  }
  
  p1.update();
  p1.display();
  
  p2.update();
  p2.display();
  
  b.update();
  b.display();
  
  m.update();
  m.display();
  
  textSize(25);
  text(str(score), width/7, height/2); 
  
  if (score <= 5 && (b.pos.y>height || b.pos.y<0)) {
    fill(230,20,10);
    textSize(50);
    text(str(score), width/2, height/4);
    
    fill(50);
    textSize(30);
    text("idk, are you two slow or something?", width/2, height/3, 400, 100); 
  }
  
  if (score <= 9 && score >= 6 && (b.pos.y>height || b.pos.y<0)) {
    fill(230,20,10);
    textSize(50);
    text(str(score), width/2, height/4);
    
    fill(50);
    textSize(30);
    text("tbh, If your cerebellum was dynamite, it wouldn't even blow your hat off", width/2, height/3, 400, 100); 
  }
  
  if (score <= 15 && score >= 10 && (b.pos.y>height || b.pos.y<0)) {
    fill(230,20,10);
    textSize(50);
    text(str(score), width/2, height/4);
    
    fill(50);
    textSize(30);
    text("Just barely hitting the double digits now eh?", width/2, height/3, 400, 100); 
  }
  
   if (score <= 19 && score >= 16 && (b.pos.y>height || b.pos.y<0)) {
    fill(230,20,10);
    textSize(50);
    text(str(score), width/2, height/4);
    
    fill(50);
    textSize(30);
    text("Not quite 20 yet tho right?", width/2, height/3, 400, 100); 
  }


if (score <= 25 && score >= 20 && (b.pos.y>height || b.pos.y<0)) {
    fill(230,20,10);
    textSize(50);
    text(str(score), width/2, height/4);
    
    fill(50);
    textSize(30);
    text("Wow you actually got pass 20. Good job wasting your time on this", width/2, height/3, 400, 200); 
  }
  
  if (score >= 30 && (b.pos.y>height || b.pos.y<0)) {
    fill(230,20,10);
    textSize(50);
    text(str(score), width/2, height/4);
    
    fill(50);
    textSize(30);
    text("lol, you really tryharding on this, get a life man", width/2, height/3, 400, 100); 
  }
}


class Platform1 {
  float x;
  float y;
  float dx;

  Platform1(float _x, float _y) {
    x = _x;
    y = _y;
    dx = 9;
  }

  void update() {
    if (dIsPressed == true) {
       x += dx;
    }
    
    if (aIsPressed == true) {
      x -= dx;
    }
  }

  void display() {
    fill(10, 30, 230);
    rectMode(CENTER);
    rect(x,y,110,10);
  }
}

class Platform2 {
  float x;
  float y;
  float dx;

  Platform2(float _x, float _y) {
    x = _x;
    y = _y;
    dx = 9;
  }

  void update() {
    if (lIsPressed == true) {
      x += dx;
    }
    
    if (jIsPressed == true) {
      x -= dx;
    }
  }

  void display() {
    fill(230, 50, 20);
    rectMode(CENTER);
    rect(x,y,110,10);
  }
}

class Ball {
  PVector pos;
  PVector constant;
  PVector vel;
  PVector acc;
  float mass;
  float r;
  float xSpeed;
  float ySpeed;
  
   boolean inBounds = true;
   boolean inBounds2 = true;
   boolean inDistance = false;

  Ball(float x, float y) {
    xSpeed = random(3,4);
    ySpeed = random(3,4);
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    
    mass = 5;
    r = 2 * mass;
  }

  void update() { 
    constant = new PVector(xSpeed,ySpeed);
    
    vel.add(acc);
    pos.add(vel);
    pos.add(constant);
    acc.mult(0);
    
    if (pos.x > width - r || pos.x < r) {
      if (pos.y >= p1.y+5+b.r && pos.y <= p2.y-5-b.r) {
         xSpeed *= -1;
      }
    }
    //if (y > height - r || y < r) {
    //     dy *= -1;
    //}
    
    //if (abs(dist) <= 300) {
    //  inDistance = true;
    //} else {
    //  inDistance = false;
    //}
    
    if (b.pos.y <= p1.y+10+b.r && (inBounds == true)) {
      if (abs(b.pos.x-p1.x)<55) {
        b.xSpeed *= 1.075;
        b.ySpeed *= -random(1.005,1.01);
        //constantForce *= -1;
        m.mass *= 1.1;
        score++;
      }
    }
    
    if (b.pos.y <= p1.y + 10) {
      inBounds = false;
    }
    
    if (b.pos.y >= p2.y - 10) {
      inBounds2 = false;
    }
    
    if (b.pos.y >= p2.y-5-b.r && (inBounds2 == true)) {
      if (abs(b.pos.x-p2.x)<55) {
        b.ySpeed *= -1.06;
        b.xSpeed *= random(1.005,1.01);
        //constantForce *= -1;
        m.mass *= 1.1;
        score++;
      }
    }
    
    if (b.pos.y == p1.y+10+b.r) {
      if (abs(b.pos.x-p1.x)<55) {
        score++;
      }
    }
    
    if (b.pos.y == p2.y-10-b.r) {
      if (abs(b.pos.x-p2.x)<55) {
         score++;
      }
    }
    
    if (pos.y>=p2.y+10) {
     
    }
    
    //if (inDistance == true) {
    //  x += (20/yDist);
    //  y += (20/xDist);
    //}
    
    //x += ((float)(20/yDist));
    //y += ((float)(20/xDist)); 
  }

  void display() {
    
    fill(20,30,20);
    ellipse(pos.x, pos.y, r * 2, r * 2);
  }
  
   void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }
}

class Mover {
  PVector pos;
  PVector vel;
  PVector acc;
  float mass;
  float size;
  float velX;
  float velY;

  Mover(float x, float y) {
    velX = random(2,3);
    velY = random(2,3);
    pos = new PVector(x, y);
    vel = new PVector(velX, velY);
    mass = random(4, 9);
    size = 5*mass;
  }

  void update() {
    pos.x += velX;
    pos.y += velY;
    
    if((pos.x + size) >= width) {
      velX *= -1;
    }
    if((pos.x - size) <= 0) {
      velX *= -1;
    }
    if((pos.y + size) >= height) {
      velY *= -1; 
    }
    if((pos.y - size) <= 0) {
     velY *= -1; 
    }
  }

  void display() {
    fill(240);
    stroke(0);
    ellipse(pos.x, pos.y, size, size);
  }

  //void applyForce(PVector force) {
  //  PVector f = PVector.div(force, mass);
  //  acc.add(f);
  //}
}

void keyPressed() {
  if (key == 'a') aIsPressed = true;
  if (key == 'd') dIsPressed = true;
  if (key == 'j') jIsPressed = true;
  if (key == 'l') lIsPressed = true;
}

void keyReleased() {
  if (key == 'a') aIsPressed = false;
  if (key == 'd') dIsPressed = false;
  if (key == 'j') jIsPressed = false;
  if (key == 'l') lIsPressed = false;
}

  
