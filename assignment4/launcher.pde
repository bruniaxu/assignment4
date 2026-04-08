

void launcher() {
  //draw the cursor
  stroke(255,95,95);//red
  strokeWeight(2);
  noFill();
  ellipse(mouseX, mouseY, 22, 22);
  line(mouseX-14, mouseY, mouseX-6, mouseY);
  line(mouseX+6, mouseY, mouseX+14, mouseY);
  line(mouseX, mouseY-14, mouseX, mouseY-6);
  line(mouseX, mouseY+6, mouseX, mouseY+14);


  //draw the launcher //that launches the ball
  noStroke();
  fill(171,108,255);//purpler
  //gun
  //rect(mouseX-4,375, 9, 5);
  ellipse(mouseX,395, 35,15);
  fill(196,152,255);//light purple
  //rect(mouseX-7, 380, 15, 15);
  //ring
  fill(240,229,255);//glass purple
  ellipse(mouseX, 393,30,12);
  stroke(116,46,209);//dark purple
  fill(255,137,192);//pink
  ellipse(mouseX, 391, 25, 11);
  //gun
  //noStroke();
  //fill(240,229,255);//purple glass
  //rect(mouseX-5,381, 11, 13);
  
  //stroke(196,152,255);//light purple
 
  //fill(171,108,255);//purpler
  //rect(mouseX-6,382, 13, 6);
  //fill(171,108,255);//purpler
  //rect(mouseX-6,390, 13, 3);
  
}
