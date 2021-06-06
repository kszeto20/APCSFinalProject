public class Enemy{
  float xCor;
  float yCor;
  float dx;
  float dy;
  float yMax;
  boolean kill;
  
  Enemy(float w, float h){
    yMax = h;
    xCor = w / 2;
    yCor = h * 0.1;
    dx = 5;
    dy = 50;
  }
  
  void display(){
    fill(255, 0, 0);
    triangle(xCor - 20, yCor - 40, xCor, yCor, xCor + 20, yCor - 40);
    fill(255);
    noStroke();
    ellipse(xCor + 5, yCor - 20, 2, 2);
    ellipse(xCor - 5, yCor - 20, 2, 2);
    rect(xCor - 5, yCor - 30, 10, 2);       
    for (Bullet b : otherBullets) {
      b.move();
      b.display();
    }
  }
 
  void move(){
    xCor += dx;
    // flip dir when bounds are touched
    // left bound
    if (xCor < width * 0.2) {
      xCor = width * 0.2 + 1;
      dx *= -1;

      //yCor += dy;
    }
    //right bound
    if (xCor > width * 0.8) {
      xCor = width * 0.8 - 1;
      dx *= -1; 
      //yCor += dy;
    }
    // loops back to the top
    //if (yCor > yMax) {
    //  yCor = yMax * 0.1;
    //}
  }
  
  void shoot(){
    ArrayList<Bullet> toRep = new ArrayList<Bullet>();
    if (otherBullets.size() > 40) {
      for (int i = 20; i < 40; i++) {
        toRep.add(otherBullets.get(i));
      }
      otherBullets = toRep;
    }
    double r = random(10);
    if (r < 2) {
      Bullet toAdd = new Bullet(xCor, yCor - 30, 1);
      otherBullets.add(toAdd);
    }
  }
  
  void collide(){
    for(Bullet b: bullets){
      if (b.xCor <= xCor + 20 && b.xCor >= xCor - 20) {
        for(float i = xCor - 20;i <= xCor;i++){
          float factor = (i - (xCor - 20)) * 2;
          if(i != b.xCor){
           }
          else{ 
            if(b.yCor < factor + yCor - 40 && b.yCor > yCor - 40){
              kill = true;
              score += 100;
            }  
          }
        }
        for(float i = xCor + 20;i > xCor;i--){
          float factor = abs(i - (xCor + 20)) * 2;
          if(i != b.xCor){
           }
          else{ 
            if(b.yCor < factor + yCor - 40  && b.yCor > yCor - 40){
              kill = true;
              score += 100;
            }  
          }
        }
      }
    }
  }
}
