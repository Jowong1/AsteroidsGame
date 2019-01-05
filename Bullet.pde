class Bullet extends Floater
{
  public Bullet(Spaceship fighter)
  {
    myCenterX = fighter.getX();
    myCenterY = fighter.getY();
    myPointDirection = fighter.getPointDirection();
    double dRadians =myPointDirection*(Math.PI/180);
    myDirectionX = 5 * Math.cos(dRadians) + fighter.getDirectionX();
    myDirectionY = 5 * Math.sin(dRadians) + fighter.getDirectionY();
    
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
  
  public void show(){
    
    fill(0,0,255);
    stroke(myColor);    
   
    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);
    
    ellipse((float)myDirectionX,(float)myDirectionY,5,5);
    
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }
  public void move(){
 //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX > width)
    {     
      shooters.remove(this);    
    }    
    else if (myCenterX < 0)
    {     
     shooters.remove(this);    
    }    
    if(myCenterY > height)
    {    
      shooters.remove(this);    
    } 
    
    else if (myCenterY < 0)
    {     
      shooters.remove(this);    
    }  
  }
}
