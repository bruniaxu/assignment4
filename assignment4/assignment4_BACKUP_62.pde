//here's my assignment
//adding variables
//array 
penguin[] penguins;
<<<<<<< HEAD
=======
int score = 0;
>>>>>>> scoring-system

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
  
 
  
  //display the penguins
  for (int i =0; i < penguins.length; i++){
    //call out
    penguins[i].display();
    penguins[i].move();
    
  }
  
<<<<<<< HEAD
   //display cursor and gun
  launcher();
=======
  
  //draw text on scoreboard
  fill(255);//white
  textAlign(CENTER, CENTER);//make text in center
  textSize(20); 
  text(score, 200, 60);
  
  
>>>>>>> scoring-system
  
}
