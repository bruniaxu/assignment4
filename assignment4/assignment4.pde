//here's my assignment
//adding variables
//array 
penguin[] penguins;
int score = 0;
int state = 0;
ball launchBall;

//setup
void setup(){
  size(400,400);
  //create more penguins
  penguins = new penguin[6];
  for (int i = 0; i < penguins.length; i++) {
   float startX = 40 + i * 60;
   float startY = 320;
   // some penguins are fake
   boolean fakeOne = random(1) < 0.4;
   penguins[i] =new penguin(startX, startY, fakeOne);
   
  }
  
  launchBall = null;
  
}



//draw
void draw(){
  background(209,243,255);//draw the sky : light blue colour
  fill(185,237,255);//ice darker blue
  stroke(171,225,245); //blue outline
  quad(0,280,400,280,400,400,0,400);//draw the floor-ice
  
  //draw the scoreboard
  fill(124,113,95);
  stroke(155,138,112);
  quad(110,40,290,40,290,80,110,80);
  fill(155,138,112);
  quad(130,45,270,45,270,75,130,75);
  ellipse(120,60,10,10);
  ellipse(280,60,10,10);
  
  if (state == 0) {
    // playing

    // move and display penguins
    for (int i = 0; i < penguins.length; i++) {
      penguins[i].move();
      penguins[i].display();
    }

    // update and display ball
    if (launchBall != null) {
      launchBall.move();
      launchBall.display();

      // check collision with all penguins
      for (int i = 0; i < penguins.length; i++) {
        if (penguins[i].real && launchBall.active && penguins[i].hitBall(launchBall)) {

          // ball disappears after hitting
          launchBall.active = false;

          if (penguins[i].ditto) {
            // fake penguin = gain score
            score++;
            penguins[i].resetPenguin();

            // win at 20 points
            if (score >= 10) {
              state = 1;
            }

          } else {
            // real penguin = lose
            state = 2;
          }
        }
      }

      // remove ball if off screen
      if (launchBall.y < 0 ||launchBall.active == false) {
        launchBall = null;
      }
    }
    

  } else if (state == 1) {
    // win screen
    EndScreen(true);

  } else if (state == 2) {
    // lose screen
    EndScreen(false);
  
  
  }
  
  //draw text on scoreboard
  fill(255);//white
  textAlign(CENTER, CENTER);//make text in center
  textSize(20); 
  text(score, 200, 60);
  
  //display cursor and gun
  launcher();
  
}
void EndScreen(boolean win) {
  fill(0, 140);
  noStroke();
  rect(0, 0, width, height);

  // panel
  fill(213,191,255);
  stroke(255);
  strokeWeight(2);
  rect(80, 100, 240, 180, 20);

  if (win) {
    winTap(200, 155);
  } else {
    loseTap(200, 155);
  }

  restart(200, 235);
}


//winning tap
void winTap(float x, float y) {
  pushMatrix();

  //position
  translate(x - 82, y - 260);

  //draw the penguin/winning pic
  fill(0);
  noStroke();
  fill(203,203,203);//light grey
  ellipse(82,290,40,55);//neck + body
  ellipse(84,308,48,65);//mid
  ellipse(82,320,45,40);//bottom
  triangle(61,320,55,330,80,340);//tail

  fill(0);
  //feet
  ellipse(86,338,15,10);//left
  ellipse(104,325,12,12);//right

  //belly
  fill(255);
  ellipse(88,319,38,38);
  ellipse(89,310,38,43);

  //near left wing
  fill(203,203,203);//light grey
  quad(65,295,82,292,80,335,65,335);

  fill(0);
  //feet
  ellipse(86,338,15,10);//left

  //wing
  fill(188,188,188);//grey
  ellipse(103,295,10,15);//right
  fill(0);
  ellipse(71,310,13,22);//left
  ellipse(102,295,10,16);//right
  fill(188,188,188);//grey
  ellipse(72,308,13,22);//left

  //neck orange part
  fill(255,190,59);//orange
  quad(82,292,102,286,107,302,80,302);
  triangle(107,302,95,308,80,302);
  fill(0);
  ellipse(81,275,40,38);//head

  //draw face patterns
  fill(255);
  ellipse(90,278,22,24);//white
  fill(255,190,59);//orange
  ellipse(83,290,25,13);

  //mouth/beak
  fill(0);
  ellipse(103,279,15,13);
  fill(255,190,59);//orange
  triangle(96,278,97,282,106,280);

  // happy winning face
  fill(82,210,255);//blue
  ellipse(89,278,6,6);
  fill(0);
  ellipse(89,278,5,5);

  //draw crown
  stroke(198,185,64);
  fill(247,229,60);
  triangle(75,251,72,257,77,256);//left
  triangle(85,251,82,256,87,257);//right
  triangle(80,250,76,256,84,256);//mid

  noStroke();
  triangle(75,251,73,257,76,256);//left
  triangle(85,251,83,256,86,257);//right
  triangle(80,250,77,256,83,256);//mid

  stroke(198,185,64);
  ellipse(75,250,3,3);//left
  ellipse(85,250,3,3);//right
  ellipse(80,249,3,3);//mid

  popMatrix();
}

