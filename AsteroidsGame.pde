Spaceship fighter;
Star[] stars = new Star[2000];
Base home;
boolean accelerating, decelerating, leftTurn, rightTurn;
boolean releasedKey = false;
boolean clicked = false;
int accelerateCount = 0;
int decelerateCount = 0;
double ex;
boolean movingMouse = false;
int notMovingMouse;
// UPGRADES
int uSpeed;
// CURRENCY
int nova;
boolean deceleratingDown;

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
  if(movingMouse == false){
    notMovingMouse++;
  }else{
    cursor(CROSS);
    notMovingMouse = 0;
    movingMouse = false;
  }
  if(notMovingMouse > 100){
    noCursor();
  }
  for(int i = 0; i < stars.length; i++){
    stars[i].show();
  }
  home.show();
  /*
  you get from the point you released rotate 2) find the difference
  (point1 vs point2 // point1 - point2) and accelerate(opposite) or (towards point 1)
  */
  translate(width/2 - (int)fighter.myCenterX, height/2 - (int)fighter.myCenterY);
  pushMatrix();
  fighter.show();
  fighter.move();
  fighter.deceleratee();
  popMatrix();
  fill(255);
  textAlign(CENTER);
  //if(accelerating == false && deceleratingDown == false){
  text("Nova: $" + nova, (int)fighter.myCenterX - 400 , (int)fighter.myCenterY - 250);
  //}
  if(accelerating == true){// && maxSpdCtAcc <= 100){ // && leftTurn == false && rightTurn == false
    fighter.accelerate(0.5); //fighter.constantVel(5); //fighter.accelerate(0.1);
  }
  if(decelerating == true){// && maxSpdCtAcc >= -100){ // && leftTurn == false && rightTurn == false
    fighter.acceleratee(-0.2); //fighter.constantVel(-5); //fighter.accelerate(-0.1);
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
  //fighter.myCenterX = lerp((int)fighter.myCenterX, (int)ex, 0.01);
}
public void mouseMoved(){
  movingMouse = true;
}
public void mousePressed(){
  clicked = true;
}
//public void mouseReleased(){
//  //clicked = false;
//}
public void keyPressed(){
  releasedKey = false;
  if(key == 'w'){accelerating = true;}
  if(key == 's'){decelerating = true;}
  if(key == 'a'){leftTurn = true;}
  if(key == 'd'){rightTurn = true;}
}

public void keyReleased(){
  releasedKey = true;
  if(key == 'w'){accelerating = false;}
  if(key == 's'){decelerating = false;}
  if(key == 'a'){leftTurn = false;}
  if(key == 'd'){rightTurn = false;}
}
