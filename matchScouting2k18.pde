// setup: (variables and stuff)
PrintWriter output;
PFont font;
PImage field;
PImage blackOnTrans;
PImage flippedField;
String Input="";
int v=110;
int i=0;
int y = 0;
int x = 0;
int t, m = 2, s;
int interval = 150;
int startTime;
int TEAMNUM;
String time;
String sS = "30";
boolean run = false;
boolean matchEnded;
Boolean timing = false;
int foulCounter = 0;
int techFoulCounter = 0;
int scout = 0;
int scoutNum = 0;
String alli;
int NumOfValsInCycleTimes=0;
boolean allia = false;

String lastButtonPressed = "";
String printButtonPressed = "";

//Counter Variables
int[] paths = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

//Display Color for text in chatbox:
int red = 0;
int green = 0;
int purple = 0;

int page = 1;

JSONArray values;


JSONObject pathTimes = new JSONObject();

//timers:
timer cycleTimer;

// To add textboxes type: textBox (unique variable name);
textBox teamNumber;
textBox teamMember;
textBox alliance;
textButton end;
textBox times;
textBox portalCount;


// To add textButtons type: textButton (unique variable name);
textButton startMatchButton;
textButton loadMatchButton;
//Timer Ending Text Buttons (unique variable name);
timerEndingTextButton droppedBox;

// to add transparentButtons: transparentButton (unique variable name);
transparentButton portal;
transparentButton cubePileZone;
transparentButton cubeLineZone;
transparentButton opponentCubeLineZone;
transparentButton allianceSwitch;
transparentButton scale;
transparentButton opponentSwitch;
transparentButton exchangeDropoff;
transparentButton exchangePickup;
// To add counters type: counter (unique variable name);
counter matchNumber;
counter foul;
counter techFoul;
counter Points;
// To add checkBoxGroups type: checkBoxGroup (unique variable name);
checkBoxGroup rankingPoints;
checkBoxGroup rating;
checkBoxGroup defenseRating;
checkBoxGroup offenseRating;
checkBoxGroup pageSelect;
checkBoxGroup tournament;

// To add check Boxes type: checkBox (unique variable name);
textButton disabled;
textButton potf;
textButton flippedOver;
textButton attemptedClimb;
textButton successfulClimb;
textButton noShow;
textButton yellowCard;
textButton redCard;
textButton techFoul1;
textButton foul1;
textButton assistedClimb;
checkBox flipField;
// To add text button groups type: textButtonGroup (unique variable name);
textButtonGroup nameSelect;




boolean mousePos;
int mX = mouseX;
int mY = mouseY;

String activeBox = "";

int matchNumberOut = 1;
int teamNumberOut = 1111;
String matchNotesOut = "Notes";
int[] numbers = {1, 2, 3, 4, 5, 6, 7, 8, 9, 0};


ChildApplet child;

void settings() {
  fullScreen();
  smooth();
}

