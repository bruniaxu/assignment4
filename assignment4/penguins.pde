penguin pengy;
  
  
class penguin {
  
  void display(){
     //draw the penguin
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
    
    //draw face 
    //draw eyes
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
    //nostroke
    noStroke();
    triangle(75,251,73,257,76,256);//left
    triangle(85,251,83,256,86,257);//right
    triangle(80,250,77,256,83,256);//mid
    stroke(198,185,64);
    ellipse(75,250,3,3);//left
    ellipse(85,250,3,3);//right
    ellipse(80,249,3,3);//mid
  
  }
}
