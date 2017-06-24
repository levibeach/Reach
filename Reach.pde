import processing.pdf.*;

boolean record = false;
float seedMax = 1000000;
int seed = int(ceil(random(0,seedMax)));
Grid gridLayout;

void setup() {
  size(600, 800);
  // background(255);
  generate();
}

void draw() {
  if (record) {
    beginRecord(PDF, "saves/Reach-" + seed + ".pdf");
  }
  generate();
  if (record) {
    endRecord();
    record = false;
  }
}

void generate() {
  randomSeed(seed);
  background(255);
  gridLayout = new Grid(200, 4, 1);
}

void keyPressed(){
  if(key == 's' || key == 'S'){
    record = true;
  }
  if(key == ENTER){
    clear();
    seed = int(ceil(random(0,seedMax)));
    generate();
  }
}