void setup () {
  //if (child.scout >= 4){
   //allia = true; 
  //}
  field = loadImage("field.PNG");
  flippedField = loadImage("fieldFlipped.png");
  blackOnTrans = loadImage("blackOnTrans.png");
  surface.setTitle("Match Scouting 2017");
  // this is where the team number is chosen via search and choose
  //size(1920, 1080);

  cycleTimer = new timer();

  child = new ChildApplet();
  font = createFont("Arial", 16, true);

  // All of the variables above NEED to be declared here. If they are not nothing will work and it WILL CRASH!!!!
  // Also please put them in the right places. not gonna crash if you dont but please do.

  //on all pages
  alliance = new textBox(1500, 10, 80, 80, 0, 0, 255, 0, 0, 0, "", false, false, true);
  //page 1
  tournament = new checkBoxGroup(140, 500, 200, 200, 200, 2, 0);
  pageSelect = new checkBoxGroup(825, 10, 200, 200, 200, 3, 0);
  nameSelect = new textButtonGroup(600, 200, 200, 200, 200, 5, 5, 0);
  matchNumber = new counter(10, 900, 120, 80, 200, 200, 200, 0, 0, 0, 1, false);
  teamNumber = new textBox(10, 200, 500, 60, 200, 200, 200, 0, 0, 0, "Team Number: ", false, true, false);
  teamMember = new textBox(10, 300, 500, 60, 200, 200, 200, 0, 0, 0, "Scout  Name: ", false, true, false);
  flipField = new checkBox(140, 700, 200, 200, 200, false);
  //page 2
  times = new textBox(1600, 10, 200, 60, 200, 200, 200, 0, 0, 0, "Time: ", false, false, false);
  startMatchButton = new textButton(1600, 80, 200, 60, 200, 200, 200, 0, 0, 0, "Start Match", false, false);

  loadMatchButton = new textButton(390, 1100, 200, 60, 200, 200, 200, 0, 0, 0, "Load Match", false,false);  



//println(scoutNum);

  
  disabled = new textButton(600, 870, 225, 70, 200, 200, 200, 0, 0, 0, "Disabled", false,false);
  potf = new textButton(600, 960, 225, 70, 200, 200, 200, 0, 0, 0, "Parts On Field", false, false);
  flippedOver = new textButton(600, 1050, 225, 70, 200, 200, 200, 0, 0, 0, "Flipped Over", false, false);
  attemptedClimb = new textButton(1000, 870, 259, 70, 200, 200, 200, 0, 0, 0, "Attempted Climb", false, false);
  successfulClimb = new textButton(1000, 960, 259, 70, 200, 200, 200, 0, 0, 0, "Successful Climb", false, false);
  noShow = new textButton(1000, 1050, 259, 70, 259, 200, 200, 0, 0, 0, "No Show", false, false);
  yellowCard = new textButton(1600, 870, 200, 70, 200, 200, 200, 0, 0, 0, "Yellow Card", false, false);
  redCard = new textButton(1600, 960, 200, 70, 200, 200, 200, 0, 0, 0, "Red Card", false, false);
  techFoul1 = new textButton(1600, 1050, 200, 70, 200, 200, 200, 0, 0, 0, "Tech Foul", false, false);
  foul1 = new textButton(1400, 1050, 150, 70, 200, 200, 200, 0, 0, 0, "Foul", false, false);
  assistedClimb = new textButton(70, 970, 225, 70, 200, 200, 200, 0, 0, 0, "Assisted Climb", false, false);
  droppedBox = new timerEndingTextButton(70, 880, 225, 70, 200, 200, 200, 0, 0, 0, "Dropped Box", false); 
  
  //transparent buttons on page 2:
  portal = new transparentButton(1460, 160, 360, 630, true);
  opponentSwitch = new transparentButton(1200, 160, 260, 630, false);
  scale = new transparentButton(857, 160, 180, 630, false);
  allianceSwitch = new transparentButton(560, 160, 130, 630, false);
  opponentCubeLineZone = new transparentButton(1037, 160, 163, 630, true);
  cubeLineZone = new transparentButton(690, 160, 167, 630, true);
  cubePileZone = new transparentButton(430, 160, 130, 630, true);
  exchangeDropoff = new transparentButton(70, 160, 180, 630, false);
  exchangePickup = new transparentButton(250, 160, 180, 630, true);
  droppedBox = new timerEndingTextButton(70, 880, 80, 80, 200, 200, 200, 0, 0, 0, "Dropped Box", false); 


  //page 3
  Points = new counter(440, 240, 80, 20, 200, 200, 200, 0, 0, 0, 0, false); 
  rankingPoints = new checkBoxGroup(400, 430, 200, 200, 200, 4, -1);
  rating = new checkBoxGroup(620, 620, 200, 200, 200, 5, -1);
  defenseRating =  new checkBoxGroup(410, 810, 200, 200, 200, 5, -1);
  offenseRating =  new checkBoxGroup(410, 1000, 200, 200, 200, 5, -1);
  end = new textButton(1700, 950, 200, 80, 30, 255, 30, 0, 0, 0, "End Match", false, false);
}

