ArrayList<BackBubbles> backs;
Player control;
void setup() {
  frameRate(60);
  size (800,800);
  
  backs = new ArrayList<BackBubbles>();
  for (int i = 0; i < width / 5; i++) {
    backs.add(new BackBubbles(width, height));
  }
  control = new Player(width, height);
}

void draw() {
  background(0);
  fill(255);
  textSize(50);
  text("\nGalaga so far", width / 3, 0);
  for (BackBubbles b : backs) {
    b.move();
    b.display();
  }
  if(keyPressed){
    control.move();
  }
  control.display();
}




/*
DEBUG NOTES:
next session - make player controlled plane + bullets? (05/23)
*/
