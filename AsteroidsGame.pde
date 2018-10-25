Spaceship fighter;

boolean accelerating, decelerating, leftTurn, rightTurn;

public void setup(){
  size(1000,650);
  background(0);
  //frameRate(50);
  fighter = new Spaceship();
}

public void draw(){
  background(0);
  fighter.show();
  fighter.move();
  if(accelerating == true){
    fighter.accelerate(0.1);
  }
  if(decelerating == true){
    fighter.accelerate(-0.1);
  }
  if(leftTurn == true){
    fighter.turn(-1);
  }
  if(rightTurn == true){
    fighter.turn(1);
  }
}

public void keyPressed(){
  if(key == 'w'){accelerating = true;}
  if(key == 's'){decelerating = true;}
  if(key == 'a'){leftTurn = true;}
  if(key == 'd'){rightTurn = true;}
}

public void keyReleased(){
  if(key == 'w'){accelerating = false;}
  if(key == 's'){decelerating = false;}
  if(key == 'w'){leftTurn = false;}
  if(key == 's'){leftTurn = false;}
}