void mousePressed() {
  activeBox = "";
  // in correct page number, all variables that need to register clicks need to be declared here.
  // ex. var.mousePressed();
  if (page == 1) {
    matchNumber.mousePressed();
    teamNumber.mousePressed();
    teamMember.mousePressed();
    if (teamMember.activated == true) {
      activeBox = "teamMember";
    }
    nameSelect.mousePressed();
    loadMatchButton.mousePressed();
    if (loadMatchButton.activated) {
      loadJSON(matchNumber.start);
    }
    tournament.mousePressed();
    flipField.mousePressed();
  } 
  if (page == 2) {
    disabled.mousePressed();
    if (disabled.activated == true) {
      lastButtonPressed = "disabled";
      printButtonPressed = "Disabled";
      red = 0;
      green = 0;
      purple = 1;
    }
    potf.mousePressed();
    if (potf.activated == true) {
      lastButtonPressed = "partOnTheField";
      printButtonPressed = "Part On The Field";
      red = 0;
      green = 0;
      purple = 1;
    }
    flippedOver.mousePressed();
    if (flippedOver.activated == true) {
      lastButtonPressed = "flippedOver";
      printButtonPressed = "Flipped Over";
      red = 0;
      green = 0;
      purple = 1;
    }
    attemptedClimb.mousePressed();
    if (attemptedClimb.activated == true) {
      lastButtonPressed = "attemptedClimb";
      printButtonPressed = "Attempted Climb";
      red = 0;
      green = 0;
      purple = 1;
    }
    successfulClimb.mousePressed();
    if (successfulClimb.activated == true) {
      attemptedClimb.isChecked = true;
    }
    if (successfulClimb.activated == true) {
      lastButtonPressed = "successfulClimb";
      printButtonPressed = "Successful Climb";
      red = 0;
      green = 0;
      purple = 1;
    }
    noShow.mousePressed();
     if (noShow.activated == true) {
      lastButtonPressed = "noShow";
      printButtonPressed = "No Show";
      red = 0;
      green = 0;
      purple = 1;
     }
     yellowCard.mousePressed();
    if (yellowCard.activated == true) {
      lastButtonPressed = "yellowCard";
      printButtonPressed = "Yellow Card";
      red = 0;
      green = 0;
      purple = 1;
    }
     assistedClimb.mousePressed();
     if (assistedClimb.isChecked == true) {
      lastButtonPressed = "assistedClimb";
      printButtonPressed = "Assisted Climb";
      red = 0;
      green = 0;
      purple = 1;
     }
     redCard.mousePressed();
    if (redCard.activated == true){
      lastButtonPressed = "redCard";
      printButtonPressed = "Red Card";
      
      red = 0;
      green = 0;
      purple = 1;
    }
    //Pickup Buttons:
    portal.mousePressed();//Pickup
    if (portal.activated == true) {
      lastButtonPressed = "portal";
      printButtonPressed = "Portal";
      red = 1;
      green = 0;
      purple = 0;
    }
    opponentCubeLineZone.mousePressed();//Pickup
    if (opponentCubeLineZone.activated == true) {
      lastButtonPressed = "opponentCubeLineZone";
      printButtonPressed = "Opponent Cube Line Zone";
      red = 1;
      green = 0;
      purple = 0;
    }
    cubeLineZone.mousePressed();//Pickup
    if (cubeLineZone.activated == true) {
      lastButtonPressed = "cubeLineZone";
      printButtonPressed = "Cube Line Zone";
      red = 1;
      green = 0;
      purple = 0;
    }
    exchangePickup.mousePressed();//Pickup
    if (exchangePickup.activated == true) {
      lastButtonPressed = "exchangePickup";
      printButtonPressed = "Exchange Pickup"; 
      red = 1;
      green = 0;
      purple = 0;
    }
    cubePileZone.mousePressed();//Pickup
    if (cubePileZone.activated == true) {
      lastButtonPressed = "cubePileZone";
      printButtonPressed = "Cube Pile Zone";
      red = 1;
      green = 0;
      purple = 0;
    }
    techFoul1.mousePressed();
    if (techFoul1.activated == true){
     lastButtonPressed = "techFoul1";
     printButtonPressed = "Tech Foul";
     techFoulCounter++;
     red = 0;
     green = 0;
     purple = 1;
      
    }
    foul1.mousePressed();
    if (foul1.activated == true){
      foulCounter++;
      lastButtonPressed = "foul1"; 
     printButtonPressed = "Foul";
     red = 0;
     green = 0;
     purple = 1;
    }

    //Dropoff Buttons:
    opponentSwitch.mousePressed();
    if (opponentSwitch.activated == true) {
      if (lastButtonPressed=="portal")
      {
        paths[1] = paths[1]+1;
        saveCycleTime(2, opponentSwitch.FinalTime, paths[1]);
      }
      if (lastButtonPressed=="exchangePickup")
      {
        paths[6] = paths[6]+1;
        saveCycleTime(7, opponentSwitch.FinalTime, paths[6]);
      }
      if (lastButtonPressed=="cubePileZone")
      {
        paths[11] = paths[11]+1;
        saveCycleTime(12, opponentSwitch.FinalTime, paths[11]);
      }
      if (lastButtonPressed=="cubeLineZone")
      {
        paths[16] = paths[16]+1;
        //println("path 17 count: "+paths[16]);
        saveCycleTime(17, opponentSwitch.FinalTime, paths[16]);
      }
      if (lastButtonPressed=="opponentCubeLineZone")
      {
        paths[21] = paths[21]+1;
        saveCycleTime(22, opponentSwitch.FinalTime, paths[21]);
      }
      lastButtonPressed = "opponentSwitch";
      printButtonPressed = "Opponent Switch";
      red = 0;
      green = 1;
      purple = 0;
    }
    scale.mousePressed();
    if (scale.activated == true) {
      if (lastButtonPressed=="portal")
      {
        paths[2] = paths[2]+1;
        saveCycleTime(3, scale.FinalTime, paths[2]);
      }
      if (lastButtonPressed=="exchangePickup")
      {
        paths[7] = paths[7]+1;
        saveCycleTime(8, scale.FinalTime, paths[7]);
      }
      if (lastButtonPressed=="cubePileZone")
      {
        paths[12] = paths[12]+1;
        saveCycleTime(13, scale.FinalTime, paths[12]);
      }
      if (lastButtonPressed=="cubeLineZone")
      {
        paths[17] = paths[17]+1;
        saveCycleTime(18, scale.FinalTime, paths[17]);
      }
      if (lastButtonPressed=="opponentCubeLineZone")
      {
        paths[22] = paths[22]+1;
        saveCycleTime(23, scale.FinalTime, paths[22]);
      }
      lastButtonPressed = "scale";
      printButtonPressed = "Scale";
      red = 0;
      green = 1;
      purple = 0;
    }
    allianceSwitch.mousePressed();
    if (allianceSwitch.activated == true) {
      if (lastButtonPressed=="portal")
      {
        paths[0] = paths[0]+1;
        saveCycleTime(1, allianceSwitch.FinalTime, paths[0]);
      }
      if (lastButtonPressed=="exchangePickup")
      {
        paths[5] = paths[5]+1;
        saveCycleTime(6, allianceSwitch.FinalTime, paths[5]);
      }
      if (lastButtonPressed=="cubePileZone")
      {
        paths[10] = paths[10]+1;
        saveCycleTime(11, allianceSwitch.FinalTime, paths[10]);
      }
      if (lastButtonPressed=="cubeLineZone")
      {
        
        paths[15] = paths[15]+1;
        saveCycleTime(16, allianceSwitch.FinalTime, paths[15]);
      }
      if (lastButtonPressed=="opponentCubeLineZone")
      {
        paths[20] = paths[20]+1;
        saveCycleTime(21, allianceSwitch.FinalTime, paths[20]);
      }
      lastButtonPressed = "allianceSwitch";
      printButtonPressed = "Alliance Switch";
      red = 0;
      green = 1;
      purple = 0;
    }
    exchangeDropoff.mousePressed();
    if (exchangeDropoff.activated == true) {
      if (lastButtonPressed=="portal")
      {
        paths[3] = paths[3]+1;
        saveCycleTime(4, exchangeDropoff.FinalTime, paths[3]);
      }
      if (lastButtonPressed=="exchangePickup")
      {
        paths[8] = paths[8]+1;
        saveCycleTime(9, exchangeDropoff.FinalTime, paths[8]);
      }
      if (lastButtonPressed=="cubePileZone")
      {
        paths[13] = paths[13]+1;
        saveCycleTime(14, exchangeDropoff.FinalTime, paths[13]);
      }
      if (lastButtonPressed=="cubeLineZone")
      {
        paths[18] = paths[18]+1;
        saveCycleTime(19, exchangeDropoff.FinalTime, paths[18]);
      }
      if (lastButtonPressed=="opponentCubeLineZone")
      {
        paths[23] = paths[23]+1;
        saveCycleTime(24, exchangeDropoff.FinalTime, paths[23]);
      }
      lastButtonPressed = "exchangeDropoff";
      printButtonPressed = "Exchange Dropoff";
      red = 0;
      green = 1;
      purple = 0;
    }
    droppedBox.mousePressed();
    if (droppedBox.activated == true) {
      if (lastButtonPressed=="portal")
      {
        paths[4] = paths[4]+1;
        saveCycleTime(5, droppedBox.FinalTime, paths[4]);
      }
      if (lastButtonPressed=="exchangePickup")
      {
        paths[9] = paths[9]+1;
        saveCycleTime(10, droppedBox.FinalTime, paths[9]);
      }
      if (lastButtonPressed=="cubePileZone")
      {
        paths[14] = paths[14]+1;
        saveCycleTime(15, droppedBox.FinalTime, paths[14]);
      }
      if (lastButtonPressed=="cubeLineZone")
      {
        paths[19] = paths[19]+1;
        saveCycleTime(20, droppedBox.FinalTime, paths[19]);
      }
      if (lastButtonPressed=="opponentCubeLineZone")
      {
        paths[24] = paths[24]+1;
        saveCycleTime(25, droppedBox.FinalTime, paths[24]);
      }
      lastButtonPressed = "droppedBox";
      printButtonPressed = "Dropped Box";
      red = 0;
      green = 1;
      purple = 0;
    }
    
    startMatchButton.mousePressed();

    if (startMatchButton.activated == true) {
      startMatchButton.updateColor(0, 0, 255);
      run = true;
      startTime = millis();
    }
    
  }
  if (page == 3) {
    end.mousePressed();
    if (end.activated == true) {
      end.updateColor(30, 255, 30);

      activeBox = "end";
      run = false;
      startMatchButton.updateColor(200, 200, 200);
      pageSelect.boxes.get(2).isChecked = false;
      pageSelect.boxes.get(0).isChecked = true;
      pageSelect.checkedBox = 0;
      saveJSON();
      matchNumber.start = matchNumber.start + 1;
      clearEntries();
      loadJSON(matchNumber.start);
    }
    defenseRating.mousePressed();
    offenseRating.mousePressed();
    rankingPoints.mousePressed();
    rating.mousePressed();
    Points.mousePressed();
  }
  // this is the places where things stay on all pages.
  pageSelect.mousePressed();
  page = pageSelect.checkedBox+1;
  //println(page);
    
}
  


