JSONArray theData;
JSONObject album;
int volume;
String releaseDate;
JSONArray artists;
String[] artistsName;
JSONArray tempo;
double[] tempoValue;
JSONArray tracks;
String[] trackName;
JSONArray valence;
double[] valenceValue;
JSONArray danceability;
double[] danceabilityValue;
JSONArray spotifyIDs;
String [] spotifyIDsValue;
String[] yearPiece;

String[] releaseDateArray = new String[60];
int[] volumeArray = new int[60];

int browseCount;

int lengthOfTracks;
PFont dataFont;
PFont titleFont;
PFont smallTitleFont;
PImage chartBackground;
PImage chartIllstrate;
PImage chartDance;
PImage chartFast;
PImage chartEuphoric;

int textY;

int trackListX;
int trackListY;

String chartType;
ButtonA[] buttonA;
ButtonB buttonB;
ShowData trackData;
ButtonC buttonC;
//star
Star[] stars = new Star[800];
float speed;
int cx = width/2;
int cy = height/2;

//filter and markers
FilterData filter;
Markers[] songMarkers;

void setup() { 

  size(1600, 1000);
  titleFont = createFont("Helvetica Neue", 60);
  dataFont = createFont("Helvetica Neue", 24);
  smallTitleFont = createFont("Helvetica Neue", 35);

  buttonA = new ButtonA[20];
  buttonA[0] = new ButtonA("Browse", 50, 85);
  buttonA[1] = new ButtonA("Charts", 600, 85);
  buttonA[6] = new ButtonA("Explore", 1200, 85);
  buttonA[2] = new ButtonA("LAST", -50, height-150);
  buttonA[3] = new ButtonA("NEXT", width-250, height-150);
  buttonA[4] = new ButtonA("By Volume", 300, 85);
  buttonA[5] = new ButtonA("By Year", 650, 85);
  buttonA[7] = new ButtonA("YEAR -", -50, 250);
  buttonA[8] = new ButtonA("YEAR +", width-250, 250);
  buttonA[9] = new ButtonA("HOME", 1250, 85);
  buttonA[10] = new ButtonA("Danceable", 50, 85);
  buttonA[11] = new ButtonA("Fast", 450, 85);
  buttonA[12] = new ButtonA("Euphoric", 850, 85);
  buttonA[13] = new ButtonA("Danceablity",50, 85);
  buttonA[14] = new ButtonA("Tempo",450, 85);
  buttonA[15] = new ButtonA("Valence",850, 85);

  
  browseCount = 1;
  volumeCue = 1;
  currentYear = 1998;
  releaseDateOnButton = "a";
  trackNameOnButton = "a";
  theData = loadJSONArray("NOW-US-1-61.json");

  //star
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }

  chartBackground = loadImage("joyDivision.png");
  chartType = "Danceable";
  chartDance = loadImage("dance.png");
  chartFast = loadImage("fast.png");
  chartEuphoric = loadImage("euphoric.jpg");
  chartIllstrate = chartDance;
  
  //filter and markers
  filter = new FilterData(width * 2 / 3.0, height * 0.8); 
  filter.setRange(0,1);
 // songMarkers = createSongMarkers(theData);
  
}

//Markers []  createSongMarkers(String fromFile){
  
//}

