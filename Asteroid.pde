class Asteroid extends Floater
{
    
    private int aRotate;
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

    public Asteroid()
    {
    myColor = color(81, 74, 74);
      
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
      myCenterX = (int)(Math.random()*800);
      myCenterY = (int)(Math.random()*800);
      aRotate = (int)((Math.random()*8)-3);
    
  
    }
    public void move()
    {
      rotate(aRotate);
      super.move();
      myCenterX += Math.cos(aRotate);
      myCenterY += Math.sin(aRotate);
    }

}