void draw() {

  // same as the last. all vars need to be declared here.
  // ex. var.draw();

  // use text(); to write text on the screen.
  // use rect(); to draw rectangles
   
  background(255, 255, 255);
    
    tint (0,0,0,100);
      blackOnTrans.resize(1800,1200);
    image(blackOnTrans, 0, 0);
    noTint();
    
  fill(200);
  rect(10, 10, 420, 80);
  //title
  textFont(font, 40);
  fill(0);
  text("Match Scouting 2018!", 20, 60);
  alliance.draw();
  text("Alliance (Blue/Red)", 1150, 60);


  pageSelect.draw();
    

  if (page == 1) {
    textFont(font, 32);

    matchNumber.draw();
    teamNumber.draw();
    teamMember.draw();
    nameSelect.draw();
    loadMatchButton.draw();
    text("Match Number:", 10, 850);
    tournament.draw();
    flipField.draw();
    fill(0, 0, 0);
    text("Tournament",130, 480);
    text("WARNING: DO NOT PRESS FLIP FIELD UNLESS ABSOLUTELY NESCSSARY", 400, 750);
    
  
  } else if (page == 2) {

    fill(0);

    text("Alliance (Blue/Red)", 1150, 60);
    textFont(font, 32);
    text("Team Number: "+ teamNumber.input, 440, 60);
    text("Autonomous", 490, 180);
    text("Teleop", 1420, 180);
   
    
    
   if (flipField.isChecked){
    flippedField.resize(1800,650);
    image(flippedField, 50, 150);
    
     
   }else{
    field.resize(1800, 650);
    image(field, 50, 150);
   }
    text(cycleTimer.currTime(), 900, 850);

    timer();// draws timer. should never change.
    times.draw();
    times.start = "Time: "+m+":"+sS;
    startMatchButton.draw();

    disabled.draw();
    potf.draw();
    flippedOver.draw();
    techFoul1.draw();
    foul1.draw();
    attemptedClimb.draw();
    successfulClimb.draw();
    noShow.draw();
    yellowCard.draw();
    redCard.draw();
    
    
    if(flipField.isChecked == false && child.alliance == 1 ){
        
    portal.draw();
    opponentSwitch.draw();
    scale.draw(); 
    allianceSwitch.draw();
    opponentCubeLineZone.draw();
    cubeLineZone.draw();
    exchangeDropoff.draw();
    exchangePickup.draw();
    cubePileZone.draw();
      
    }
    else if(flipField.isChecked == false && child.alliance == 2){
     
      portal.x = 70;
      portal.draw();
      opponentSwitch.x = 430;
      opponentSwitch.draw();
      scale.x = 853;
      scale.draw(); 
      allianceSwitch.x = 1200;
      allianceSwitch.draw();
      opponentCubeLineZone.x = 690;
      opponentCubeLineZone.draw();
      cubeLineZone.x = 1033;
      cubeLineZone.draw();
      exchangeDropoff.x = 1460;
      exchangeDropoff.draw();
      exchangePickup.x =1460;
      exchangePickup.draw();
      cubePileZone.x = 1330;
      cubePileZone.draw();
    }
    else if(flipField.isChecked == true && child.alliance == 1){
    
      portal.x = 70;
      portal.draw();
      opponentSwitch.x = 430;
      opponentSwitch.draw();
      scale.x = 853;
      scale.draw(); 
      allianceSwitch.x = 1200;
      allianceSwitch.draw();
      opponentCubeLineZone.x = 690;
      opponentCubeLineZone.draw();
      cubeLineZone.x = 1033;
      cubeLineZone.draw();
      exchangeDropoff.x = 1460;
      exchangeDropoff.draw();
      exchangePickup.x =1460;
      exchangePickup.draw();
      cubePileZone.x = 1330;
      cubePileZone.draw();
    }
    else if(flipField.isChecked == false && child.alliance == 2){
    portal.draw();
    opponentSwitch.draw();
    scale.draw(); 
    allianceSwitch.draw();
    opponentCubeLineZone.draw();
    cubeLineZone.draw();
    exchangeDropoff.draw();
    exchangePickup.draw();
    cubePileZone.draw();
    }
    droppedBox.draw();
    assistedClimb.draw();
    
    //print(printButtonPressed);
    fill(0,0,0);
    rect(0,1140,800,60);
    
     if (red == 1) {
     fill( 255, 0, 0); 
    }
    if(green == 1) {
     fill(0, 255, 127); 
    }
    if(purple == 1) {
     fill (138, 43, 226); 
    }
    text( printButtonPressed, 0, 1165);
    
    
  } else {
    fill(0);
    text("Ending Alliance Points:", 10, 300);
    text("Ranking Points:", 10, 480);
    text("Overall Performance Rating:", 10, 670);
    text("Defense Rating:", 10, 860);
    text("Offense Rating:", 10, 1050);
    textFont(font, 32);
    text("Team Number: "+ teamNumber.input, 440, 60);

    Points.draw();
    rankingPoints.draw();
    rating.draw();
    defenseRating.draw();
    offenseRating.draw();
    end.draw();
    font = createFont("Lucida Console", 32, true);
    textFont(font, 32);
    font = createFont("Arial", 32, true);
    textFont(font, 32);

    fill(0);
    text("1           2           3           4", 350, 425);
    text("1            2           3            4           5", 560, 615);
    text("1            2           3            4           5", 350, 805);
    text("1            2           3            4           5", 350, 995);
  }
}

