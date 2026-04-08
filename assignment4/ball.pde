
//create class for ball
class ball {
  //adding variables
  PVector position;
  PVector velocity;
  PVector acceleration;
  float x;
  float y;
  boolean active = true;
  //ball starting positions
  ball(float sX,float sY) {
    x = sX;
    y = sY;

    position = new PVector(x, y);
    velocity = new PVector(0, -6);
    acceleration = new PVector(0, 0);
  }
  //make the ball move //launches
  void move() {
    velocity.add(acceleration);
    position.add(velocity);
    x = position.x;
    y = position.y;

    if (y < 0) {
      active = false;
    }
  }
//display the ball
  void display() {
    noStroke();
    fill(196,119,245,90);
    ellipse(x, y + 6, 16, 20);

    // ball
    fill(194,103,255);//purple
    ellipse(x, y, 15, 15);
  }
}
