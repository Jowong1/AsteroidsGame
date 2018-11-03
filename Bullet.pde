class Bullet extends Floater{
  public void setX(int x){myCenterX = x;}
  public int getX() {return((int)myCenterX);}
  public void setY(int y) {myCenterY = y;}
  public int getY() {return((int)myCenterY);}
  public void setDirectionX(double x) {myDirectionX = x;}   
  public double getDirectionX() {return(myDirectionX);}
  public void setDirectionY(double y) {myDirectionY = y;}   
  public double getDirectionY() {return(myDirectionY);}   
  public void setPointDirection(int degrees) {myPointDirection = degrees;}   
  public double getPointDirection() {return(myPointDirection);}
  
  //private double dRadians = myPointDirection*(Math.PI/180);
  public Bullet(Spaceship fighter){
    //myCenterX = fighter.getX();
    //myCenterY = fighter.getY();
    double dRadians = myPointDirection*(Math.PI/180);
    myPointDirection = fighter.getPointDirection();
    myDirectionX = 10 * Math.cos(dRadians) + fighter.getDirectionX();
    myDirectionY = 10 * Math.sin(dRadians) + fighter.getDirectionY();
  }
  
  public void show(){
    translate((float)myCenterX, (float)myCenterY);
    //rotate(dRadians);
    fill(255, 0, 0, 150);
    noStroke();
    fill(255,0, 0, 175);
    rect(40, 0, 25, 3, 50);
    // Unrotate
    //rotate(-1*dRadians);
    //    println(myCenterX + ", " +myCenterY);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }
  
  public void move(){
    myCenterX += myDirectionX;  
    myCenterY += myDirectionY;
    //myDirectionX = myCenterX + myDirectionX;
    //myDirectionY = myCenterY + myDirectionY;
    //    println(myDirectionX + ", " + myDirectionY);
  }
}
