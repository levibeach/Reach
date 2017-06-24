class Grid {
  int gridSize;
  int gridPoint;
  float lineThickness = 1;
  color c1 = color(random(0,255),random(0,255),random(0,255));
  color c2 = color(random(0,255),random(0,255),random(0,255));
  color c3 = color(random(0,255),random(0,255),random(0,255));
  color c4 = color(random(0,255),random(0,255),random(0,255));
  Grid (int gridSize, int gridPoint, float lineThickness, boolean madness) {
    for (int i = 0; i < width; i+=gridSize) {
      for (int j = 0; j < height; j+=gridSize) {
        strokeCap(ROUND);
        strokeWeight(lineThickness);
        if (madness) {
          stroke(color(random(0,255),random(0,255),random(0,255)));
          float rando = random(0,100);
          if (rando < 10) {
            line(i, j, i + gridSize, j);
          } else if(rando < 25) {
            line(i, j, i + gridSize, j + gridSize);
          } else if (rando < 75) {
            line(i, j, i, j + gridSize);
          }
          noStroke();
          fill(color(random(0,255),random(0,255),random(0,255)));
        } else {
          float rando = random(0,100);
          if (rando < 10) {
            stroke(c1);
            line(i, j, i + gridSize, j);
          } else if(rando < 25) {
            stroke(c2);
            line(i, j, i + gridSize, j + gridSize);
          } else if (rando < 75) {
            stroke(c3);
            line(i, j, i, j + gridSize);
          }
          noStroke();
          fill(c4);
        }
        ellipse(i, j, gridPoint, gridPoint);
      }
    }
  }
}
