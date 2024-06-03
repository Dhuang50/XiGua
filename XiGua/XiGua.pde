ArrayList<Fruit> fruitList;
int score = 0;
PVector gravity = new PVector(0, 0.05);
Fruit focusFruit;
Fruit empty = new Fruit(0, new PVector(0,0));

void setup() {
  size(600,800);
  fruitList = new ArrayList<Fruit>();
}

void draw() {
  background(#fadaa5);
  fill(#8bf090);
  rect(-1,700,600,100);
  
  fill(255);
  textSize(20);
  text(score,20,75);
  
  PVector gravity = new PVector(0,1);
  if(focusFruit == null || focusFruit == empty){
    spawnFruit();
}
  else{
    focusFruit.position.x = mouseX;
    if(fruitList.size() == 0 || fruitList.get(fruitList.size()-1).dropped == true){
      focusFruit.border();
      focusFruit.display();
    }
  }
  for(Fruit f: fruitList){
    f.applyForce(gravity);
    f.move();
    for(Fruit o: fruitList){
      if(f!= o){
        f.inContact(o);
      }
    }
    f.border();
    f.display();
  }
  
}

void spawnFruit() {
  PVector spawn = new PVector(300,50);
  int type = (int)random(5);
  Fruit newf = new Fruit(type,spawn);
  focusFruit = newf;
}

void mouseClicked() {
  if(fruitList.size() == 0 || fruitList.get(fruitList.size()-1).dropped == true){
    fruitList.add(focusFruit);
    focusFruit = empty;
  }
}