void draw()
{
  background(0);


  if (theCount ==0) {
    // 
    buttonA[2].buttonShowing =false;
    buttonA[3].buttonShowing =false;
    buttonA[4].buttonShowing =false;
    buttonA[5].buttonShowing =false;
    buttonA[7].buttonShowing =false;
    buttonA[8].buttonShowing =false;
    buttonA[9].buttonShowing =false;
    buttonA[10].buttonShowing =false;
    buttonA[11].buttonShowing =false;
    buttonA[12].buttonShowing =false;
    buttonA[13].buttonShowing =false;
    buttonA[14].buttonShowing =false;
    buttonA[15].buttonShowing =false;
    
    speed = 3;
    if (speed<0) {
      speed = - speed;
    }


    for (int i = 0; i < stars.length; i++) {
      stars[i].update();
      stars[i].show();
    }
    //
    stroke(100);
    textFont(titleFont);
    textAlign(CENTER, CENTER);
    line(0, 80, width, 80);
    fill(200);
    text("Now this is what I call music!", width/2, 40);
    line(50, 150, width-50, 150);

    buttonA[0].draw();
    buttonA[1].draw();
    buttonA[6].draw();
  }
  


  //----------------------------------------------- 
  if (theCount == 1) {//4,5,9,2,3
    buttonA[0].buttonShowing =false;
    buttonA[1].buttonShowing =false;
    buttonA[6].buttonShowing =false;
    buttonA[10].buttonShowing =false;
    buttonA[11].buttonShowing =false;
    buttonA[12].buttonShowing =false;
    buttonA[13].buttonShowing =false;
    buttonA[14].buttonShowing =false;
    buttonA[15].buttonShowing =false;

    
    background(0);
    stroke(100);
    textFont(titleFont);
    textAlign(CENTER, CENTER);
    line(0, 80, width, 80);
    fill(200);
    text("Browse", width/2, 40);
    line(50, 150, width-50, 150);
    textAlign(LEFT, CENTER);

    buttonA[9].draw();
    mainBrowse();
  }
  //----------------------------------------
  if (theCount == 2) {//9,10,11,12
    buttonA[0].buttonShowing =false;
    buttonA[1].buttonShowing =false;
    buttonA[2].buttonShowing =false;
    buttonA[3].buttonShowing =false;
    buttonA[4].buttonShowing =false;
    buttonA[5].buttonShowing =false;
    buttonA[7].buttonShowing =false;
    buttonA[8].buttonShowing =false;
    buttonA[13].buttonShowing =false;
    buttonA[14].buttonShowing =false;
    buttonA[15].buttonShowing =false;
    
    background(0);
    chartBackground.resize(width, 200);
    image(chartBackground, 0, 800);

    textFont(titleFont);
    textAlign(CENTER, CENTER);
    stroke(100);
    line(0, 80, width, 80);
    textAlign(LEFT, CENTER);
    text("Top10 "+chartType+" Songs: ", 50, 200);
    fill(200);
    textAlign(CENTER, CENTER);
    text("Charts", width/2, 40);
    line(50, 150, width-50, 150);
    
    stroke(150);
    line(750, 230, width-50, 230);
    fill(200);
    textFont(smallTitleFont);
    text("Top Track", 900, 200);
    text("Artist", 1400, 200);

    buttonA[9].draw();
    buttonA[10].draw();
    buttonA[11].draw();
    buttonA[12].draw();

    chartIllstrate.resize(250, 250);
    image(chartIllstrate, 50, 350);
  }
  
//--------------------------------
if(theCount ==3){//13,14,15,9
    buttonA[0].buttonShowing =false;
    buttonA[1].buttonShowing =false;
    buttonA[2].buttonShowing =false;
    buttonA[3].buttonShowing =false;
    buttonA[4].buttonShowing =false;
    buttonA[5].buttonShowing =false;
    buttonA[6].buttonShowing =false;
    buttonA[7].buttonShowing =false;
    buttonA[8].buttonShowing =false;
    buttonA[10].buttonShowing =false;
    buttonA[11].buttonShowing =false;
    buttonA[12].buttonShowing =false;

    background(0);
    
    stroke(100);
    line(0, 80, width, 80);
    line(50, 150, width-50, 150);
    
    fill(200);
    textAlign(CENTER, CENTER);
    textFont(titleFont);
    text("Explore", width/2, 40);
    line(50, 150, width-50, 150);
    
    buttonA[9].draw();
    buttonA[13].draw();
    buttonA[14].draw();
    buttonA[15].draw();
    
    filter.draw();
}
  
}

//control buttonA only click once
void mousePressed() {
  if(theCount == 0){
    buttonA[0].buttonShowing =true;
    buttonA[1].buttonShowing =true;
    buttonA[6].buttonShowing =true;
    buttonA[0].buttonAClick();
    buttonA[1].buttonAClick();
    buttonA[6].buttonAClick();
  }
  
  if(theCount == 1){
    buttonA[2].buttonShowing =true;
    buttonA[3].buttonShowing =true;
    buttonA[4].buttonShowing =true;
    buttonA[5].buttonShowing =true;
    buttonA[7].buttonShowing =true;
    buttonA[8].buttonShowing =true;
    buttonA[9].buttonShowing =true;
    buttonA[2].buttonAClick();
    buttonA[3].buttonAClick();
    buttonA[4].buttonAClick();
    buttonA[5].buttonAClick();
    buttonA[7].buttonAClick();
    buttonA[8].buttonAClick();
    buttonA[9].buttonAClick();
  }
  
  if(theCount == 2){
    buttonA[9].buttonShowing =true;
    buttonA[10].buttonShowing =true;
    buttonA[11].buttonShowing =true;
    buttonA[12].buttonShowing =true;
    buttonA[9].buttonAClick();
    buttonA[10].buttonAClick();
    buttonA[11].buttonAClick();
    buttonA[12].buttonAClick();
  }
  
  if(theCount == 3){
    
   //avoid clicking the home button once clicking the explore
    if(buttonA[6].buttonShowing ==false){
      buttonA[9].buttonShowing =true;
    }
    buttonA[13].buttonShowing =true;
    buttonA[14].buttonShowing =true;
    buttonA[15].buttonShowing =true;
    buttonA[9].buttonAClick();
    buttonA[13].buttonAClick();
    buttonA[14].buttonAClick();
    buttonA[15].buttonAClick();
  }

  
  //filter
  filter.modifyRange();
  
}

