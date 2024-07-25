// Version 4.1

float cursor_size = 25;
PFont font;
int scaleFactor = 3;
int windowWidth = 1200;   //3030/scaleFactor; // for real Deep Space this should be 3030
int windowHeight = 400; //3712/scaleFactor; // for real Deep Space this should be 3712
int wallHeight =  0; //1914/scaleFactor; // for real Deep Space this should be 1914 (Floor is 1798)

boolean ShowTrack = true;
boolean ShowPath = true;
boolean ShowFeet = true;

int show = 0xffff;

/*
void settings()
{
  size(windowWidth, windowHeight); 
  //fullScreen(P2D, SPAN);  
}
*/

void setupPharus()
{
  noStroke();
  fill(0);

  font = createFont("Arial", 18);
  textFont(font, 18);
  textAlign(CENTER, CENTER);
  windowWidth = width / aec.getScaleX(); 
  windowHeight = height /2 / aec.getScaleY();
  wallHeight = 0; //(height / 2) / aec.getScaleY();
  initTracking(false, wallHeight); //wallHeight);
  people = new ArrayList<>();
}

void drawPharus() {
  
  // a person enters
  if (GetNumTracks() > people.size()) {
      for (int p = 0; p < GetNumTracks() - people.size(); p++) {
        for (int trackID=0; trackID<GetNumTracks (); trackID++) {
          int cursor = GetCursorID(trackID);
          if (!people.contains(cursor)) {
            people.add(cursor);
            lengthInSpace.put(cursor, 0);
          }
        }
      }
    }
    // a person leaves
    else if (GetNumTracks() < people.size()) {
      for (int p = 0; p < people.size() - GetNumTracks(); p++) {
        for (int w = 0; w < people.size(); w++) { 
          int cursor = people.get(w); 
          if (cursorIdNotInScreen(cursor)) {
            people.remove(Integer.valueOf(cursor));
            lengthInSpace.remove(cursor);
          }
        }
      }
    }
    
    for (int trackID=0; trackID<GetNumTracks (); trackID++) {
      if (timeToStart(trackID)) {
        
 // ------------------------------------------------------------------------------------------
 // ------------------------------------------------------------------------------------------
        pond.add(new Ripple2(GetX(trackID)/aec.getScaleX(), GetY(trackID)/aec.getScaleY())); 
 // ------------------------------------------------------------------------------------------
 // ------------------------------------------------------------------------------------------
        
      }
      
      
      //fill(255);
      //ellipse(GetX(trackID)/ aec.getScaleX(), GetY(trackID) / aec.getScaleY(), 1 , 1);
    }
}

//true if cursor doesn't exist in the screen
boolean cursorIdNotInScreen(int cursor) {
  for (int trackID=0; trackID<GetNumTracks (); trackID++) {
    if (GetCursorID(trackID) == cursor) {
      return false;
    }
  }
  return true;
}

boolean timeToStart(int trackID) {
  if (lengthInSpace.get(GetCursorID(trackID)) %  frequency == 0) {
    return true;
  }
  else {
    return false;
  }
}








void keyPressedPharus()
{
  switch(key)
  {
  case 'p':
    ShowPath = !ShowPath;
    break;
  case 't':
    ShowTrack = !ShowTrack;
    break;
  case 'f':
    ShowFeet = !ShowFeet;
    break;
  }
  
  // use keys <0> .. <9> to toggle foot drawing of tracks 0 .. 9
  if (key >= '0' && key <= '9')
  {
    show = show ^ (int)pow(2, key - '0');
  }
}
