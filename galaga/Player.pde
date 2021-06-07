public class Player{
  float xMax;
  float yMax;
  float xCor;
  float yCor;
  boolean left;
  boolean right;
  boolean up;
  boolean down;
  boolean kill;   
  
  Player(float w, float h){
    xMax = w;
    yMax = h;
    xCor = w / 2;
    yCor = h * 0.9;
    left = false;
    right = false;
    up = false;
    down = false;
    kill = false;
  }
  
  void display(){
    if (kill) {
      
    } else {
      fill(255);
      triangle(xCor - 20, yCor + 40, xCor, yCor, xCor + 20, yCor + 40);
      fill(0);
      ellipse(xCor + 5, yCor + 20, 2, 2);
      ellipse(xCor - 5, yCor + 20, 2, 2);
      rect(xCor - 5, yCor + 30, 10, 2);
      for (Bullet b : bullets) {
        b.move();
        b.display();
      }
      collide();
    }
  }
  
  void shoot() {
    ArrayList<Bullet> toRep = new ArrayList<Bullet>();
    if (bullets.size() > 40) {
      for (int i = 20; i < 40; i++) {
        toRep.add(bullets.get(i));
      }
      bullets = toRep;
    }
    Bullet toAdd = new Bullet(xCor, yCor, 0);
    bullets.add(toAdd);
  }
  
  void collide(){
    for(Bullet b: otherBullets){
      // left check
      if (b.xCor <= xCor + 20 && b.xCor >= xCor - 20) {
        for(float i = xCor - 20;i <= xCor;i++){
          if (i != b.xCor) {
          }
          else {
            float upper = ((i - (xCor - 20)) * 2) + yCor - 40;
            if (b.yCor + 20 < upper && b.yCor + 20 > yCor + 20) {
              kill = true;
            }
            if (b.yCor < upper && b.yCor + 20 > yCor + 20) {
              kill = true;
            }
          }
        }
        if (kill == false) {
          for(float i = xCor + 20;i > xCor;i--){
            if (i != b.xCor) {
            }
            else {
              float upper = (abs(i - (xCor - 20)) * 2) + yCor - 40;
              if (b.yCor + 20 < upper && b.yCor + 20 > yCor + 20) {
                kill = true;
              }
              if (b.yCor < upper && b.yCor + 20 > yCor + 20) {
                kill = true;
              }
            }
          }
        }
      }
    }
  }
}
