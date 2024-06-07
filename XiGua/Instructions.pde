public class Instructions extends PApplet {

  void settings() {
    size(500, 500);
  }

  void draw() {
    background(#fadaa5);
    fill(0);
    textSize(30);
    text("Instructions", width/2 - 75, 50);
    textSize(20);
    text("1) The objective of this game is to get two", 20, 100);
    text(" watermelons", 20, 130);
    text("2) Merge fruits and ensure that the fruits don’t reach", 20, 175);
    text("the ceiling.", 35, 205);
    text("3) To drop a fruit, just left click. The fruit will fall from", 20, 250);
    text(" the top of the screen at the x position of the cursor.", 35, 285);
    text("4) Even after a fruit is dropped, it may be moved due to ", 20, 325);
    text("gravity or by the additional force of the fruit dropped.", 35, 355);
  }
}
  
