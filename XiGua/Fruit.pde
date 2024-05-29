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
    size = 25;
    dropped = false;
  }
  
  void display(){
    fill(0);
    circle(position.x, position.y, 50);
  }
  
  void move(){
    position = position.add(velocity);
    velocity = velocity.add(acceleration);
    velocity.limit(8);
    acceleration = new PVector(0, 0);
  }  
  
  void applyForce(PVector force) {
    acceleration = acceleration.add(force);
  }
  
  void inContact(Fruit other){
    if(position.y >= height-100-size){
      dropped = true;
    }
    if(position.dist(other.position) <= this.size + other.size + 1){
      if(other.dropped == true){
        dropped = true;
        PVector diff = PVector.sub(position, other.position);
        float angle = diff.heading();
        float dP = (this.size + other.size+2) - position.dist(other.position);
        float vertical = sin(angle)*dP;
        float horizontal = cos(angle)*dP;
        position.y += vertical;
        position.x += horizontal;
        velocity.x /= 2;
        velocity.y /= 2;
        other.velocity.x += velocity.x*cos(angle)/2;
        other.velocity.y += velocity.y*sin(angle)/2;
      }
    }
  }
  
  boolean border(){
    boolean top = false;
    if(position.y >= height-100-size){
      velocity.y *= 0.01;
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
