class ShowData {
  
  private int dataX = 950, dataY = 750;
  private int volume;
  private String releaseDate;
  private String trackName;
  private String artistsName;
  private double tempoValue;
  private double valenceValue;
  private double danceabilityValue;
  private String spotifyIDsValue;
  private PImage trackImage;
  
  ShowData(int volume,String releaseDate,String trackName,String artistsName,double tempoValue,double valenceValue,double danceabilityValue,String spotifyIDsValue) {
  
  this.volume = volume;
  this.releaseDate = releaseDate;
  this.trackName = trackName;
  this.artistsName = artistsName;
  this.tempoValue = tempoValue;
  this.valenceValue = valenceValue;
  this.danceabilityValue = danceabilityValue;
  this.spotifyIDsValue = spotifyIDsValue;

  }

  void draw() {
    textFont(dataFont);
    textAlign(LEFT,CENTER);
    fill(100);
    
    text("Volume: "+volume,dataX,dataY+25);
    text("Release date: "+releaseDate,dataX,dataY+50);
    text("Track name: "+trackName,dataX,dataY+75);
    text("Artist: "+artistsName,dataX,dataY+100);
    text("Tempo Value: "+tempoValue,dataX,dataY+125);
    text("Valence value: "+valenceValue,dataX,dataY+150);
    text("Danceability value: "+danceabilityValue,dataX,dataY+175);
    text("Spotify ID: "+spotifyIDsValue,dataX,dataY+200);
    
    String[] url = loadStrings("http://moody2.ucc.ie/test/Authoring/getSpot.php?track="+spotifyIDsValue);
    this.trackImage = loadImage(url[0],"jpg");
    this.trackImage.resize(0,300);
    image(this.trackImage,950,430);
  
    
  }

}