void updateAlli() {
  if (child.scout < 4) {
    alliance.updateColor(255, 0, 0);
  }
  if (child.scout > 3) {
    alliance.updateColor(0, 0, 255);
  }
}

void loadJSON(int MATCH) {
  values = loadJSONArray("galileoDivisionStart.json");
  //println("match: " + MATCH);
  //println("scout: " + child.scout);

  int i = (MATCH-1)*6;
  i = i+child.scout;
  i--;

  JSONObject match = values.getJSONObject(i); 

  //String tournament = match.getString("Tournament");
  alli = match.getString("alliance");

  int MATCHNUM = match.getInt("Match #");
  int TEAMNUM = match.getInt("Team #");

  String TEAMNUMs = str(TEAMNUM);

  //println(i + ", " + alli + ", " + MATCHNUM + ", " + TEAMNUM + ", " + tournament);
  //println(alli);
  updateAlli(); 
  teamNumber.input = TEAMNUMs;
}

void saveJSON() {
  JSONArray values1;
  if (matchNumber.start > 1) {
    values1 = loadJSONArray("dataOut.json");
  } else {
    values1 = new JSONArray();
  }

  int id = (matchNumber.start-1)*6;
  id = id+child.scout;
  id--;

  i = matchNumber.start;
  JSONObject match = new JSONObject();//(i);

  match.setInt("FactId", id);
  match.setInt("Match #", matchNumber.start);
  match.setInt("Team #", int(teamNumber.input));
  match.setInt("Portal", portal.count);
  //print(portal.count);
  //println("portal count");
  match.setInt("Cube Pile Zone", cubePileZone.count);
  match.setInt("Opponent Cube Line Zone", opponentCubeLineZone.count);
  match.setInt("Alliance Switch", allianceSwitch.count);
  match.setInt("Scale", scale.count);
  match.setInt("Opponent Switch", opponentSwitch.count);
  match.setInt("Exchange Drop Off", exchangeDropoff.count);
  match.setInt("Exchange Pick Up", exchangePickup.count);
  match.setInt("Cube Line Zone", cubeLineZone.count);
  match.setString("Scout Name", teamMember.input);
  match.setInt("Scout Number", child.scout);

  match.setBoolean("Disabled", disabled.isChecked);
  match.setBoolean("Parts on the Field", potf.isChecked);
  match.setBoolean("Flip", flippedOver.isChecked);
  match.setBoolean("Attempted Climb", attemptedClimb.isChecked);
  match.setBoolean("Successful Climb", successfulClimb.isChecked);
  match.setBoolean("No Show", noShow.isChecked);
  match.setInt("Tournament", tournament.checkedBox); 
  match.setBoolean("Yellow Card", yellowCard.isChecked);
  match.setBoolean("Red Card", redCard.isChecked);
  match.setBoolean("Tech Foul", techFoul1.isChecked);
  match.setBoolean("Foul", foul1.isChecked);
  match.setInt( "Dropped Box", droppedBox.count);
  match.setInt( "Foul",foulCounter);
  match.setInt( "Tech Foul", techFoulCounter);
  match.setBoolean("Assisted Climb", assistedClimb.isChecked);

  values1.setJSONObject(i, match);
  saveJSONArray(values1, "data/dataOut.json");
}

