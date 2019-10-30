Platform1 p1;
Platform2 p2;
Ball b;
int score;


void setup() {
  size (600,400);
  p1 = new Platform1(width/2,height/15);
  p2 = new Platform2(width/2,height-height/15);
  b = new Ball(width/3,height/8);
  
  score = 0;
}

void draw() {
  background(230);
  p1.update();
  p1.display();
  
  p2.update();
  p2.display();
  
  b.update();
  b.display();
  
  
  textSize(25);
  text(str(score), width/7, height/2); 
  
  if (score <= 5 && (b.y>height || b.y<0)) {
    fill(230,20,10);
    textSize(50);
    text(str(score), width/2, height/4);
    
    fill(50);
    textSize(30);
    text("idk, are you two slow or something?", width/2, height/3, 400, 100); 
  }
  
  if (score <= 9 && score >= 6 && (b.y>height || b.y<0)) {
    fill(230,20,10);
    textSize(50);
    text(str(score), width/2, height/4);
    
    fill(50);
    textSize(30);
    text("tbh, If your cerebellum was dynamite, it wouldn't even blow your hat off", width/2, height/3, 400, 100); 
  }
  
  if (score <= 15 && score >= 10 && (b.y>height || b.y<0)) {
    fill(230,20,10);
    textSize(50);
    text(str(score), width/2, height/4);
    
    fill(50);
    textSize(30);
    text("Just barely hitting the double digits now eh?", width/2, height/3, 400, 100); 
  }
  
   if (score <= 19 && score >= 16 && (b.y>height || b.y<0)) {
    fill(230,20,10);
    textSize(50);
    text(str(score), width/2, height/4);
    
    fill(50);
    textSize(30);
    text("Not quite 20 yet tho right?", width/2, height/3, 400, 100); 
  }


if (score <= 25 && score >= 20 && (b.y>height || b.y<0)) {
    fill(230,20,10);
    textSize(50);
    text(str(score), width/2, height/4);
    
    fill(50);
    textSize(30);
    text("Wow you actually got pass 20. Good job wasting your time on this", width/2, height/3, 400, 200); 
  }
  
  if (score >= 30 && (b.y>height || b.y<0)) {
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
    dx = 7;
  }

  void update() {
    if (keyPressed == true && key == 'd') {
       x += dx;
    }
    
    else if (keyPressed == true && key == 'a') {
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
    dx = 7;
  }

  void update() {
    if (keyPressed == true && key == 'l') {
       x += dx;
    }
    
    if (keyPressed == true && key == 'j') {
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
  float x;
  float y;
  float dx;
  float dy;
  float r;
  
   boolean inBounds = true;
   boolean inBounds2 = true;

  Ball(float _x, float _y) {
    x = _x;
    y = _y;
    dx = random(2.5, 3.6);
    dy = random(3, 4.4);
    r = 8;
  }

  void update() {    
    if (x > width - r || x < r) {
      if (y >= p1.y+5+b.r && y <= p2.y-5-b.r) {
         dx *= -1;
      }
    }
    //if (y > height - r || y < r) {
    //  dy *= -1;
    //}
    
    if (b.y <= p1.y+10+b.r && (inBounds == true)) {
      if (abs(b.x-p1.x)<55) {
        b.dy *= -1.075;
        b.dx *= random(1.005,1.01);
        score++;
      }
    }
    
    if (b.y <= p1.y+b.r) {
      inBounds = false;
    }
    
    if (b.y >= p2.y-b.r) {
      inBounds2 = false;
    }
    
    if (b.y >= p2.y-5-b.r && (inBounds2 == true)) {
      if (abs(b.x-p2.x)<55) {
        b.dy *= -1.06;
        b.dx *= random(1.005,1.01);
        score++;
      }
    }
    
    if (b.y == p1.y+10+b.r) {
      if (abs(b.x-p1.x)<55) {
        score++;
      }
    }
    
    if (b.y == p2.y-10-b.r) {
      if (abs(b.x-p2.x)<55) {
         score++;
      }
    }
    
    if (y>=p2.y+10) {
     
    }
    
    x += dx;
    y += dy;
  }

  void display() {
    fill(20,30,20);
    ellipse(x, y, r * 2, r * 2);
  }
}
  
