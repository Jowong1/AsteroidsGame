Spaceship fighter;
Star[] stars= new Star[200];
boolean accelerating, decelerating, leftTurn, rightTurn;
boolean releasedKey = false;
int accelerateCount = 0;
int decelerateCount = 0;
double ex;
int maxSpdCtAcc;
int maxSpdCtDec;
//stars = [];
public void setup(){
  size(1000,650);
  background(0);
  //frameRate(50);
  fighter = new Spaceship();
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
  for(int i = 0; i < stars.length; i++){
    stars[i].show();
  }
  /*
  you get from the point you released rotate 2) find the difference
  (point1 vs point2 // point1 - point2) and accelerate(opposite) or (towards point 1)
  */
  translate(width/2 - (int)fighter.myCenterX, height/2 - (int)fighter.myCenterY);
  //println(
  fighter.show();
  fighter.move();
  if(accelerating == true){// && maxSpdCtAcc <= 100){ // && leftTurn == false && rightTurn == false
    fighter.constantVel(5); //fighter.constantVel(5); //fighter.accelerate(0.1);
    accelerateCount = accelerateCount + 1;
    maxSpdCtAcc = maxSpdCtAcc + 1;
  }
  if(decelerating == true){// && maxSpdCtAcc >= -100){ // && leftTurn == false && rightTurn == false
    fighter.constantVel(-5); //fighter.constantVel(-5); //fighter.accelerate(-0.1);
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
  println(maxSpdCtAcc);
  //fighter.myCenterX = lerp((int)fighter.myCenterX, (int)ex, 0.01);
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
