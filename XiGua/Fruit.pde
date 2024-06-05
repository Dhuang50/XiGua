public class Fruit{
  int type;
  PVector position;
  PVector velocity;
  PVector acceleration;
  int size;
  boolean dropped;
  
  public Fruit(int type, PVector position){
    this.type = type;
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    this.position = position;
    size = 20;
    if (type == 1) {
      size = 10;
    }
    else if (type == 2) {
      size = 15;  
    }
    else if (type == 3) {
      size = 20;   
    }
    else if (type == 4) {
      size = 25;    
    }
    else {
      size = 28;
    }
    dropped = false;
  }
  
  void display(){
    fill(0);
    //if (type == 1) {
    //  grape(position.x,position.y);
    //}
    //else if (type == 2) {
    //  strawberry(position.x,position.y);
    //}
    //else if (type == 3) {
    //  lime(position.x,position.y);
    //}
    //else if (type == 4) {
    //  lemon(position.x,position.y);
    //}
    //else {
    //  kiwi(position.x,position.y);
    //  strokeWeight(1);
    //}
    pineapple(position.x,position.y);
  }
  
  void move(){
    velocity = velocity.add(acceleration);
    if(velocity.y < -0.5){
      velocity.y = -0.5;
    }
    position = position.add(velocity);
    velocity.limit(20);
    acceleration = new PVector(0, 0);
  }  
  
  void applyForce(PVector force) {
    acceleration = acceleration.add(force);
  }
  
  void inContact(Fruit other){
    if(position.dist(other.position) <= this.size + other.size + 2){
      if(other.dropped == true){
        dropped = true;
        PVector diff = PVector.sub(position, other.position);
        float angle = diff.heading();
        float dP = (this.size + other.size+2) - position.dist(other.position);
        float vertical = sin(angle)*dP;
        float horizontal = cos(angle)*dP;
        position.y += vertical;
        position.x += horizontal;
        float oVX = other.velocity.x;
        float oVY = other.velocity.y;
        other.velocity.x += velocity.x*cos(angle);
        other.velocity.y += velocity.y*sin(angle);
        velocity.x += oVX*cos(angle);
        velocity.y += oVY*sin(angle);
      }
    }
  }
  
  boolean touching(Fruit other) {
      if(position.y>=height-100-size) {
        dropped = true;
      }
      if(position.dist(other.position) <= this.size + other.size + 1){
        if(other.dropped == true){
         dropped = true;
         return true;
        }
      }
      return false;
  }
  
  
  boolean border(){
    boolean top = false;
    if(position.y >= height-100-size){
      dropped = true;
      velocity.y = 0;
      position.y = height-100-size;
    }
    if(position.y <= 100 && dropped){
      top = true;
    }
    if(position.x >= width - size){
      position.x = width - size;
      velocity.x *= -1;
    }   
    if(position.x <= size){
      position.x = size;
      velocity.x *= -1;
    }
    return top;
  }
  
  void grape(float x, float y) {
    noStroke();
    fill(#8748b8); 
    circle(x,y,20);

    fill(#bc82e8);
    circle(x,y,15);
  }
  
  void strawberry(float x, float y) {
    noStroke();
    fill(#e05012);
    circle(x,y+2,30);
    ellipse(x-7,y-3,20,30);
    ellipse(x+7,y-3,20,30);
    
    fill(#eb885b);
    ellipse(x,y-3,12,15);
  }
  
  void lime(float x, float y) {
    noStroke();
    fill(#7bed34);
    circle(x,y,40);
    
    noFill();
    stroke(#e8f2e1);
    circle(x,y,35);
    line(x-13,y-13,x+13,y+13);
    line(x-13,y+13,x+13,y-13);
    line(x-17,y,x+17,y);
    line(x,y+17,x,y-17);
  }
  
  void lemon(float x, float y) {
    noStroke();
    fill(#f7f30c);
    circle(x,y,50);
    
    noFill();
    stroke(#e3c962);
    circle(x,y,45);
    line(x-16,y-16,x+16,y+16);
    line(x-16,y+16,x+16,y-16);
    line(x-20,y,x+20,y);
    line(x,y+20,x,y-20);
  }
  
  void kiwi(float x, float y) {
    stroke(#4d3e1e);
    strokeWeight(2);
    fill(#e2f569);
    circle(x,y,55);
    strokeWeight(3);
    circle(x,y,20);
  }
  
  void peach(float x, float y) {
    stroke(#ff2b41);
    fill(#fcb874);
    ellipse(x,y,70,66);
    
    noStroke();
    fill(#78532f);
    ellipse(x,y-3,25,40);
    size = 35;
  }
  
  void apple(float x, float y) {
    stroke(#ff0800);
    strokeWeight(2);
    fill(#fae3bb);
    circle(x,y,80);
    
    fill(0);
    stroke(0);
    line(x-7,y-5,x-2,y+1);
    line(x-8,y+5,x-3,y+5);
    line(x-7,y+13,x-2,y+9);
    
    line(x+7,y-5,x+2,y+1);
    line(x+8,y+5,x+3,y+5);
    line(x+7,y+13,x+2,y+9);

    size = 40;
  }
  
  void dragonfruit(float x, float y) {
    stroke(#fa25ac);
    strokeWeight(3);
    fill(#ebe6e8);
    circle(x,y,120);
    
    stroke(0);
    fill(0);
    circle(x-20,y,2);
    circle(x-40,y,2);
    circle(x+20,y,2);
    circle(x+40,y,2);
    circle(x,y+20,2);
    circle(x,y+40,2);
    circle(x,y-20,2);
    circle(x,y-40,2);
    
    circle(x-15,y+15,2);
    circle(x-35,y+16,2);
    circle(x-20,y+30,2);
    
    circle(x+15,y+15,2);
    circle(x+35,y+16,2);
    circle(x+20,y+30,2);

    circle(x-15,y-15,2);
    circle(x-35,y-16,2);
    circle(x-20,y-30,2);

    circle(x+15,y-15,2);
    circle(x+35,y-16,2);
    circle(x+20,y-30,2);

  
    size = 60;
  }
  
  void pineapple(float x, float y) {
    stroke(#dbaa37);
    strokeWeight(3);
    fill(#f7c95c);
    circle(x,y,160);
    
    fill(#ffde91);
    circle(x,y,70);
    
    fill(#ffeab8);
    stroke(#e6cc91);
    circle(x,y,20);
    
    stroke(#fae99d);
    line(x-70,y,x-40,y);
    line(x,y+40,x,y+70);
    line(x+70,y,x+40,y);
    line(x,y-40,x,y-70);
    line(x-53,y+53,x-30,y+30);
    line(x+53,y+53,x+30,y+30);
    line(x-53,y-53,x-30,y-30);
    line(x+53,y-53,x+30,y-30);

    fill(#fadaa5);
    noStroke();
    arc(x,y-80,40,40,0,PI);

    size = 80;
  }
  
  void coconut(float x, float y) {}
  
  void watermelon(float x, float y) {}
  
}
