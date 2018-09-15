import processing.pdf.*;

Grid gridLayout;

boolean record = false;

float seedMax = 1000000;
int seed = int(ceil(random(0,seedMax)));

// grid settings
int lineSize = 5;
int gridSpacing = 100;
int dotSize = lineSize * 1;
boolean wild = false;
boolean gradiant = true;

// initialize setup
void setup() {
  size(600, 800);
  generate();
}

void draw() {
  
  // start saving if recording
  if (record) {
    beginRecord(PDF, "saves/Reach_" + seed + ".pdf");
  }
  
  // create the grid
  generate();
  
  // end saving
  if (record) {
    endRecord();
    record = false;
  }
  
}

void generate() {
  randomSeed(seed);
  background(255);
  gridLayout = new Grid(gridSpacing, dotSize, lineSize, wild, gradiant);
}

void keyPressed(){
  // if we press S then we should save the current grid to a pdf
  if(key == 's' || key == 'S'){
    record = true;
  }
  // if we press enter we should generate a new grid based on a new random seed
  if(key == ENTER){
    clear();
    seed = int(ceil(random(0,seedMax)));
    generate();
  }
}