void clearEntries() {
  disabled.isChecked = false;
  potf.isChecked = false;
  flippedOver.isChecked = false;
  attemptedClimb.isChecked = false;
  successfulClimb.isChecked = false;
  noShow.isChecked = false;
  defenseRating.checkedBox = 0;
  offenseRating.checkedBox = 0;
  rankingPoints.checkedBox = 0;
  rating.checkedBox = 0;
  Points.start = 0;
}

void keyPressed() {
  //println(key+" "+activeBox);
  if (activeBox=="teamNumber") {
    teamNumber.update(key, keyCode);
  }
  if (activeBox=="teamMember") {
    teamMember.update(key, keyCode);
  }
}
void timer() {
  if (run) {
    t = interval+(startTime/1000)-int(millis()/1000);
    m = t/60;
    s = t%60;
    sS = nf(s, 2);
    time = nf(t, 3);
    if (t == 0) {
      println("GAME OVER");
      run = false;
    }
  }
}
void saveCycleTime(int Path, float seconds, int currPathCount) {
  
  //println("Path: "+Path+" Seconds: "+seconds);
  
  JSONArray cycleTimes = new JSONArray();
  try {
    cycleTimes = loadJSONArray("data/cycleTimes.JSON");
  }  catch(NullPointerException e) {
    saveJSONArray(cycleTimes, "data/cycleTimes.JSON");
  }
  JSONObject cycleTime = new JSONObject();
  //int pathCount = paths[Path][1];
  //println("Path Count: "+currPathCount+" For path: "+Path);
  
  cycleTime.setFloat("P"+str(Path)+":"+currPathCount,seconds);//}

  
  //println(cycleTime);
  cycleTimes.setJSONObject(NumOfValsInCycleTimes, cycleTime);
  //println(cycleTimes);
  saveJSONArray(cycleTimes, "data/cycleTimes.JSON");
  
  NumOfValsInCycleTimes++;
}