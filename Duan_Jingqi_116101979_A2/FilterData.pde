import java.util.Date;

private static final float DELTA = 0.05;  // how much to add/subtract when we change the limits

class FilterData {
  private float minMag, maxMag;
  private float x, y;
  private PFont mFont;
  private PImage upButton, downButton;
  private float textHeight;

  FilterData(float ix, float iy) {
    setRange(0, 1);

    this.x = ix;
    this.y = iy;
    
    this.upButton = loadImage("up.png");
    this.downButton = loadImage("down.png");
    mFont = createFont("Helvetica Neue", 14);
  }

  void setRange(float minRange, float maxRange) {
    this.minMag = minRange;
    this.maxMag = maxRange;
   
  }
    
  boolean inRange(float v) {
    boolean ok = (v>= this.minMag) && (v < this.maxMag);
    

    return ok;
  }

  void draw() {
    textFont(mFont);
    textAlign(CENTER, CENTER);

    textHeight = textAscent() + textDescent();                             
    String displayRange = nf(minMag, 2, 2) + "      " + nf(maxMag, 2, 2);
    
    fill(255);
    rect(x,y,upButton.width*2,upButton.height*2 + textHeight);
    image(upButton,x,y);
    image(downButton,x,y+upButton.height+ textHeight);
    fill(0);
    text(displayRange,x + upButton.width, y + upButton.height + textHeight/2);
    
  }


  void modifyRange() {
    if (mouseInRectangle(x,y,upButton.width,upButton.height)){
      this.minMag += DELTA;
      this.minMag = min(this.minMag, this.maxMag);  
    }
    if(mouseInRectangle(x,y+upButton.height+textHeight,upButton.width,upButton.height)){
      this.minMag -= DELTA;
      this.minMag = max(0,this.minMag);
    }

  }

 
  boolean mouseInRectangle(float x, float y, float w, float h) {
    return ((mouseX >= x) && (mouseX < x + w) && (mouseY >= y) && (mouseY < y + h));
  }
}