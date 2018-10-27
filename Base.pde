class Base{
  private int baseCenterX, baseCenterY;//, bCX, bCY;
  public Base(){
    baseCenterX = 900;
    baseCenterY = 725;
  }
  private int bCX;
  private int bCY;
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
    if(bCY < 825 && bCY > -175 && bCX < 750 && bCX > 250){// Original 0 < bCY < 600
      shipInterior();
      shipItems();
      shipUpgrades();
    }else{
      shipExterior();
    }

    //println((baseCenterX - (int)fighter.myCenterX) + ", " + (baseCenterY -(int)fighter.myCenterY));
    fill(255, 255, 255);
    //Reset strokeWeight and stroke
    strokeWeight(1);
    stroke(0);
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
  }
  
  public void shipUpgrades(){
    textAlign(CENTER, CENTER);
    textSize(30);
    fill(180);
    // Left Boxes
    //leftBox = "mouseX < bCX - 175 && mouseX > bCX - 225 && mouseY < bCY - 125 && mouseY > bCY - 225";
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
      
      /*
      noStroke();
      fill(255, 255, 255, 50);
      ellipse(bCX, bCY - 250, 500, 500);
      ellipse(bCX, bCY + 250, 500, 500);
      fill(0);
      rect(bCX, bCY, 500, 500);
      fill(255, 255, 255, 50);
      rect(bCX, bCY, 500, 500);
      ellipse(bCX, bCY, 100, 100);
      */
    //popMatrix();
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
