int buttonCY;
int buttonCX;
String trackNameOnButton;
class ButtonC{
  
  private final int rectW = 400, rectH = 30;
  private int rectX, rectY;
  private String buttonString;
  private color buttonHighlight = color(100);
  
  ButtonC(String CString, int rectX, int rectY){
    this.buttonString = CString;
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
  //show track informations
      trackNameOnButton = this.buttonString;
    }
    
  }
  
  boolean overButton() {
    return (mouseX >= rectX && mouseX <= rectX+rectW && 
      mouseY >= rectY && mouseY <= rectY+rectH);
  }


}
  