public class textButtonGroup {
  // Fields
  int bgR, bgG, bgB;
  float x, y;
  ArrayList<ArrayList<textButton>> buttons = new ArrayList<ArrayList<textButton>>();
  int numButtonsX;
  int numButtonsY;
  int checkedBox=-1;
  int activatedButton;
  int currY;
  String[][] names = {
    {"Chris", "Kennedy", "Richard", "Jack", "Hunter"}, 
    {"Michael", "Thomas", "Matt", "Chun-Che", "Luke B."}, 
    {"Other Luke", "Dakota", "Geordi", "Brayden", "Brianna"}, 
    {"Josh", "Ben", "Kim", "Ayden", "Maya"}, 
    {"Keenan", "Other/Mentor", "Other/Mentor", "Other/Mentor", "Other/Mentor"}
  };

  // Constructors
  public textButtonGroup (int x, int y, int bgR, int bgG, int bgB, int numButtonsX, int numButtonsY, int activatedButton) {
    this.x = x;
    this.y = y;
    this.bgR = bgR;
    this.bgG = bgG;
    this.bgB = bgB;
    this.numButtonsX = numButtonsX;
    this.numButtonsY = numButtonsY;
    this.activatedButton = activatedButton;
    boolean activated = false;
    textButton thisButton;
    x = x+250;
    currY = y;
    for (int l = 0; l<numButtonsY; l++) {
      ArrayList<textButton> sub = new ArrayList<textButton>();
      for (int i = 0; i<numButtonsX; i++) {

        //println(i);
        if (i == activatedButton) {
          activated = true;
        } else {
          activated = false;
        }

        // Need to set the x,y value of each checkBox
        //println(names[l][i]);

        thisButton = new textButton(x+(i-1)*250, currY, 200, 80, 200, 200, 200, 0, 0, 0, names[i][l], activated);
        //println("Adding 1 checkbox");
        sub.add(thisButton);
      }
      buttons.add(sub);
      currY = currY+100;
      i = 0;
      //println("starting a new line of boxes. Y value is now: "+currY);
    }
  }

  //methods
  public void draw() {
    textButton thisButton;
    for (int l = 0; l<this.numButtonsY; l++) {
      for (int i = 0; i<this.numButtonsX; i++) {
        thisButton = buttons.get(i).get(l);
        thisButton.draw();
        //println("drawing a box");
      }
      i=0;
    }
  }

  void mousePressed() {
    textButton thisButton;
    for (int l = 0; l<this.numButtonsY; l++) {
      for (int i = 0; i<this.numButtonsX; i++) {
        //println(i);
        thisButton = buttons.get(l).get(i);
        thisButton.mousePressed();
        if (thisButton.activated == true) {
          teamMember.input = names[i][l];
        }
      }
    }
  }
}