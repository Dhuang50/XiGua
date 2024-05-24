public class Fruit{
  String type;
  PVector force;
  PVector position;
  
  public Fruit(String type, PVector position){
    this.type = type;
    force = new PVector(0, 0);
    this.position = position;
  }
  
  void display(){
    fill(0);
    circle(position.x, position.y, 50);
  }
  
  void inContact(ArrayList<Fruit> list, Fruit other){
    if(this.type.equals(other.type)){
      this.merge(other);
    }
  }
  
  void merge(Fruit other){
  
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
