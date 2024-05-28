public class Fruit{
  String type;
  PVector position;
  PVector velocity;
  PVector acceleration;
  int size;
  boolean dropped;
  
  public Fruit(String type, PVector position){
    this.type = type;
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    this.position = position;
    size = 5;
    dropped = false;
  }
  
  void display(){
    fill(0);
    circle(position.x, position.y, 50);
  }
  
  void move(){
    position = position.add(velocity);
    velocity = velocity.add(acceleration);
    velocity.limit(5);
    acceleration = new PVector(0,0);
  }  
  
  void applyForce(PVector force) {
    acceleration = acceleration.add(force);
  }
  
  void inContact(Fruit other){
    if(position.y >= 700-size){
      dropped = true;
    }
    if(this.distance(other) < this.size + other.size + 1){
      
    }
  }
  
  double distance(Fruit other){
   double x = Math.pow(this.position.x - other.getPosition().x, 2);
   double y = Math.pow(this.position.y - other.getPosition().y, 2);
   return Math.pow(x + y, 0.5);
   }
   
  PVector getPosition(){
    return this.position;
  }
  
  boolean border(){
    boolean top = false;
    if(position.y >= 700-size){
      velocity.y *= -1;
    }
    if(position.y <= 100 && dropped){
      top = true;
    }
    if(position.x >= 600 - size || position.x <= size){
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
