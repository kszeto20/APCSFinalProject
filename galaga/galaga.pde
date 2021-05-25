ArrayList<BackBubbles> backs;
Player control;
// start button = xcor, ycor, width, height, 0 = not pressed + 1 = pressed
int[] sButton = {0, 0, 200, 50, 0};

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
  
  if (sButton[4] == 0) {
    fill(255);
    textSize(50);
    text("\nGalaga so far", width / 3, 0);
    fill(#FFD6D9);
    rect(sButton[0], sButton[1], sButton[2], sButton[3]);
    fill(#FF0318);
    textSize(18);
    text("PRESS HERE TO START", 0, 30);
  }
  else if (sButton[4] == 1) { 
  }
  
  for (BackBubbles b : backs) {
    b.move();
    b.display();
  }
  if(keyPressed){
    control.move();
  }
  control.display();
}

void mousePressed() {
  if ((mouseY < (sButton[1] + sButton[3])) && (mouseY > sButton[1])) {
     sButton[4] = 1;
  }
}




/*
DEBUG NOTES:
next session - make player controlled plane + bullets? (05/23)
*/
