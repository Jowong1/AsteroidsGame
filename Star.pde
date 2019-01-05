class Stars
{
  int starX;
  int starY;
  int sSize;
  int sColor;

  public Stars()
  {
    sSize = (int)(Math.random()*8);
    sColor = color((int)(Math.random()*255), 100);
    starX = (int)(Math.random()*800);
    starY = (int)(Math.random()*800);
  }

  public void show()
  {
    noStroke();
    fill(sColor);
    ellipse(starX, starY, sSize, sSize);
  }
}
