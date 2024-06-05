ArrayList<Fruit> fruitList;
int score = 0;
PVector gravity = new PVector(0, 0.05);
Fruit focusFruit;
Fruit empty = new Fruit(0, new PVector(0,0));
boolean gameOver = false;
boolean start = false;
boolean win = false;
float rotation = PI/1000;

void setup() {
  size(600,800);
  fruitList = new ArrayList<Fruit>();
}

void draw() {
  if(win){
  }
  else if(gameOver){
    background(#fadaa5);
  }
  else if(start){
    background(#fadaa5);
    fill(#8bf090);
    rect(-1,700,600,100);
    
    fill(255);
    textSize(20);
    score = displayScore();
    text(score,20,75);
     
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
    for(int f = 0; f < fruitList.size(); f++){
    fruitList.get(f).applyForce(gravity);
    fruitList.get(f).move();
    for(int o = 0; o < fruitList.size(); o++){
      if(fruitList.get(f) != fruitList.get(o)){
        if(fruitList.get(f).inContact(fruitList.get(o)) && fruitList.get(f).type==fruitList.get(o).type){
          fruitList.get(f).merge(fruitList, f, o);
          f--;
          o--;
        }
      }
    }
    if(fruitList.get(f).border()){
      gameOver = true;
    }
    fruitList.get(f).display();
    }
  }
  else{
    background(#fadaa5);
    fill(255);
    textSize(75);
    textMode(MODEL);
    textAlign(CENTER);
    text("Xi Gua !!!", width/2, height/4 ); 
    
    rotate(rotation);
    PVector startFruitL = new PVector(width/2 - 150, height/2);
    Fruit startFruit = new Fruit (3, startFruitL);
    startFruit.display();
  }
}

void spawnFruit() {
  PVector spawn = new PVector(300,50);
  int type = (int)random(4)+1;
  Fruit newf = new Fruit(type,spawn);
  focusFruit = newf;
}

void mouseClicked() {
  if(fruitList.size() == 0 || fruitList.get(fruitList.size()-1).dropped){
    fruitList.add(focusFruit);
    focusFruit = empty;
  }
}

int displayScore() {
  int sum = 0;
  for (Fruit f: fruitList){
    sum += f.type;
  }
  return sum;
}
