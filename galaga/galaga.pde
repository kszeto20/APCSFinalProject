ArrayList<BackBubbles> backs;
void setup() {
  frameRate(60);
  size (1000,1000);
  
  backs = new ArrayList<BackBubbles>();
  for (int i = 0; i < width / 2; i++) {
    backs.add(new BackBubbles(width, height));
  }
}

void draw() {
  background(0);
  fill(255);
  textSize(50);
  text("\nGalaga!", 430, 0);
  for (BackBubbles b : backs) {
    b.move();
    b.display();
  }
}


/*
DEBUG NOTES:
next session - make player controlled plane + bullets? (05/23)
*/
