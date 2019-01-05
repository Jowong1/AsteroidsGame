class Star //note that this class does NOT extend Floater
{
  int starX;
  int starY;
  int starColor;
  int random;
  Star()
  {
    starX = (int)(Math.random()*width);
    starY = (int)(Math.random()*width);
    starColor = color((int)(Math.random()*256), 100);
    random = (int)(Math.random()*8) + 3;
  }
  public void show()
  {
    stroke(starColor,30 );
    fill(starColor);
    ellipse((float)starX,(float)starY,random,random);
  }
  //your code here
}
