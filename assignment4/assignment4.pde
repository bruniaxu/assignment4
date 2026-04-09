//here's my assignment
//adding variables
//make a array for penguins class
penguin[] penguins;
//score should be set as 0 in the beginning
int score = 0;
//use state decides which tap/screen the game is on , 0=playing| 1=winning tap|2+ losing tap
int state = 0;
//store the ball that will be launch
ball launchBall;

//setup
void setup(){
  //create a 400x400 canvas
  size(400,400);
  //create more penguins by using array with 6 penguins
  penguins = new penguin[6];
  //create for loop that fills the array with penguins
  for (int i = 0; i < penguins.length; i++) {
    //make each penguin's starting position different & make space for each in between
   float startX = 40 + i * 60;
   //penguins walk on the same Y location
   float startY = 320;
   //some penguins are fake,they are generated randomly, random(1) make the value (0-1)
   //if it is less than 3.5, fake penguins appear
   boolean fakeOne = random(1) < 3.5;
   //make a new object and put it in arrary
   penguins[i] =new penguin(startX, startY, fakeOne);
   
  }
  
  //the ball wont be displayed at the start of the game
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
    //playing the game
    //move and display penguins
    for (int i = 0; i < penguins.length; i++) {
      penguins[i].move();
      penguins[i].display();
    }

    //update and display ball
    if (launchBall != null) {
      launchBall.move();
      launchBall.display();

      //check collision with all penguins
      for (int i = 0; i < penguins.length; i++) {
        if (penguins[i].real && launchBall.active && penguins[i].hitBall(launchBall)) {

          //ball disappears after hitting
          launchBall.active = false;

          if (penguins[i].ditto) {
            //fake penguin = gain score
            score++;
            penguins[i].resetPenguin();

            //win at 10 points (because 20 might be quite challenging for some people)
            if (score >= 10) {
              state = 1;
            }

          } else {
            // real penguin = lose
            state = 2;
          }
        }
      }

      // remove ball if off screen, or if it already hit something (penguin)
      if (launchBall.y < 0 ||launchBall.active == false) {
        launchBall = null;
      }
    }
    
  //if the state is 1, show the winning tap
  } else if (state == 1) {
    // win screen
    EndScreen(true);
  //if the state is 2, show the losing tap
  } else if (state == 2) {
    // lose screen
    EndScreen(false);
  
  
  }
  
  //draw text on scoreboard
  fill(255);//white
  //the function draws the score number 
  textAlign(CENTER, CENTER);//make text in center
  textSize(20); 
  text(score, 200, 60);
  
  //display cursor and gun
  launcher();
  
}
//draw the ending screen 
//boolean is use to decide the outcome, if true = win; false = lose
void EndScreen(boolean win) {
  fill(0, 140);
  noStroke();
  rect(0, 0, width, height);

  // panel
  //transparent layer on top of the screen
  fill(213,191,255);
  stroke(255);
  strokeWeight(2);
  rect(80, 100, 240, 180, 20);
  //if win is true, shows the winning tap, or else shows the losing tap
  if (win) {
    winTap(200, 155);
  } else {
    loseTap(200, 155);
  }
 
  restart(200, 235);
}


//draws the winning tap
void winTap(float x, float y) {
  pushMatrix();

  //position at center of the box
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

//draw the losing icon and tap
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

  //draw the tap/button
  //change the rectangle mode to center so it is easier to position the button
  rectMode(CENTER);
  fill(131,194,255);//sky blue
  stroke(77,116,191);//darker blue
  strokeWeight(2);
  rect(x, y, 100, 45, 12);
  //play button
  noStroke();
  fill(77,116,191);//darker blue
  triangle(x - 8, y - 12,x - 8, y + 12,x + 12, y);
  rectMode(CORNER);//return this back to original mode
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
