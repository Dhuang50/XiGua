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
    velocity.limit(20);
    acceleration = new PVector(0, 0);
  }  
  
  void applyForce(PVector force) {
    acceleration = acceleration.add(force);
  }
  
  boolean inContact(Fruit other){
    if(position.dist(other.position) <= this.size + other.size + 2){
      if(other.dropped == true){
        dropped = true;
        PVector diff = PVector.sub(position, other.position);
        diff = diff.normalize();
        position.add(diff);
        other.position.sub(diff);
        
       float angle = PVector.sub(velocity, other.velocity).heading();
       PVector[] rotatedV = {new PVector(), new PVector()};
       
       rotatedV[0].x = velocity.x*cos(angle) + velocity.y*sin(angle);
       rotatedV[0].y = -1*velocity.x*sin(angle) + velocity.y*cos(angle);
       rotatedV[1].x = other.velocity.x*cos(angle) + other.velocity.y*sin(angle);
       rotatedV[1].y = -1*other.velocity.x*sin(angle) + other.velocity.y*cos(angle);
       
       float newV1 = (mass - other.mass)/(mass + other.mass)*rotatedV[0].mag() + (2*other.mass / (mass + other.mass))*rotatedV[1].mag();
       float newV2 = (2*mass)/(mass + other.mass)*rotatedV[0].mag() - ((mass - other.mass)/(mass + other.mass))*rotatedV[1].mag();
       
       rotatedV[0].setMag(newV1);
       rotatedV[1].setMag(newV2);
       
       velocity.x = rotatedV[0].x*cos(angle) - rotatedV[0].y*sin(angle);
       velocity.y = rotatedV[0].x*sin(angle) + rotatedV[0].y*cos(angle);
       other.velocity.x = rotatedV[1].x*cos(angle) - rotatedV[1].y*sin(angle);
       other.velocity.y = rotatedV[1].x*sin(angle) + rotatedV[1].y*cos(angle);
       
       position.x += velocity.x;
       position.y += velocity.y;
      }
      return true;
    }
    else{
      return false;
    }
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
      PVector wall = new PVector(-1*velocity.x, 0);
      this.applyForce(wall);
    }   
    if(position.x <= size){
      position.x = size;
      PVector wall = new PVector(-1*velocity.x, 0);
      this.applyForce(wall);
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
