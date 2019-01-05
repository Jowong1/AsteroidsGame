SpaceShip fighter;
Stars [] sky;
ArrayList <Asteroid> rocks = new ArrayList <Asteroid>();
ArrayList <Bullet> bill = new ArrayList <Bullet>();
public void setup() 
{
  size(750,750);
  fighter = new SpaceShip();
  sky = new Stars[100];
  for(int i = 0; i < sky.length; i++)
    {
      sky[i] = new Stars();
    }
    for(int i = 0; i < 20; i++)
    {
      rocks.add(new Asteroid());
    }

}
public void draw() 
{
  background(0);
  
  for(int i = 0; i < sky.length; i++)
    {
      sky[i].show();
    }

  for(int i = 0; i < rocks.size(); i++)
  {
    rocks.get(i).show();
    rocks.get(i).move();
  }


  for (int i = 0; i < bill.size(); i++)
  {
    bill.get(i).show();
    bill.get(i).move();
  }
  for (int i = 0; i < bill.size(); i++)
  {
    for (int j = 0; j < rocks.size(); j++)
    {
      if(dist(bill.get(i).getX(), bill.get(i).getY(), rocks.get(j).getX(), rocks.get(j).getY()) < 20)
        rocks.remove(j);
    }
  }
  fighter.show();
  fighter.move();


}
 
public void keyPressed()
{
  if (key == ' ')
  {
    bill.add(new Bullet(fighter));
  }
  if (key == 'w')
  {
    fighter.accelerate(.2);
  }
  if (key == 's')
  {
    fighter.accelerate(-.2);
  }
  if (key == 'a')
  {
    fighter.rotate(-12);
  }
  if (key == 'd')
  {
    fighter.rotate(12);
  }
  if (key == 'h')
  {
    fighter.setX((int)(Math.random()*800));
    fighter.setY((int)(Math.random()*800));
    fighter.setDirectionX(0);
    fighter.setDirectionY(0);
    fighter.setPointDirection((int)(Math.random()*360));
  }
}
