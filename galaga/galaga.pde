ArrayList<BackBubbles> backs;
// start button = xcor, ycor, width, height, 0 = not pressed + 1 = pressed
int[] sButton = {300, 370, 200, 50, 0};
int[] rButton = {300, 425, 225, 50, 0};
int score;
ArrayList<Bullet> bullets;
ArrayList<Bullet> otherBullets;
ArrayList<Enemy> enemies;
ArrayList<Player> control;

void setup() {
  frameRate(60);
  size (800,800);
  score = 0;
  backs = new ArrayList<BackBubbles>();
  for (int i = 0; i < width / 5; i++) {
    backs.add(new BackBubbles(width, height));
  }
  control = new ArrayList<Player>();
  control.add(new Player(width, height));
  bullets = new ArrayList<Bullet>();
  otherBullets = new ArrayList<Bullet>();  
  enemies = new ArrayList<Enemy>();
  //spawn();
  for (int i = 0; i < 180; i += 60) {
    enemies.add(new Enemy(width + i, height));
  }
}

void draw() {
  if (control.get(0).kill) {
    sButton[4] = 0;
    background(0);
    for (BackBubbles b : backs) {
      b.move();
      b.display();
    }
    fill(#FF0318);
    textSize(50);
    text("Game Over :(", 250, height / 2);
    /*rect(300, 425, 225, 50);
    fill(255);
    textSize(18);
    text("PRESS HERE TO RESTART", 300, 450);
  */} 
  else {
    background(0);
    //spawnMove();
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
      fill(255);
      text("Score: " + score, 650, 50);
      control.get(0).display();
      double prob = random(10);
      for (int i = 0;i < enemies.size();i++) {
        if(enemies.get(i).kill == true){
          enemies.remove(enemies.get(i));
          i--;
        }
        else{
          enemies.get(i).move();
          enemies.get(i).collide();
          enemies.get(i).display();
          for (Bullet b : otherBullets) {
               b.move();
               b.display();
             }
          if(prob < 1){
            enemies.get(i).shoot();
            enemies.get(i).shoot();
          }
        }  
      }
      if(keyPressed){
        moveP(control.get(0));
      }
      for (Player c : control) {
        c.collide();
      }
    }
    for (BackBubbles b : backs) {
      b.move();
      b.display();
    }
  }
}

void spawn() {
  for (int i = 0; i < 10; i++) {
    enemies.add(new Enemy(width, height));
  }
}
void spawnMove() {
  // move them up
  for (Enemy e : enemies) {
    while ((e.xCor > width / 2) && (e.yCor > (height * 0.1))) {
      e.xCor -= 10;
      e.yCor -= 10;
      e.display();
    }
    e.spawned = true;
  }
}
  //}
  //// separate them
  //int len = enemies.size() - 1;
  //for (int i = 0; i < enemies.size(); i++) {
  //  if (len > enemies.size() / 2) {
  //    enemies.get(i).xCor -= 20 * len + random(50);
  //  }
  //  if (len < enemies.size() / 2) {
  //    enemies.get(i).xCor += 20 * len + random(50);
  //  }
  //  if (len == enemies.size() / 2) {
      
  //  }
  //  len--;
  //}


void mousePressed() {
  if ((mouseY < (sButton[1] + sButton[3])) && (mouseY > sButton[1])) {
     sButton[4] = 1;
  }
  if ((mouseY < (rButton[1] + rButton[3])) && (mouseY > rButton[1])) {
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
    control.get(0).left = true;
  }
  else if (keyCode == 38) {
    control.get(0).up = true;
  }
  else if (keyCode == 40) {
    control.get(0).down = true;
  }
  else {
    if (keyCode == 39) {
      control.get(0).right = true;
    }
    else {
      if (keyCode == 32) {
        control.get(0).shoot();
      }
    }
  }
}
 
void keyReleased() {
  if (keyCode == 37) {
    control.get(0).left = false;
  }
  else if (keyCode == 38) {
    control.get(0).up = false;
  }
  else if (keyCode == 40) {
    control.get(0).down = false;
  }
  else {
    if (keyCode == 39) {
      control.get(0).right = false;
    }
  }
}



/*
DEBUG NOTES:
after killing all enemies, score counter continues -- need a fix
enemy bullets slow down as more enemies are killed -- need a fix
spawn method process - spawn first (no display) (done)
spawnMove method process - move + display 
^(still buggy; need to avoid shooting until spawned is finished + fix slope of movement for aesthetics +
                need to find a way to separate enemies because they are all stack on top of one another rn)
                
to operate: move player all the way to the edge of the screen until spawning is finished

*/
