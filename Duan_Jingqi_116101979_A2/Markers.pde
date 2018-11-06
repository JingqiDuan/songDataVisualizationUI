class Markers {
  private float x;
  private float y;
  private float parameterValue;
  private String songName;
  private color markerColour;
  private float markerSize;
  private String theArtist;

  private PFont hoverFont;

  Markers(float ix, float iy, float iv, String trackName, String artist) {
    this.x = ix;
    this.y = iy;
    this.parameterValue = iv;
    this.songName = trackName;
    this.theArtist = artist;
    this.markerSize = this.parameterValue * 3+6;

    colorMode(HSB);
    markerColour = color(random(0, 255), random(100, 250), random(200, 255), 140);

    hoverFont = createFont("Helvetica Neue", 14);
  }

  void draw() {
    stroke(255);

    colorMode(HSB);
    fill(markerColour);
    ellipse(x, y, markerSize, markerSize);
  }

  void hover() {
    float distance = dist(mouseX, mouseY, x, y); 
    if (distance < 5) {
      rectMode(CORNER);
      textFont(hoverFont);
      textAlign(LEFT, TOP);
      
      String s1 = "Track: " + songName + "  by " + theArtist;
      String s2 = "value: "+ parameterValue;
      
      fill(255);
      rect(min(mouseX, width - 220), mouseY + 20, 220, 80);
      fill(0);
      text(s1, min(mouseX, width - 220) + 5, mouseY + 25, 210, 60);
      text(s2, min(mouseX, width - 220) + 5, mouseY + 70, 210, 60);
    }
  }
}