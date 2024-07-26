// Version 4.1

int wallHeight =  0; 
boolean ShowTrack = true;
boolean ShowPath = true;
boolean ShowFeet = true;
int show = 0xffff;
HashMap<Integer, Integer> lengthInSpace = new HashMap<>(); //cursorID and seconds
ArrayList<Integer> people; //list of people detected

void setupPharus(){
  noStroke();
  fill(0);
  wallHeight = 0;
  initTracking(false, wallHeight); 
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
    
  if (!beingFilled) {
    //add ripples at person's location
    for (int trackID=0; trackID<GetNumTracks (); trackID++) {
      if (timeToStart(trackID)) {
        pond.add(new Ripple(GetX(trackID)/aec.getScaleX(), GetY(trackID)/aec.getScaleY())); 
      }
      fill(255);
      ellipse(GetX(trackID)/ aec.getScaleX(), GetY(trackID) / aec.getScaleY(), 1 , 1);
    }
  }
}

//true if cursor ID doesn't exist in the screen
boolean cursorIdNotInScreen(int cursor) {
  for (int trackID=0; trackID<GetNumTracks (); trackID++) {
    if (GetCursorID(trackID) == cursor) {
      return false;
    }
  }
  return true;
}

//true if it is time for ripple to start at the person's location based on frequency
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
