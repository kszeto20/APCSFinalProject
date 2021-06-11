ArrayList<BackBubbles> backs;
// start button = xcor, ycor, width, height, 0 = not pressed + 1 = pressed
int[] sButton = {300, 370, 200, 50, 0};
int[] rButton = {300, 425, 225, 50, 0};
int score;
int highscore;
int timer; 
int lShot;
ArrayList<Bullet> bullets;
ArrayList<Bullet> otherBullets;
ArrayList<Enemy> enemies;
ArrayList<Player> control;

void setup() {
  frameRate(60);
  size (800,800);
  score = 0;
  timer = 0;
  highscore = 0;
  lShot = 0;
  backs = new ArrayList<BackBubbles>();
  for (int i = 0; i < width / 5; i++) {
    backs.add(new BackBubbles(width, height));
  }
  control = new ArrayList<Player>();
  control.add(new Player(width, height));
  bullets = new ArrayList<Bullet>();
  otherBullets = new ArrayList<Bullet>();  
  enemies = new ArrayList<Enemy>();
}

void draw() {
  if (control.get(0).kill) {
    sButton[4] = 2;
    background(0);
    for (BackBubbles b : backs) {
      b.move();
      b.display();
    }
  } 
  else {
    background(0);
    if (sButton[4] == 0) {
      fill(255);
      textSize(40);
      text("\nGalaga made by 2 CS students", 125, 0);
      fill(#FF0318);
      textSize(17);
      text("CLICK TO START", width / 2 - 75, height / 2);
    }
    else if (sButton[4] == 1) {
      if (enemies.size() == 0) {
        spawn();
        spawnMove();
      }
      fill(255);
      text("Score: " + score, 650, 50);
      if(score > highscore){
        highscore = score;
      }
      text("High Score: " + highscore, 650, 75);
      control.get(0).display();
      timer++;
      lShot++;
      for (Bullet b : otherBullets) {
        b.move();
        b.display();
      }
      for (int i = 0;i < enemies.size();i++) {
        if(enemies.get(i).kill == true){
          enemies.remove(enemies.get(i));
          i--;
        }
        else{
          enemies.get(i).move();
          enemies.get(i).collide();
          enemies.get(i).display();
          if(timer % 60 == 0){
            enemies.get(i).shoot();
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
  if (sButton[4] == 2) {
    control.remove(0);
    control.add(new Player(width, height));
    fill(#FF0318);
    textSize(50);
    text("Game Over :(", 250, 300);
    fill(255);
    textSize(17);
    text("PRESS ENTER OR CLICK TO RESTART", 270, height / 2);
    otherBullets = new ArrayList<Bullet>();
    enemies = new ArrayList<Enemy>();
    bullets = new ArrayList<Bullet>();
    score = 0;
  }
}

void spawn() {
  for (int i = 0; i < 5; i++) {
    enemies.add(new Enemy(-400 + random(200), height + i * 420, 0));
  }
}

void spawnMove() {
  // move them up
  for (Enemy e : enemies) {
    while ((e.xCor < width / 2) && (e.yCor > (height * 0.1))) {
        e.display();
        e.xCor += 10;
    }
    e.spawned = true;
    for (int i = 0; i < enemies.size(); i++) {
      enemies.get(i).xCor += random(100);
    }
  }
}
  


void mousePressed() {
  if ((mouseY < (sButton[1] + sButton[3])) && (mouseY > sButton[1]) && sButton[4] == 0) {
     sButton[4] = 1;
  }
  if ((mouseY < (sButton[1] + sButton[3])) && (mouseY > sButton[1]) && sButton[4] == 2) {
     sButton[4] = 0;
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
  if(keyCode == 10 && sButton[4] == 0){
    sButton[4] = 1;
  }
  else if (keyCode == 10 && sButton[4] == 2) {
    sButton[4] = 0;
  }
  else if (keyCode == 37) {
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
        if (lShot > 10) {
          control.get(0).shoot();
          lShot = 0;
        }
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
