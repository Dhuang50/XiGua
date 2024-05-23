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
  

}
