//here's my assignment



//setup
void setup(){
  size(400,400);

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
  
  //draw the penguin
  fill(0);
  stroke(0);
  ellipse(81,290,42,60);//neck + body
  ellipse(82,310,47,55);//mid
  ellipse(81,320,45,40);//bottom
  triangle(60,320,55,330,80,340);//tail
  stroke(255);
  ellipse(80,275,40,32);//head
    
}
