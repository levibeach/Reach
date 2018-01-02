// get that pdf library so we can save as vector
import processing.pdf.*;
// Set our grid object
Grid gridLayout;
// saving is off by default so shit doesn't get nutz
boolean record = false;
// large seed numbers so that there's plenty to pick from
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

// this is ran every frame
void draw() {
  // start saving
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
  // set the see so we can come back to this layout
  randomSeed(seed);
  // set it all on a white backgroud -- can strip this out later if need be
  background(255);
  // make a new grid object
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
