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
    else if (type == 5){
      size = 28;
    }
    mass = size*0.01;
    dropped = false;
  }
  
  void display(){
    fill(0);
    if (type == 1) {
      grape(position.x,position.y);
    }
    else if (type == 2) {
      strawberry(position.x,position.y);
    }
    else if (type == 3) {
      lime(position.x,position.y);
    }
    else if (type == 4) {
      lemon(position.x,position.y);
    }
    else if(type == 5){
      kiwi(position.x,position.y);
    }
    else if(type == 6){
      peach(position.x,position.y);
    }
    else if(type == 7){
      apple(position.x,position.y);
    }
    else if(type == 8){
      dragonfruit(position.x,position.y);
    }
    else if(type == 9){
      pineapple(position.x,position.y);
    }
    else if(type == 10){
      coconut(position.x,position.y);
    }
    else if(type == 11){
      watermelon(position.x,position.y);
    }
  }
  
  void move(){
    position = position.add(velocity);
    velocity = velocity.add(acceleration);
    velocity.limit(10);
    acceleration = new PVector(0, 0);
  }  
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  boolean inContact(Fruit other){
    if(position.dist(other.position) < this.size + other.size+2){
      if(other.dropped == true){
        dropped = true;
        PVector diff = PVector.sub(position, other.position).normalize();
        position.add(diff);
        other.position.sub(diff);
        
       float angle = PVector.sub(velocity, other.velocity).heading();
       PVector[] rotatedV = {new PVector(), new PVector()};
       
       float newV1 = (mass - other.mass)/(mass + other.mass)*velocity.mag() + (2*other.mass / (mass + other.mass))*other.velocity.mag();
       float newV2 = (2*mass)/(mass + other.mass)*velocity.mag() - ((mass - other.mass)/(mass + other.mass))*other.velocity.mag();
       
       rotatedV[0].setMag(newV1*.3);
       rotatedV[1].setMag(newV2*.3);
       
       velocity = rotatedV[0].rotate(angle);
       other.velocity = rotatedV[1].rotate(angle + PI);
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
      velocity.y *= -0.3;
      velocity.x *= 0.3;
      position.y = height-100-size;
      position.x = position.x;
    }
    if(position.y <= size && dropped){
      top = true;
      position.y = position.y;
      position.x = position.x;
      velocity.y *= -0.3;
      velocity.x *= 0.3;
    }
    if(position.x >= width - size){
      position.x = width - size;
      position.y = position.y;
      velocity.x *= -0.3;
      velocity.y *= 0.3;
    }   
    if(position.x <= size){
      position.x = size;
      position.y = position.y;
      velocity.x *= -0.3;
      velocity.y *= 0.3;
    }
    return top;
  }
  
  int merge(ArrayList<Fruit> list, int fruit1, int fruit2){
    PVector location = list.get(fruit1).position;
    int points = list.get(fruit1).type;
    Fruit merge = new Fruit(list.get(fruit1).type + 1, location);
    list.set(fruit1, merge);
    list.remove(fruit2);
    return points*2;
  }
  
  void grape(float x, float y) {
    noStroke();
    fill(#8748b8); 
    circle(x,y,40);

    fill(#bc82e8);
    circle(x,y,30);
    
    size = 20;
  }
  
  void strawberry(float x, float y) {
    noStroke();
    fill(#e05012);
    circle(x,y+2,60);
    ellipse(x-14,y-6,40,60);
    ellipse(x+14,y-6,40,60);
    
    fill(#eb885b);
    ellipse(x,y-3,24,30);
    
    size = 35;
  }
  
  void lime(float x, float y) {
    noStroke();
    fill(#7bed34);
    circle(x,y,80);
    
    noFill();
    stroke(#e8f2e1);
    strokeWeight(2);
    circle(x,y,70);
    line(x-26,y-26,x+26,y+26);
    line(x-26,y+26,x+26,y-26);
    line(x-34,y,x+34,y);
    line(x,y+34,x,y-34);
    
    size = 40;
  }
  
  void lemon(float x, float y) {
    noStroke();
    fill(#f7f30c);
    circle(x,y,100);
    
    noFill();
    stroke(#e3c962);
    strokeWeight(2);
    circle(x,y,90);
    line(x-32,y-32,x+32,y+32);
    line(x-32,y+32,x+32,y-32);
    line(x-44,y,x+44,y);
    line(x,y+44,x,y-44);
    
    size = 50;
  }
  
  void kiwi(float x, float y) {
    stroke(#4d3e1e);
    strokeWeight(2);
    fill(#e2f569);
    circle(x,y,112);
    strokeWeight(3);
    circle(x,y,40);
    strokeWeight(1);
    
    size = 56;
  }
  
  void peach(float x, float y) {
    stroke(#ff2b41);
    fill(#fcb874);
    ellipse(x,y,140,132);
    
    noStroke();
    fill(#78532f);
    ellipse(x,y-6,50,80);
    size = 70;
  }
  
  void apple(float x, float y) {
    stroke(#ff0800);
    strokeWeight(2);
    fill(#fae3bb);
    circle(x,y,160);
    
    fill(0);
    stroke(0);
    line(x-14,y-10,x-4,y+2);
    line(x-10,y+10,x-6,y+10);
    line(x-14,y+26,x-4,y+18);
    
    line(x+14,y-10,x+4,y+2);
    line(x+16,y+10,x+6,y+10);
    line(x+14,y+26,x+4,y+18);

    size = 80;
  }
  
  void dragonfruit(float x, float y) {
    stroke(#fa25ac);
    strokeWeight(3);
    fill(#ebe6e8);
    circle(x,y,180);
    
    stroke(0);
    fill(0);
    circle(x-30,y,3);
    circle(x-60,y,3);
    circle(x+30,y,3);
    circle(x+60,y,3);
    circle(x,y+30,3);
    circle(x,y+60,3);
    circle(x,y-30,3);
    circle(x,y-60,3);
    
    circle(x-23,y+23,3);
    circle(x-53,y+24,3);
    circle(x-30,y+45,3);
    
    circle(x+23,y+23,3);
    circle(x+53,y+24,3);
    circle(x+30,y+45,3);

    circle(x-23,y-23,3);
    circle(x-53,y-24,3);
    circle(x-30,y-45,3);

    circle(x+23,y-23,3);
    circle(x+53,y-24,3);
    circle(x+30,y-45,3);

  
    size = 90;
  }
  
  void pineapple(float x, float y) {
    stroke(#dbaa37);
    strokeWeight(3);
    fill(#f7c95c);
    circle(x,y,200);
    
    fill(#ffde91);
    circle(x,y,88);
    
    fill(#ffeab8);
    stroke(#e6cc91);
    circle(x,y,25);
    
    stroke(#fae99d);
    line(x-88,y,x-50,y);
    line(x,y+50,x,y+88);
    line(x+88,y,x+50,y);
    line(x,y-50,x,y-88);
    line(x-66,y+66,x-38,y+38);
    line(x+66,y+66,x+38,y+38);
    line(x-66,y-66,x-38,y-38);
    line(x+66,y-66,x+38,y-38);

    size = 100;
  }
  
  void coconut(float x, float y) {
    stroke(0);
    strokeWeight(6);
    fill(255);
    circle(x,y,220);
    
    noStroke();
    fill(#adacac);
    circle(x,y,146);
    
    fill(#d1d1d1);
    circle(x,y+24,98);
    
    
    size = 110;
  }
  
  void watermelon(float x, float y) {
    stroke(#4c6b4e);
    strokeWeight(5);
    fill(255);
    circle(x,y,240);
    
    noStroke();
    fill(#ed4a4a);
    circle(x,y,222);
    
    stroke(0);
    fill(0);
    circle(x-48,y,5);
    circle(x+48,y,5);
    circle(x,y+48,5);
    circle(x,y-48,5);

    circle(x+30,y-31,5);    
    circle(x-30,y-31,5);
    circle(x+30,y+31,5);
    circle(x-30,y+31,5);

    size = 120;
  
  }
  
}
