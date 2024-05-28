ArrayList<Fruit> fruitList;
int score = 0;
PVector gravity = new PVector(0, 0.05);
Fruit focusFruit;
Fruit empty = new Fruit("apple", new PVector(0,0));

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
  if(focusFruit == null || focusFruit == empty){
    PVector spawn = new PVector(300, 50);
    Fruit newf = new Fruit("grape", spawn);
    focusFruit = newf;
  }
  else{
    focusFruit.position.x = mouseX;
    if(fruitList.size() == 0 || fruitList.get(fruitList.size()-1).dropped == true){
      focusFruit.display();
    }
  }
  for(Fruit f: fruitList){
    f.display();
    f.move(gravity);
    f.border();
    for(Fruit o: fruitList){
      f.inContact(o);
    }
  }
  
}

void mouseClicked() {
  fruitList.add(focusFruit);
  focusFruit = empty;
}
