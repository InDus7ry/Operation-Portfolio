//From Daniel Shiffman
//The nature of code

class Timer {

  int savedTime; // When Timer started
  int totalTime; // How long Timer should last
  boolean stop;

  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }

  // Starting the timer
  void start() {
    // When the timer starts it stores the current time in milliseconds.
    stop=false;
    savedTime = millis();
  }

  // The function isFinished() returns true if 5,000 ms have passed. 
  // The work of the timer is farmed out to this method.
  boolean isFinished() { 
    // Check how much time has passed
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime || stop) {
      return true;
    } else {
      return false;
    }
  }
}