void mainBrowse() {
  buttonA[4].draw();
  buttonA[5].draw();
  if (browseCount==1) {
    browseByVolume();
  } else if (browseCount ==2) {
    browseByYear();
  }
}

//show tracks list
void browseByVolume() {
  //browse = new Browse[60];
  trackListY = 350;
  textFont(titleFont);
  textAlign(LEFT, CENTER);
  text("List of Tracks:", 50, 200);
  buttonA[2].draw();
  buttonA[3].draw();

  stroke(150);
  line(250, 330, width-400, 330);
  fill(200);
  text("Track", 450, 300);
  text("Artist", 950, 300);

  for (int i = 0; i<theData.size(); i++) {

    album = theData.getJSONObject(i);
    volume = album.getInt("volume");
    volumeArray[i] = volume;
    releaseDate = album.getString("releaseDate");
    releaseDateArray[i] = releaseDate;
    artists = album.getJSONArray("artists");
    artistsName = artists.getStringArray();
    tracks = album.getJSONArray("tracks");
    trackName = tracks.getStringArray();
    lengthOfTracks = tracks.size();


    if (volumeCue == volume) {
      textFont(smallTitleFont);
      textAlign(LEFT, CENTER);
      text("Volume: "+volume, width-550, 200);
      text("Release Date: "+releaseDateArray[i], width-550, 250);

      for (int j=0; j<lengthOfTracks; j++) {
        textFont(dataFont);
        textAlign(LEFT, CENTER);
        text(trackName[j], 400, trackListY);
        text(artistsName[j], 900, trackListY);
        trackListY += 30;
      }
    }
  }
}

//browse by year
void browseByYear() {
  buttonBY = 400;
  buttonCY = 300;
  buttonCX = 400;

  textFont(titleFont);
  textAlign(CENTER, CENTER);
  fill(255);
  text("YEAR: "+currentYear, width/2, 200);
  buttonA[7].draw();
  buttonA[8].draw();

  theData = loadJSONArray("NOW-US-1-61.json");
  for (int i = 0; i< 60; i++) {

    album = theData.getJSONObject(i);
    volume = album.getInt("volume");
    volumeArray[i] = volume;
    releaseDate = album.getString("releaseDate");
    releaseDateArray[i] = releaseDate;
    artists = album.getJSONArray("artists");
    artistsName = artists.getStringArray();
    tracks = album.getJSONArray("tracks");
    trackName = tracks.getStringArray();
    lengthOfTracks = tracks.size();
    tempo = album.getJSONArray("tempo");
    tempoValue = tempo.getDoubleArray();
    lengthOfTracks = tracks.size();
    valence = album.getJSONArray("valence");
    valenceValue = valence.getDoubleArray();
    danceability = album.getJSONArray("danceability");
    danceabilityValue = danceability.getDoubleArray();
    spotifyIDs = album.getJSONArray("spotifyIDs");
    spotifyIDsValue = spotifyIDs.getStringArray();
    yearPiece = split(releaseDateArray[i], ' ');
    if (int(currentYear) == int(yearPiece[2])) {
      buttonB = new ButtonB(releaseDateArray[i], 100, buttonBY+=60);     
      buttonB.draw();
    }

    //after clicking on the date button
    if (releaseDateOnButton.equals(releaseDate)) {
      for (int j=0; j<lengthOfTracks; j++) {
        buttonC = new ButtonC(trackName[j], buttonCX, buttonCY+=60);
        buttonC.draw();

        //after clicking on the track name button
        if (trackNameOnButton.equals(trackName[j])) {
          trackData = new ShowData(volumeArray[i], releaseDateArray[i], 
            trackName[j], artistsName[j], tempoValue[j], valenceValue[j], 
            danceabilityValue[j], spotifyIDsValue[j]);
          trackData.draw();
        }
      }
    }
  }
}

void sortParameter(double[] s) {
  for (int j = 0; j < s.length - 1; j ++) {
    for (int k = 1; k < s.length - j; k ++)
    {
      if (s[j] > s[k])
      {
        double swap;
        swap = s[j];
        s[j] = s[k];
        s[k] = swap;
      }
    }
     for(int l=0;l<10;l++){
       
     }
  }
}