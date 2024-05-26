public class Fruit{
  String type;
  PVector position;
  PVector velocity;
  int size;
  
  public Fruit(String type, PVector position){
    this.type = type;
    velocity = new PVector(0, 0);
    this.position = position;
    size = 5;
  }
  
  void display(){
    fill(0);
    circle(position.x, position.y, 50);
  }
  
  void move(PVector force){
    this.velocity.add(force);
    this.position.add(velocity);
  }
  
  void inContact(Fruit other){
    if(other.getPosition().x + other.size == this.getPosition().x + this.size){
      other.velocity.x = 0;
    }
    if (other.position.y + other.size == this.position.y + this.size){
      other.position.y = this.position.y+ other.size + this.size;
    }
  }
  
  
  PVector getPosition(){
    return this.position;
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
