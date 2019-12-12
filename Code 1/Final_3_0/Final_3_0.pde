  
// this code draws an system where one ellipse rotates around another.
// replace this drawing code with a function that can be used to 
// draw the system repeatedly, like "drawSystem()". It should
// take arguments that allow parameters of the system to be customized,
// like the distance between each ellipse, the speed of rotation, and 
// the size of the ellipses.
// use your function to draw the system multiple times in the sketch
// as seen in the example gif.
    float timer;
    
void setup() {
  size(600, 600);
  timer = 0;
}

void draw() {
    background(0);
 
    
}

void circles() {
  float size1 = random(50,100);
  float size2 = random(20,45);
  pushMatrix();
  translate(random(200,400), random(200,400));
  rotate(frameCount * random(0.01, 0.09));
  ellipse(0, 0, size1, size1);

  pushMatrix();
  translate(150, 0);
  ellipse(0, 0, size2, size2);
  popMatrix();
  
  popMatrix();
}
