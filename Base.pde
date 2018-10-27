class Base{
  private int baseCenterX, baseCenterY;//, bCX, bCY;
  public Base(){
    baseCenterX = 900;
    baseCenterY = 725;
    part1Rad = 1;
    part1Shade = 0;
    part2Rad = 1;
    part2Shade = 0;
  }
  private int bCX;
  private int bCY;
  private float spinSpokes;
  private float part1Rad, part1Shade, part2Rad, part2Shade;
  private boolean mine1, mine2, activateMine1Sign, activateMine2Sign;
  private int signColor, signColorChange;
  //private String leftBox;
  //private int uSpeed;
  //float rot;
  public void show(){
    bCX = baseCenterX - (int)fighter.myCenterX;
    bCY = baseCenterY - (int)fighter.myCenterY;
    translate(0,0);
    //pushMatrix();
    //rotate(rot);
    //rot = rot + 0.001;
    //fill(0,255,0,200);
    noFill();
    if(clicked == true && mouseX > bCX - 80 && mouseX < bCX + 80 && mouseY < bCY - 280 && mouseY > bCY - 450){
      mine1 = true;
    }else{
      activateMine1Sign = true;
    }
    if(clicked == true && mouseX > bCX - 80 && mouseX < bCX + 80 && mouseY > bCY + 280 && mouseY < bCY + 450){
      mine2 = true;
    }else{
      activateMine2Sign = true;
    }
    if(bCY < 825 && bCY > -175 && bCX < 750 && bCX > 250){// Original 0 < bCY < 600
      shipInterior();
      shipItems();
      shipMines();
      shipUpgrades();
      shipSigns();
    }else{
      shipMines();
      shipExterior();
    }

    //println((baseCenterX - (int)fighter.myCenterX) + ", " + (baseCenterY -(int)fighter.myCenterY));
    fill(255, 255, 255);
    //Reset strokeWeight and stroke
    strokeWeight(1);
    stroke(0);
  }
  
  public void shipMines(){
    //TOP MINE
    if(mouseX > bCX - 80 && mouseX < bCX + 80 && mouseY < bCY - 280 && mouseY > bCY - 450 && mine1 == true){
      // Feet
      noStroke();
      fill(100);
      ellipse(bCX - 60, bCY - 425, 30, 30);
      ellipse(bCX + 60, bCY - 425, 30, 30);
      ellipse(bCX - 60, bCY - 305, 30, 30);
      ellipse(bCX + 60, bCY - 305, 30, 30);
      fill(125);
      ellipse(bCX - 60, bCY - 425, 15, 15);
      ellipse(bCX + 60, bCY - 425, 15, 15);
      ellipse(bCX - 60, bCY - 305, 15, 15);
      ellipse(bCX + 60, bCY - 305, 15, 15);
      // Legs
      stroke(150);
      line(bCX - 60, bCY - 305, bCX - 20, bCY - 355);
      line(bCX + 60, bCY - 305, bCX + 20, bCY - 355);
      line(bCX - 60, bCY - 425, bCX - 20, bCY - 375);
      line(bCX + 60, bCY - 425, bCX + 20, bCY - 375);
      // Container
      noStroke();
      fill(100);
      fill(125);
      ellipse(bCX, bCY - 365, 100, 100);
      fill(50);
      ellipse(bCX, bCY - 365, 80, 80);
      // Spokes
      fill(150);
      pushMatrix();
      translate(bCX, bCY - 365);
      rotate(spinSpokes);
      rect(0, -35,3,10);
      rotate(0.5);
      rect(35,0,10,3);
      rotate(-1);
      rect(-35,0,10,3);
      popMatrix();
      fill(50);
      ellipse(bCX, bCY - 365, 60, 60);
      pushMatrix();
      translate(bCX, bCY - 365);
      rotate(spinSpokes);
      // Particle beam
      fill(74, 189, 232, part1Shade - 30);
      rect(0, -15,1,30);
      rotate(0.5);
      rect(15,0,30,1);
      rotate(-1);
      rect(-15,0,30,1);
      // "unrotate"
      rotate(0.5);
      
      // Dots on end of spokes
      fill(40);
      ellipse(0, -27,8,8);
      rotate(0.5);
      ellipse(27,0,8,8);
      rotate(-1);
      ellipse(-27,0,8,8);
      popMatrix();
      spinSpokes = spinSpokes + 0.01;
      
      // Particle
      fill(74, 189, 232, part1Shade);
      ellipse(bCX, bCY - 365, part1Rad, part1Rad);
    }
    //partRad = partRad + 0.15;
    //BOTTOM MINE
    if(mouseX > bCX - 80 && mouseX < bCX + 80 && mouseY > bCY + 280 && mouseY < bCY + 450 && mine2 == true){
      // Feet
      noStroke();
      fill(100);
      ellipse(bCX - 60, bCY + 425, 30, 30);
      ellipse(bCX + 60, bCY + 425, 30, 30);
      ellipse(bCX - 60, bCY + 305, 30, 30);
      ellipse(bCX + 60, bCY + 305, 30, 30);
      fill(125);
      ellipse(bCX - 60, bCY + 425, 15, 15);
      ellipse(bCX + 60, bCY + 425, 15, 15);
      ellipse(bCX - 60, bCY + 305, 15, 15);
      ellipse(bCX + 60, bCY + 305, 15, 15);
      // Legs
      stroke(150);
      line(bCX - 60, bCY + 305, bCX - 20, bCY + 355);
      line(bCX + 60, bCY + 305, bCX + 20, bCY + 355);
      line(bCX - 60, bCY + 425, bCX - 20, bCY + 375);
      line(bCX + 60, bCY + 425, bCX + 20, bCY + 375);
      // Container
      noStroke();
      fill(100);
      fill(125);
      ellipse(bCX, bCY + 365, 100, 100);
      fill(50);
      ellipse(bCX, bCY + 365, 80, 80);
      // Spokes
      fill(150);
      pushMatrix();
      translate(bCX, bCY + 365);
      rotate(spinSpokes);
      rect(0, -35,3,10);
      rotate(0.5);
      rect(35,0,10,3);
      rotate(-1);
      rect(-35,0,10,3);
      popMatrix();
      fill(50);
      ellipse(bCX, bCY + 365, 60, 60);
      pushMatrix();
      translate(bCX, bCY + 365);
      rotate(spinSpokes);
      // Particle beam
      fill(74, 189, 232, part2Shade - 30);
      rect(0, -15,1,30);
      rotate(0.5);
      rect(15,0,30,1);
      rotate(-1);
      rect(-15,0,30,1);
      // "unrotate"
      rotate(0.5);
      
      // Dots on end of spokes
      fill(40);
      ellipse(0, -27,8,8);
      rotate(0.5);
      ellipse(27,0,8,8);
      rotate(-1);
      ellipse(-27,0,8,8);
      popMatrix();
      spinSpokes = spinSpokes + 0.01;
      
      // Particle
      fill(74, 189, 232, part2Shade);
      ellipse(bCX, bCY + 365, part2Rad, part2Rad);
    }
    // Particle 1
    if(mine1 == true){
      part1Rad = part1Rad + 0.15;
      part1Shade = part1Shade + 1.5;
      if(part1Rad > 35){
        part1Rad = 1;
        part1Shade = 0;
        nova++;
      }
    }
    // Particle 2
    if(mine2 == true){
      part2Rad = part2Rad + 0.15;
      part2Shade = part2Shade + 1.5;
      if(part2Rad > 35){
        part2Rad = 1;
        part2Shade = 0;
        nova++;
      }
    }
  }
  
  public void shipSigns(){
    if(activateMine1Sign == true && mine1 == false){
      fill(signColor);
      textSize(30);
      text("Click to\nActivate", bCX, bCY - 370);
    }
    if(activateMine2Sign == true && mine2 == false){
      fill(signColor);
      textSize(30);
      text("Click to\nActivate", bCX, bCY + 360);
    }
    signColor = signColor + signColorChange;
    if(signColor > 235){
      signColorChange = -3;
    }
    if(signColor < 5){
      signColorChange = 2;
    }
    //signColorChange = signColorChange + 2;
  }
  public void shipItems(){
    // Left Boxes
    rect(bCX - 200, bCY - 175, 50, 100);
    rect(bCX - 200, bCY, 50, 100);
    rect(bCX - 200, bCY + 175, 50, 100);
    // Right Boxes
    rect(bCX + 200, bCY - 175, 50, 100);
    rect(bCX + 200, bCY, 50, 100);
    rect(bCX + 200, bCY + 175, 50, 100);
    // Mines (Top / Bottom)
    rect(bCX, bCY - 365, 160, 160);
    rect(bCX, bCY + 365, 160, 160);
  }
  
  public void shipUpgrades(){
    textAlign(CENTER, CENTER);
    textSize(30);
    fill(180);
    // Left Boxes
    //leftBox = "mouseX < bCX - 175 && mouseX > bCX - 225 && mouseY < bCY - 125 && mouseY > bCY - 225";
    //Speed, Turn, Rate(of fire), Health, Hyperspace, Gun?
    if(mouseX < bCX - 175 && mouseX > bCX - 225 && mouseY < bCY - 125 && mouseY > bCY - 225){
      text(uSpeed , bCX - 200, bCY - 175);
    }
    if(mouseX < bCX - 175 && mouseX > bCX - 225 && mouseY < bCY + 50 && mouseY > bCY - 50){
      text("0" , bCX - 200, bCY);
    }
    if(mouseX < bCX - 175 && mouseX > bCX - 225 && mouseY > bCY + 125 && mouseY < bCY + 225){
      text("0" , bCX - 200, bCY + 175);
    }
    // Right Boxes
    if(mouseX > bCX + 175 && mouseX < bCX + 225 && mouseY < bCY - 125 && mouseY > bCY - 225){
      text("0" , bCX + 200, bCY - 175);
    }
    if(mouseX > bCX + 175 && mouseX < bCX + 225 && mouseY < bCY + 50 && mouseY > bCY - 50){
      text("0" , bCX + 200, bCY);
    }
    if(mouseX > bCX + 175 && mouseX < bCX + 225 && mouseY > bCY + 125 && mouseY < bCY + 225){
      text("0" , bCX + 200, bCY + 175);
    }
    if(clicked == true && mouseX < bCX - 175 && mouseX > bCX - 225 && mouseY < bCY - 125 && mouseY > bCY - 225){
      uSpeed++;
      clicked = false;
    }else{
      clicked = false;
    }
    //print(clicked);
    //print(uSpeed);
  }
  
  public void shipInterior(){
    stroke(0,255,0,150);
      strokeWeight(5);
      fill(0);
      ellipse(bCX, bCY - 250, 500, 500);
      ellipse(bCX, bCY + 250, 500, 500);
      rect(bCX, bCY, 500, 500);
      ellipse(bCX, bCY, 100, 100);
  }
  
  public void shipExterior(){
      strokeWeight(5);
      stroke(40); // color of outside border of panels
      line(bCX - 628, bCY - 248, bCX - 628, bCY + 248);
      line(bCX + 627, bCY - 248, bCX + 627, bCY + 248);
      line(bCX - 628, bCY + 251, bCX - 379, bCY + 281);
      line(bCX + 627, bCY + 251, bCX + 378, bCY + 281);
      noStroke();
      fill(75); // color of metal bar
      rect(bCX, bCY, 800, 20);
      fill(100); // color of ship
      rect(bCX, bCY, 500, 500);
      ellipse(bCX, bCY - 250, 500, 500);
      ellipse(bCX, bCY + 250, 500, 500);
      fill(50);
      ellipse(bCX - 248, bCY, 20, 22);
      fill(75);
      ellipse(bCX - 250, bCY, 20, 20);
      fill(50);
      ellipse(bCX + 248, bCY, 20, 22);
      fill(75);
      ellipse(bCX + 250, bCY, 20, 20);
      fill(100, 100);
      //rect(bCX + 500, bCY, 250, 500);
      //rect(bCX - 500, bCY, 250, 500);
      beginShape();
      fill(50);
      vertex(bCX + 625, bCY - 250);
      vertex(bCX + 625, bCY + 250);
      vertex(bCX + 375, bCY + 280);
      vertex(bCX + 375, bCY - 220);
      endShape(CLOSE);
      beginShape();
      fill(50);
      vertex(bCX - 625, bCY - 250);
      vertex(bCX - 625, bCY + 250);
      vertex(bCX - 375, bCY + 280);
      vertex(bCX - 375, bCY - 220);
      endShape(CLOSE);
      // Panel Grid
      strokeWeight(2);
      stroke(100, 100); // set grid color
      // VERTICAL
      line(bCX - 600, bCY - 246, bCX - 600, bCY + 251);
      line(bCX - 550, bCY - 240, bCX - 550, bCY + 257);
      line(bCX - 500, bCY - 234, bCX - 500, bCY + 263);
      line(bCX - 450, bCY - 228, bCX - 450, bCY + 269);
      line(bCX - 400, bCY - 222, bCX - 400, bCY + 275);
      // Other side
      line(bCX + 600, bCY - 246, bCX + 600, bCY + 251);
      line(bCX + 550, bCY - 240, bCX + 550, bCY + 257);
      line(bCX + 500, bCY - 234, bCX + 500, bCY + 263);
      line(bCX + 450, bCY - 228, bCX + 450, bCY + 269);
      line(bCX + 400, bCY - 222, bCX + 400, bCY + 275);
      // HORIZONTAL
      line(bCX - 623.5, bCY - 221, bCX - 376, bCY - 195 + 4);
      line(bCX - 623.5, bCY - 146.5, bCX - 376, bCY - 120.5 + 4);
      line(bCX - 623.5, bCY - 72, bCX - 376, bCY - 46 + 5);
      line(bCX - 623.5, bCY + 2.5, bCX - 376, bCY + 28.5 + 4);
      line(bCX - 623.5, bCY + 77, bCX - 376, bCY + 103 + 4);
      line(bCX - 623.5, bCY + 151.5, bCX - 376, bCY +177.5 + 4);
      line(bCX - 623.5, bCY + 226, bCX - 376, bCY + 252 + 4);
      // Other side
      line(bCX + 623.5, bCY - 221, bCX + 376, bCY - 195 + 4);
      line(bCX + 623.5, bCY - 146.5, bCX + 376, bCY - 120.5 + 4);
      line(bCX + 623.5, bCY - 72, bCX + 376, bCY - 46 + 5);
      line(bCX + 623.5, bCY + 2.5, bCX + 376, bCY + 28.5 + 4);
      line(bCX + 623.5, bCY + 77, bCX + 376, bCY + 103 + 4);
      line(bCX + 623.5, bCY + 151.5, bCX + 376, bCY +177.5 + 4);
      line(bCX + 623.5, bCY + 226, bCX + 376, bCY + 252 + 4);
    }
}
