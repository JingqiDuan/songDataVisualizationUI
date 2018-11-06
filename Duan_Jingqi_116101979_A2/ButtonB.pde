String releaseDateOnButton; // this is the cue for next action
int buttonBY;
int currentYear;
class ButtonB{
  
  private final int rectW = 200, rectH = 50;
  private int rectX, rectY;
  private String buttonString;
  private color buttonHighlight = color(100);
  
  ButtonB(String BString, int rectX, int rectY){
    this.buttonString = BString;
    this.rectX = rectX;
    this.rectY = rectY;   
  }
  
  void draw() {
    textFont(dataFont);
    textAlign(CENTER, CENTER);
//button highlight
    
    if(overButton()){
      fill(buttonHighlight);
    }else {
      fill(0);
    }
    //draw button
    stroke(0);
    rect(rectX, rectY, rectW, rectH, 18, 18, 18, 18);  
    fill(150);
    text(buttonString, rectX+rectW/2, rectY+rectH/2);


    //what happen after clicking the button
      if (overButton() && mousePressed) {
        //get value form button after clicking
      releaseDateOnButton = this.buttonString;
      
      
    }
    
    
    
  }
  
  boolean overButton() {
    return (mouseX >= rectX && mouseX <= rectX+rectW && 
      mouseY >= rectY && mouseY <= rectY+rectH);
  }


}
  