// lose icon
void loseTap(float x, float y) {
  pushMatrix();
  translate(x - 82, y - 260);

  //draw the penguin
  noStroke();

  fill(203,203,203);//light grey
  ellipse(82,290,40,55);
  ellipse(84,308,48,65);
  ellipse(82,320,45,40);
  triangle(61,320,55,330,80,340);

  fill(0);//black
  ellipse(86,338,15,10);
  ellipse(104,325,12,12);

  fill(255);
  ellipse(88,319,38,38);
  ellipse(89,310,38,43);

  fill(203,203,203);
  quad(65,295,82,292,80,335,65,335);

  fill(0);
  ellipse(86,338,15,10);

  fill(188,188,188);
  ellipse(103,295,10,15);

  fill(0);
  ellipse(71,310,13,22);
  ellipse(102,295,10,16);

  fill(188,188,188);
  ellipse(72,308,13,22);

  fill(255,190,59);
  quad(82,292,102,286,107,302,80,302);
  triangle(107,302,95,308,80,302);

  fill(0);
  ellipse(81,275,40,38);

  //face
  fill(255);
  ellipse(90,278,22,24);

  fill(255,190,59);
  ellipse(83,290,25,13);

  fill(0);
  ellipse(103,279,15,13);

  fill(255,190,59);
  triangle(96,278,97,282,106,280);

  //cross eye X X 
  stroke(0);
  strokeWeight(2);
  //eye X
  line(85,275,93,283);
  line(93,275,85,283);


  //draw crown
  stroke(198,185,64);
  fill(247,229,60);
  triangle(75,251,72,257,77,256);
  triangle(85,251,82,256,87,257);
  triangle(80,250,76,256,84,256);
  noStroke();
  triangle(75,251,73,257,76,256);
  triangle(85,251,83,256,86,257);
  triangle(80,250,77,256,83,256);
  stroke(198,185,64);
  ellipse(75,250,3,3);
  ellipse(85,250,3,3);
  ellipse(80,249,3,3);

  popMatrix();
}


//restart button//play button
void restart(float x, float y) {

  //draw the tap
  rectMode(CENTER);
  fill(131,194,255);//sky blue
  stroke(77,116,191);//darker blue
  strokeWeight(2);
  rect(x, y, 100, 45, 12);
  //play button
  noStroke();
  fill(77,116,191);//darker blue
  triangle(x - 8, y - 12,x - 8, y + 12,x + 12, y);
  rectMode(CORNER);
}


//use keyPressed to make players able to press E to launch the ball
void keyPressed() {
  if (state == 0) {
    if ((key == 'e' || key == 'E') &&launchBall == null) {
      launchBall = new ball(mouseX, 345);
    }
  }
}


//use mousepressed to allow players to click the button-restart to restart the game
void mousePressed() {
  if (state == 1||state == 2) {
    //button area centered at (200,235), size 95 x 42
    if (mouseX > 152 && mouseX < 248 && mouseY > 214 && mouseY < 256) {
      restartGame();
    }
  }
}


//restart game
void restartGame() {
  score = 0;
  state = 0;
  launchBall = null;

  for (int i = 0; i < penguins.length; i++) {
    float startX = 40 + i * 60;
    float startY = 320;
    boolean fakeOne = random(1) < 0.35;
    penguins[i] = new penguin(startX, startY, fakeOne);
  }
}
