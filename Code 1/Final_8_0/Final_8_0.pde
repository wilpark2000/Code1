int cols = 10;


float[][] x = new float[cols][cols];
float[][] y = new float[cols][cols];
float[][] col = new float[cols][cols];
float[][] rate = new float[cols][cols];

void setup() {
  size(600, 600);
  for (int j = 0; j < cols; j++) {
  for (int i = 0; i < cols; i++) {
    x[i][j] = map(i, 0, cols - 1, 100, 500);
    y[i][j] = map(j, 0, cols - 1, 100, 500);
    col[i][j] = random(255);
    rate[i][j] = random(-1, 1);
  }
  }
}

void draw() {
  background(0);
  for (int j = 0; j < cols; j++) {
  for (int i = 0; i < cols; i++) {
    if (col[i][j] > 255 || col[i][j] < 0) {
      rate[i][j] *= -1;
    }

    col[i][j] += rate[i][j];

    noStroke();
    fill(col[i][j]);
    ellipse(x[i][j], y[i][j], 25, 25);
  }
  }
}
