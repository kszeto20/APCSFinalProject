ArrayList<BackBubbles> backs;
Player control;
// start button = xcor, ycor, width, height, 0 = not pressed + 1 = pressed
int[] sButton = {300, 370, 200, 50, 0};
ArrayList<Bullet> bullets;
ArrayList<Bullet> otherBullets;
ArrayList<Enemy> enemies;

void setup() {
  frameRate(60);
  size (800,800);
  
  backs = new ArrayList<BackBubbles>();
  for (int i = 0; i < width / 5; i++) {
    backs.add(new BackBubbles(width, height));
  }
  control = new Player(width, height);
  bullets = new ArrayList<Bullet>();
  otherBullets = new ArrayList<Bullet>();  
  enemies = new ArrayList<Enemy>();
  for (int i = 0; i < 1; i++) {
    enemies.add(new Enemy(width, height));
  }
}

void draw() {
  background(0);
  if (sButton[4] == 0) {
    fill(255);
    textSize(50);
    text("\nGalaga so far", 250, 0);
    fill(#FFD6D9);
    rect(300, 370, 200, 50);
    fill(#FF0318);
    textSize(18);
    text("PRESS HERE TO START", 300, height / 2);
  }
  else if (sButton[4] == 1) {
    control.display();
    double prob = Math.random();
    for (Enemy e : enemies) {
      e.move();
      if(prob < 0.05){
        e.shoot();
      }
      e.display();
    }
    if(keyPressed){
      moveP(control);
    }
  }
  for (BackBubbles b : backs) {
    b.move();
    b.display();
  }
}

void mousePressed() {
  if ((mouseY < (sButton[1] + sButton[3])) && (mouseY > sButton[1])) {
     sButton[4] = 1;
  }
}

void moveP(Player control) {
  if (control.left && control.xCor > 30) {
    control.xCor -= 10;
  }
  if (control.right && control.xCor < width - 30) {
    control.xCor += 10;
  }
  if (control.up && control.yCor > 10) {
    control.yCor -= 10;
  }
  if (control.down && control.yCor < height - 50) {
    control.yCor += 10;
  }
}

void keyPressed() {
  if (keyCode == 37) {
    control.left = true;
  }
  else if (keyCode == 38) {
    control.up = true;
  }
  else if (keyCode == 40) {
    control.down = true;
  }
  else {
    if (keyCode == 39) {
      control.right = true;
    }
    else {
      if (keyCode == 32) {
        control.shoot();
      }
    }
  }
}
 
void keyReleased() {
  if (keyCode == 37) {
    control.left = false;
  }
  else if (keyCode == 38) {
    control.up = false;
  }
  else if (keyCode == 40) {
    control.down = false;
  }
  else {
    if (keyCode == 39) {
      control.right = false;
    }
  }
} 



/*
DEBUG NOTES:
next session - bullets? (05/25)
*/
