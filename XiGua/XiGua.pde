ArrayList<Fruit> fruitList;
int score = 0;
PVector gravity = new PVector(0, 0.5);
Fruit focusFruit;
Fruit empty = new Fruit(0, new PVector(0,0));
boolean gameOver = false;
boolean start = false;
boolean win = false;

void setup() {
  size(600,800);
  fruitList = new ArrayList<Fruit>();
}

void draw() {
  PFont font = loadFont("ComicSans.vlw");
  textFont(font);
  
  if(win){
    background(#fadaa5);
    fill(#0096FF);
    textSize(75);
    text("You Have", width/2 - 175, height/4);
    text("Won !!", width/2 - 100, height/4 + 100);
    
    if(inRestart()){
      fill(#fadaa5);
      strokeWeight(5);
      stroke(255);
      rect(width/2 - 150, height/2 +60, 350, 75);
    }
    
    fill(255);
    strokeWeight(1);
    PVector restartFruitL = new PVector(width/2 - 100, height/2 + 100);
    Fruit restartFruit = new Fruit (5, restartFruitL);
    restartFruit.display();
    
    fill(255);
    textSize(50);
    text("Restart", width/2 - 50, height/2 + 115);
  }
  else if(gameOver){
    background(#fadaa5);
    fill(#880808);
    textSize(75);
    text("You Have", width/2 - 175, height/4);
    text("Lost !!", width/2 - 100, height/4 + 100);
    
    if(inRestart()){
      fill(#fadaa5);
      strokeWeight(5);
      stroke(255);
      rect(width/2 - 150, height/2 +60, 350, 75);
    }
    
    fill(255);
    strokeWeight(1);
    PVector restartFruitL = new PVector(width/2 - 100, height/2 + 100);
    Fruit restartFruit = new Fruit (2, restartFruitL);
    restartFruit.display();
    
    fill(255);
    textSize(50);
    text("Restart", width/2 - 50, height/2 + 115);
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
    
    if(checkWin()){
      win = true;
    }
  }
  else{
    background(#fadaa5);
    fill(255);
    textSize(75);
    textMode(MODEL);
    textAlign(CENTER);
    text("Xi Gua !!!", width/2, height/4 ); 
    
    if(inStart()){
      fill(#fadaa5);
      strokeWeight(5);
      stroke(255);
      rect(width/2 - 200, height/2 +70, 400, 75);
    }
    
    fill(255);
    strokeWeight(1);
    PVector startFruitL = new PVector(width/2 - 150, height/2 + 105);
    Fruit startFruit = new Fruit (3, startFruitL);
    startFruit.display();
    
    textSize(40);
    fill(255);
    text("Start Game ", width/2 + 25, height/2 + 120);
    
    if(inInstructions()){
      fill(#fadaa5);
      strokeWeight(5);
      stroke(255);
      rect(width/2 - 200, height/2 +150, 400, 75);
    }
    
    strokeWeight(1);
    PVector instructionFruitL = new PVector(width/2 - 150, height/2 + 190);
    Fruit instructionFruit = new Fruit (4, instructionFruitL);
    instructionFruit.display();
    fill(255);
    text("Instructions", width/2 + 25, height/2 + 205);
  }
}

void spawnFruit() {
  PVector spawn = new PVector(300,50);
  int type = (int)random(4)+1;
  Fruit newf = new Fruit(type,spawn);
  focusFruit = newf;
}

void mouseClicked() {
  if(start){
    if(fruitList.size() == 0 || fruitList.get(fruitList.size()-1).dropped){
      fruitList.add(focusFruit);
      focusFruit = empty;
    }
  }
  else{
    if(inStart()){
      start = true;
    }
    
    if(inInstructions()){
      PFont font = loadFont("ComicSans.vlw");
      textFont(font);
      Instructions instruction = new Instructions();
      runSketch(new String[]{"Instructions"}, instruction);
    }
    
    if(gameOver){
      //if()
    }
  }
}

int displayScore() {
  int sum = 0;
  for (Fruit f: fruitList){
    sum += f.type;
  }
  return sum;
}

boolean inStart() {
  if (width/2 - 200 <= mouseX && mouseX <= width/2 + 200 && height/2 + 70 <= mouseY && mouseY <= height/2 + 145){
    return true;
  }
  else {
    return false;
  }
}

boolean inInstructions() {
  if (width/2 - 200 <= mouseX && mouseX <= width/2 + 200 && height/2 + 150 <= mouseY && mouseY <= height/2 + 220){
    return true;
  }
  else {
    return false;
  }
}

boolean inRestart() {
  if (width/2 - 150 <= mouseX && mouseX <= width/2 + 200 && height/2 + 60 <= mouseY && mouseY <= height/2 + 135){
    return true;
  }
  else {
    return false;
  }
}

boolean checkWin() {
  int count = 0;
  for (Fruit f: fruitList){
    if(f.type == 11){
      count++;
    }
  }
  return count >= 2;
}
