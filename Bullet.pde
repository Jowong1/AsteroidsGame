class Bullet extends Floater
{
  public void setX(int x) {myCenterX = x;} 
  public int getX() {return (int)myCenterX;}   
  public void setY(int y) {myCenterY = y;}   
  public int getY(){return (int)myCenterY;}   
  public void setDirectionX(double x) {myDirectionX = x;} 
  public double getDirectionX() {return myDirectionX;}  
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}
  public double getPointDirection() {return myPointDirection;}

  public Bullet(SpaceShip shoot)
  {
    myCenterX = shoot.getX();
    myCenterY = shoot.getY();
    myPointDirection = shoot.getPointDirection();
    double dRadians = myPointDirection*(Math.PI/180);
    myDirectionX = 5 * Math.cos(dRadians) + shoot.getDirectionX();
    myDirectionY = 5 * Math.sin(dRadians) + shoot.getDirectionY();

  }

  public void show()
  {
    stroke(0, 0, 245);
    fill(22, 196, 0);
    ellipse((float)myCenterX, (float)myCenterY, 8, 8);
  }
  public void move()
  {
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;
  }
}
