ArrayList<Fruit> fruitList;
int score;
int mergeScore;
PVector gravity = new PVector(0, 0.5);
Fruit focusFruit;
Fruit empty = new Fruit(0, new PVector(0,0));
boolean gameOver;
boolean start;
boolean win;

void setup() {
  size(600,800);
  fruitList = new ArrayList<Fruit>();
  gameOver = false;
  start = false;
  win = false;
  score = 0;
  mergeScore = 0;
}

void draw() {
  PFont font = loadFont("ComicSans.vlw");
  textFont(font);
  
  if(win){
    start = false;
    background(#fadaa5);
    fill(#0096FF);
    textSize(75);
    text("You Have", width/2, height/2 - 200);
    text("Won !!", width/2, height/2 - 100);
    fill(#f7dd59);
    circle(width/2,height/2+20,200);
    strokeWeight(2);
    stroke(0);
    line(width/2+30,height/2-40,width/2+30,height/2+20);    
    line(width/2-30,height/2-40,width/2-30,height/2+20);
    strokeWeight(1);
    fill(#ed3b0e);
    arc(width/2, height/2+60, 100, 60, 0, PI, CHORD);
    if(inRestart()){
      fill(#fadaa5);
      strokeWeight(5);
      stroke(255);
      rect(width/2 - 180, height/2 +160, 350, 100);
    }
    
    fill(255);
    strokeWeight(1);
    PVector restartFruitL = new PVector(width/2 - 125, height/2 + 210);
    Fruit restartFruit = new Fruit (1, restartFruitL);
    restartFruit.display();
    
    fill(255);
    textSize(50);
    text("Restart", 350, height/2 + 230);
  }
  else if(gameOver){
    start = false;
    background(#fadaa5);
    fill(#880808);
    textSize(75);
    text("You Have", width/2, height/2 - 200);
    text("Lost !!", width/2, height/2 - 100);

    fill(#5f7cb3);
    stroke(0);
    circle(width/2,height/2+20,200);
    strokeWeight(2);
    line(width/2+30,height/2-40,width/2+30,height/2+20);    
    line(width/2-30,height/2-40,width/2-30,height/2+20);
    strokeWeight(1);
    fill(#ed3b0e);
    arc(width/2, height/2+80, 100, 60, PI, TWO_PI, CHORD);

    if(inRestart()){
      fill(#fadaa5);
      strokeWeight(5);
      stroke(255);
      rect(width/2 - 180, height/2 +160, 350, 100);
    }
    
    fill(255);
    strokeWeight(1);
    PVector restartFruitL = new PVector(width/2 - 135, height/2 + 215);
    Fruit restartFruit = new Fruit (2, restartFruitL);
    restartFruit.display();
 
    fill(255);
    textSize(50);
    text("Restart", 350, height/2 + 230);
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
          mergeScore += fruitList.get(f).merge(fruitList, f, o);
          f--;
          o--;
        }
        if(f < 0){
          f = 0;
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
    
    
   PVector cFruitL = new PVector(width/2, height/2 - 50);
    Fruit cFruit = new Fruit (11, cFruitL);
    cFruit.display();
    
    if(inStart()){
      fill(#fadaa5);
      strokeWeight(5);
      stroke(255);
      rect(width/2 - 200, height/2 +90, 400, 90);
    }
    
    fill(255);
    strokeWeight(1);
    PVector startFruitL = new PVector(width/2 - 150, height/2 + 137);
    Fruit startFruit = new Fruit (3, startFruitL);
    startFruit.display();
    
    textSize(40);
    fill(255);
    text("Start Game ", width/2 + 50, height/2 + 150);
    
    if(inInstructions()){
      fill(#fadaa5);
      strokeWeight(5);
      stroke(255);
      rect(width/2 - 200, height/2 +200, 400, 110);
    }
    
    strokeWeight(1);
    PVector instructionFruitL = new PVector(width/2 - 140, height/2 + 255);
    Fruit instructionFruit = new Fruit (4, instructionFruitL);
    instructionFruit.display();
    fill(255);
    text("Instructions", width/2 + 50, height/2 + 270);
  }
}

void spawnFruit() {
  PVector spawn = new PVector(300,50);
  int type = (int)random(4)+1;
  Fruit newf = new Fruit(type,spawn);
  focusFruit = newf;
}

void mousePressed() {
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
    
    if(gameOver || win){
      if(inRestart()){
        gameOver = false;
        start = false;
        win = false;
        score = 0;
        mergeScore = 0;
        fruitList = new ArrayList<Fruit>();
        redraw();
      }
    }
  }
}

int displayScore() {
  int sum = 0;
  for (Fruit f: fruitList){
    sum += f.type;
  }
  sum += mergeScore;
  return sum;
}

boolean inStart() {
  if (width/2 - 200 <= mouseX && mouseX <= width/2 + 200 && height/2 + 90 <= mouseY && mouseY <= height/2 + 180){
    return true;
  }
  else {
    return false;
  }
}

boolean inInstructions() {
  if (width/2 - 200 <= mouseX && mouseX <= width/2 + 200 && height/2 + 200 <= mouseY && mouseY <= height/2 + 310){
    return true;
  }
  else {
    return false;
  }
}

boolean inRestart() {
  if (120 <= mouseX && mouseX <= 470 && 560 <= mouseY && mouseY <= 660){
    return true;
  }
  else {
    return false;
  }
}

boolean checkWin() {
  int count = 0;
  for (Fruit f: fruitList){
    if(f.type == 11 && f.dropped){
      count++;
    }
    if(f.type > 11){
      count += 2;
    }
  }
  return count >= 2;
}
