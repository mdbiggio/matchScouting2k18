public class timer {
 // Fields
 int startTime=0;
 boolean timing;
 // Constructors
 public timer () {
  timing = false;
  startTime = 0;
  
  }
  // Methods
  
  // set the starting time to millis()
  void startTimer() {
    startTime = millis();
    timing = true;
  }
  //return final time in seconds as a float:
  float endTimer() {
    float endTime = (millis()-startTime)/1000;
    timing = false;
    startTime = 0;
    return endTime;
    //reset automatically
  }
  //return current time
  float currTime() {
    if (timing) {
      return float (millis()-startTime)/1000;
    } else {
      return 0;
    }
      
  }
}