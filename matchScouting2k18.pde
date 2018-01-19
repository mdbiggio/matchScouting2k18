// setup: (variables and stuff)
PrintWriter output;
PFont font;
PImage field;
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

int NumOfValsInCyclTimes=0;

String lastButtonPressed = "";
String printButtonPressed = "";

//Counter Variables
int P1 = 0;
int P2 = 0;
int P3 = 0;
int P4 = 0;
int P5 = 0;
int P6 = 0;
int P7 = 0;
int P8 = 0;
int P9 = 0;
int P10 = 0;
int P11 = 0;
int P12 = 0;
int P13 = 0;
int P14 = 0;
int P15 = 0;
int P16 = 0;
int P17 = 0;
int P18 = 0;
int P19 = 0;
int P20 = 0;
int P21 = 0;
int P22 = 0;
int P23 = 0;
int P24 = 0;
int P25 = 0;

int red = 0;
int green = 0;
int purple = 0;

int page = 1;

JSONArray values;
int scoutNum;

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
checkBox disabled;
checkBox potf;
checkBox flippedOver;
checkBox attemptedClimb;
checkBox successfulClimb;
checkBox noShow;
checkBox yellowCard;
checkBox redCard;
checkBox techFoul1;
checkBox foul1;

// To add text button groups type: textButtonGroup (unique variable name);
textButtonGroup nameSelect;




