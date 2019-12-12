// This sketch uses a loop to draw a group of 
// ellipses. It uses a single float to represent
// their x positions. Replace this float with an
// array of floats so that each ellipse can have 
// a unique x position, then increment the position
// if the mouse is inside the ellipse.

// create an array of values corresponding
// to each ellipse here:
float[] y = new float[10];
float[] x = new float[10];
float[] d = new float[10];
float[] dy = new float[10];

void setup() {
  size(600, 600);
  
  // give the array values  
  for (int i = 0; i < 10; i++) {
     y[i] = 30 + i * 60;
     x[i] = 30;
     d[i] = dist(mouseX, mouseY, x[i], y[i]);
  }
  
  noStroke();
}

void draw() {
  background(50);
  for (int i = 0; i < 10; i++) {
    y[i] = 30 + (i * 60);
    d[i] = dist(mouseX, mouseY, x[i], y[i]);
  

    // check to see if you should increment 
    // the value at each position in the array
    // and then draw at that position
    if (d[i] <= 50) {
      x[i]++; 
    }
    ellipse(x[i], y[i], 50, 50);
  }
}
