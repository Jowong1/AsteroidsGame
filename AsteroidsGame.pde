/*TO DO LIST
-map perimeter
-bullets
-enemies
-asteroids
-collsion
-upgrades
-instructions manual
-pick fighter? maybe?
*/

Spaceship fighter;
ArrayList<Bullet> bullets;
Star[] stars;
ArrayList<Asteroids> rocks;
boolean accel = false;
boolean deccel = false;
boolean rotateRight = false;
boolean rotateLeft = false;
public void setup() 
{
  size(600,600);
  bullets = new ArrayList<Bullet>();
  fighter = new Spaceship();
  stars = new Star[100];
  rocks = new ArrayList<Asteroids>();
  
  for (int i = 0; i < stars.length; i++)
  {
    stars[i] = new Star();
  }
  for (int i = 0; i < 30; i++)
  {
    rocks.add(new Asteroids());
  }
  //your code here
}
public void draw() 
{
  background(0);
  
  if (accel == true) fighter.accelerate(0.05);
  if (deccel == true) fighter.accelerate(-0.05);
  if (rotateLeft == true) fighter.turn(-5);
  if (rotateRight == true) fighter.turn(5);
  for (int i = 0; i < stars.length; i++)
  {
    stars[i].show();
  }
  for (int i = 0; i < rocks.size(); i++)
  {
   rocks.get(i).show();
   rocks.get(i).move();
   float d = dist(fighter.getX(),fighter.getY(),rocks.get(i).getX(),rocks.get(i).getY());
   if (d < 18)
     rocks.remove(i);
  }
  for (int i = 0; i < bullets.size(); i++)
  {
   
   bullets.get(i).show();
   bullets.get(i).move();
  }
  
  for(int k = 0; k < rocks.size(); k++)
  {
    for(int j = 0; j < bullets.size(); j++)
    {
      float b = dist((float)bullets.get(j).getX(), (float)bullets.get(j).getY(), (float)rocks.get(k).getX(), (float)rocks.get(k).getY());
      if(b < 20)
      {
        bullets.remove(j);
        rocks.remove(k);
        break;
      }
    }
  }
  fighter.show();
  fighter.move();
  
}
public void keyPressed()
{
  if(keyCode == UP)accel = true;
  if(keyCode == LEFT)rotateLeft = true;
  if(keyCode == RIGHT)rotateRight = true;
  if(keyCode == DOWN) deccel = true;
  //hyperspace
  if(keyCode == 72)
  {
    fighter.setX((int)(Math.random()*width));
    fighter.setY((int)(Math.random()*height));
    fighter.setPointDirection((int)(Math.random()*360));
    fighter.setDirectionX(0);
    fighter.setDirectionY(0);
  }
  if(key == ' ')
    bullets.add(new Bullet(fighter));
   
}

void keyReleased()
{
  if (keyCode == UP) accel = false;
  if (keyCode == LEFT) rotateLeft = false;
  if (keyCode == RIGHT) rotateRight = false;
  if (keyCode == DOWN) deccel = false;
}
