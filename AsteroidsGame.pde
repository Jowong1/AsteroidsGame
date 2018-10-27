Spaceship fighter;
Star[] stars = new Star[2000];
Base home;
boolean accelerating, decelerating, leftTurn, rightTurn;
boolean releasedKey = false;
boolean clicked = false;
int accelerateCount = 0;
int decelerateCount = 0;
double ex;
int maxSpdCtAcc;
int maxSpdCtDec;
int uSpeed;
//stars = [];
public void setup(){
  size(1000,650);
  frameRate(40);
  fighter = new Spaceship();
  home = new Base();
  //stars[i].setX((int)random(width));
  //stars.setY(random(height));
  //stars.setR(10);
  for(int i = 0; i < stars.length; i++){
    //stars[i].setX((int)random(width));
    //stars[i].setY((int)random(height));
    //stars[i].setR(10);
    //stars[i] = new Star((int)stars[i].getX(), (int)stars[i].getY(), (int)stars[i].getR());
    //println(stars[i].getX());
    stars[i] = new Star();
  }
}

public void draw(){
  background(0);
  //translate(0,0);
  //home.show();
  for(int i = 0; i < stars.length; i++){
    stars[i].show();
  }
  home.show();
  /*
  you get from the point you released rotate 2) find the difference
  (point1 vs point2 // point1 - point2) and accelerate(opposite) or (towards point 1)
  */
  translate(width/2 - (int)fighter.myCenterX, height/2 - (int)fighter.myCenterY);
  //println(
  fighter.show();
  fighter.move();
  fighter.deceleratee();
  
  if(accelerating == true){// && maxSpdCtAcc <= 100){ // && leftTurn == false && rightTurn == false
    fighter.accelerate(0.5); //fighter.constantVel(5); //fighter.accelerate(0.1);
    accelerateCount = accelerateCount + 1;
    maxSpdCtAcc = maxSpdCtAcc + 1;
  }
  if(decelerating == true){// && maxSpdCtAcc >= -100){ // && leftTurn == false && rightTurn == false
    fighter.acceleratee(-0.2); //fighter.constantVel(-5); //fighter.accelerate(-0.1);
    decelerateCount += 1;
    maxSpdCtAcc = maxSpdCtAcc - 1;
  }
  if(leftTurn == true){
    fighter.turn(-2);
  }
  if(rightTurn == true){
    fighter.turn(2);
  }

  //if(accelerateCount > 0 && releasedKey == true){
  //  accelerateCount = accelerateCount - 1;
  //  fighter.accelerate(-0.1);
  //}
  //////////println(accelerateCount);
  //println(maxSpdCtAcc);
  //fighter.myCenterX = lerp((int)fighter.myCenterX, (int)ex, 0.01);
  
}
public void mousePressed(){
  clicked = true;
}
public void mouseReleased(){
  clicked = false;
}
public void keyPressed(){
  releasedKey = false;
  if(key == 'w'){accelerating = true;}
  if(key == 's'){decelerating = true;}
  if(key == 'a'){//fighter.accelerate(0.1);
leftTurn = true;
ex = fighter.myCenterX;}
  if(key == 'd'){rightTurn = true;}
}

public void keyReleased(){
  releasedKey = true;
  if(key == 'w'){accelerating = false;}
  if(key == 's'){decelerating = false;}
  if(key == 'a'){leftTurn = false;}
  if(key == 'd'){rightTurn = false;}
}
