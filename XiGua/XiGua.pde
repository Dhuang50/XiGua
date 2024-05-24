//ArrayList<Fruit> fruitList;
int score = 0;

void setup() {
  size(600,800);
  background(#fadaa5);

}

void draw() {
  fill(#8bf090);
  rect(-1,700,600,100);
  
  fill(255);
  textSize(20);
  text(score,20,75);
}

void mouseClicked() {
  circle(mouseX,500,40);
  
}
