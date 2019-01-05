class Asteroids extends Floater
{
  private int rotSpeed;
  public Asteroids(){
    corners = 6;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -11;
    yCorners[0] = -8;
    xCorners[1] = -2;
    yCorners[1] = -10;
    xCorners[2] = 13;
    yCorners[2] = 0;
    xCorners[3] = 7;
    yCorners[3] = 8;
    xCorners[4] = -2;
    yCorners[4] = 10;
    xCorners[5] = -13;
    yCorners[5] = 0;
    
    myColor = color(150);
    myCenterX = (Math.random()*width);
    myCenterY = (Math.random()*width);
    myDirectionX = (Math.random());
    myDirectionY = (Math.random());
    myPointDirection = 0;
    rotSpeed = (int)(Math.random()*8)-4;
  }
  public void move()
  {
    super.move();
    turn(rotSpeed);
  }
  public void setX(int x){myCenterX = x;}  
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY = y;} 
  public int getY(){return (int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX = x;}   
  public double getDirectionX(){return myDirectionX;}   
  public void setDirectionY(double y){myDirectionY = y;}   
  public double getDirectionY(){return myDirectionY;}   
  public void setPointDirection(int degrees){myPointDirection = degrees;}   
  public double getPointDirection(){return myPointDirection;} 
}
