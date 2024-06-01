public class Fruit{
  int type;
  PVector position;
  PVector velocity;
  PVector acceleration;
  int size;
  float mass;
  boolean dropped;
  
  public Fruit(int type, PVector position){
    this.type = type;
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    this.position = position;
    size = 50;
    mass = size*0.01;
    dropped = false;
  }
  
  void display(){
    fill(0);
    circle(position.x, position.y, size*2);
  }
  
  void move(){
    position = position.add(velocity);
    velocity = velocity.add(acceleration);
    velocity.limit(10);
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
        float dP = (this.size + other.size) - diff.mag();
        float vertical = sin(angle)*dP;
        float horizontal = cos(angle)*dP;
        position.y += vertical;
        position.x += horizontal;
        
        
       PVector[] rotatedV = {new PVector(), new PVector()};
       
       rotatedV[0].x = velocity.x*cos(angle) + velocity.y*sin(angle);
       rotatedV[0].y = -1*velocity.x*sin(angle) + velocity.y*cos(angle);
       rotatedV[1].x = other.velocity.x*cos(angle) + other.velocity.y*sin(angle);
       rotatedV[1].y = -1*other.velocity.x*sin(angle) + other.velocity.y*cos(angle);
       
       rotatedV[0].setMag((other.mass*0.3*(rotatedV[1].mag()-rotatedV[0].mag()) + mass*rotatedV[0].mag() + other.mass*rotatedV[1].mag()) / (mass + other.mass));
       rotatedV[1].setMag((mass*0.3*(rotatedV[0].mag()-rotatedV[1].mag()) + mass*rotatedV[0].mag() + other.mass*rotatedV[1].mag()) / (mass + other.mass));
       
       velocity.x = rotatedV[0].x*cos(angle) - rotatedV[0].y*sin(angle);
       velocity.y = rotatedV[0].x*sin(angle) + rotatedV[0].y*cos(angle);
       other.velocity.x = rotatedV[1].x*cos(angle) - rotatedV[1].y*sin(angle);
       other.velocity.y = rotatedV[1].x*sin(angle) + rotatedV[1].y*cos(angle);
      }
    }
  }
  
  boolean border(){
    boolean top = false;
    if(position.y >= height-100-size){
      dropped = true;
      velocity.y *= -0.0075;
      position.y = height-100-size;
    }
    if(position.y <= 100 && dropped){
      top = true;
    }
    if(position.x >= width - size){
      position.x = width - size;
      PVector wall = new PVector(width-size, position.y);
      PVector diff = PVector.sub(position, wall);
      float angle = PI-diff.heading();
      velocity.x = (velocity.x+0.0005)*cos(angle);
    }   
    if(position.x <= size){
      position.x = size;
      PVector wall = new PVector(width-size, position.y);
      PVector diff = PVector.sub(position, wall);
      float angle = 2*PI-diff.heading();
      velocity.x = (velocity.x+0.0005)*cos(angle);
    }
    return top;
  }
  
  void grape(int x, int y) {}
  
  void strawberry(int x, int y) {}
  
  void lime(int x, int y) {}
  
  void lemon(int x, int y) {}
  
  void kiwi(int x, int y) {}
  
  void peach(int x, int y) {}
  
  void apple(int x, int y) {}
  
  void dragonfruit(int x, int y) {}
  
  void pineapple(int x, int y) {}
  
  void coconut(int x, int y) {}
  
  void watermelon(int x, int y) {}
  
}
