
Square[] s = new Square[100];

void setup() {
  size(600,600);
  background(0);
  for (int i = 0; i < s.length; i++) {
     float xpos = random(0,width);
     s[i] = new Square(xpos, 0);
   }
   
}

void draw() {
  for (int i = 0; i < s.length; i++) {
    s[i].fall();
    s[i].display();
  }
}

void mouseClicked() {
  

}

class Square {
  float x;
  float y;
  
  Square(float _x, float _y) {
    x = _x;
    y = _y;
  }

  void display() {
    float r = map(y,0,height,0,255);
    fill(r);
    rect(x,y,40,40);
  }
    
  void fall() {
    y += random(1,3);
  }
}