boolean mousePos;
int mX = mouseX;
int mY = mouseY;
String alli = "blue";
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
  field = loadImage("field.PNG");
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

  //page 2
  times = new textBox(1600, 10, 200, 60, 200, 200, 200, 0, 0, 0, "Time: ", false, false, false);
  startMatchButton = new textButton(1600, 80, 200, 60, 200, 200, 200, 0, 0, 0, "Start Match", false);

  loadMatchButton = new textButton(390, 1100, 200, 60, 200, 200, 200, 0, 0, 0, "Load Match", false);  


  disabled = new checkBox(600, 870, 200, 200, 200, false);
  potf = new checkBox(600, 960, 200, 200, 200, false);
  flippedOver = new checkBox(600, 1050, 200, 200, 200, false);
  attemptedClimb = new checkBox(1200, 870, 200, 200, 200, false);
  successfulClimb = new checkBox(1200, 960, 200, 200, 200, false);
  noShow = new  checkBox(1200, 1050, 200, 200, 200, false);
  yellowCard = new checkBox(1800, 870, 200, 200, 200, false);
  redCard = new checkBox(1800, 960, 200, 200, 200, false);
  techFoul1 = new checkBox(1800, 1050, 200, 200, 200, false);
  foul1 = new checkBox(1500, 1050, 200, 200, 200,false);
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
  end = new textButton(1700, 950, 200, 80, 30, 255, 30, 0, 0, 0, "End Match", false);
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
     red = 0;
     green = 0;
     purple = 1;
      
    }
    foul1.mousePressed();
    if (foul1.activated == true){
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
        P2++;
        saveCycleTime(2, opponentSwitch.FinalTime);
      }
      if (lastButtonPressed=="exchangePickup")
      {
        P7++;
        saveCycleTime(7, opponentSwitch.FinalTime);
      }
      if (lastButtonPressed=="cubePileZone")
      {
        P12++;
        saveCycleTime(12, opponentSwitch.FinalTime);
      }
      if (lastButtonPressed=="cubeLineZone")
      {
        P17++;
        saveCycleTime(17, opponentSwitch.FinalTime);
      }
      if (lastButtonPressed=="opponentCubeLineZone")
      {
        P22++;
        saveCycleTime(22, opponentSwitch.FinalTime);
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
        P3++;
        saveCycleTime(3, scale.FinalTime);
      }
      if (lastButtonPressed=="exchangePickup")
      {
        P8++;
        saveCycleTime(8, scale.FinalTime);
      }
      if (lastButtonPressed=="cubePileZone")
      {
        P13++;
        saveCycleTime(13, scale.FinalTime);
      }
      if (lastButtonPressed=="cubeLineZone")
      {
        P18++;
        saveCycleTime(18, scale.FinalTime);
      }
      if (lastButtonPressed=="opponentCubeLineZone")
      {
        P23++;
        saveCycleTime(23, scale.FinalTime);
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
        P1++;
        saveCycleTime(1, allianceSwitch.FinalTime);
      }
      if (lastButtonPressed=="exchangePickup")
      {
        P6++;
        saveCycleTime(6, allianceSwitch.FinalTime);
      }
      if (lastButtonPressed=="cubePileZone")
      {
        P11++;
        saveCycleTime(11, allianceSwitch.FinalTime);
      }
      if (lastButtonPressed=="cubeLineZone")
      {
        P16++;
        saveCycleTime(16, allianceSwitch.FinalTime);
      }
      if (lastButtonPressed=="opponentCubeLineZone")
      {
        P21++;
        saveCycleTime(21, allianceSwitch.FinalTime);
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
        P4++;
        saveCycleTime(4, exchangeDropoff.FinalTime);
      }
      if (lastButtonPressed=="exchangePickup")
      {
        P9++;
        saveCycleTime(9, exchangeDropoff.FinalTime);
      }
      if (lastButtonPressed=="cubePileZone")
      {
        P14++;
        saveCycleTime(14, exchangeDropoff.FinalTime);
      }
      if (lastButtonPressed=="cubeLineZone")
      {
        P19++;
        saveCycleTime(19, exchangeDropoff.FinalTime);
      }
      if (lastButtonPressed=="opponentCubeLineZone")
      {
        P24++;
        saveCycleTime(24, exchangeDropoff.FinalTime);
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
        P5++;
        saveCycleTime(5, droppedBox.FinalTime);
      }
      if (lastButtonPressed=="exchangePickup")
      {
        P10++;
        saveCycleTime(10, droppedBox.FinalTime);
      }
      if (lastButtonPressed=="cubePileZone")
      {
        P15++;
        saveCycleTime(15, droppedBox.FinalTime);
      }
      if (lastButtonPressed=="cubeLineZone")
      {
        P20++;
        saveCycleTime(20, droppedBox.FinalTime);
      }
      if (lastButtonPressed=="opponentCubeLineZone")
      {
        P25++;
        saveCycleTime(25, droppedBox.FinalTime);
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
  } else if (page == 2) {

    fill(0);

    text("Alliance (Blue/Red)", 1150, 60);
    textFont(font, 32);
    text("Team Number: "+ teamNumber.input, 440, 60);
    text("Autonomous", 490, 180);
    text("Teleop", 1420, 180);
   
    
    
    fill(0);
    text("Disabled:", 450, 920);
    text("Parts on the Field:", 325, 1010);
    text("Flipped Over:", 395, 1100);
    text("Attempted Climb:", 860, 920);
    text("Successful Climb:", 850, 1010);
    text("No Show:", 1045, 1100);
    text("Yellow Card:", 1615, 920);
    text("Red Card:", 1645, 1010);
    text("Tech Foul:",1645, 1100);
    text("Foul:", 1340, 1100);

    field.resize(1800, 650);
    image(field, 50, 150);

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
    portal.draw();
    opponentSwitch.draw();
    scale.draw();
    allianceSwitch.draw();
    opponentCubeLineZone.draw();
    cubeLineZone.draw();
    exchangeDropoff.draw();
    exchangePickup.draw();
    cubePileZone.draw();
    droppedBox.draw();
    
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
  String alli = match.getString("Alliance");

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
void saveCycleTime(int Path, float seconds) {
  
  println("Path: "+Path+" Seconds: "+seconds);
  
  JSONArray cycleTimes = new JSONArray();
  try {
    cycleTimes = loadJSONArray("data/cycleTimes.JSON");
  }  catch(NullPointerException e) {
    saveJSONArray(cycleTimes, "data/cycleTimes.JSON");
  }
  JSONObject cycleTime = new JSONObject();
  
  //if(Path==1){
  cycleTime.setFloat(str(Path),seconds);//}

  
  println(cycleTime);
  cycleTimes.setJSONObject(NumOfValsInCyclTimes, cycleTime);
  println(cycleTimes);
  saveJSONArray(cycleTimes, "data/cycleTimes.JSON");
  
  NumOfValsInCyclTimes++;
}