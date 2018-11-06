
int theCount;
int volumeCue;


class ButtonA {
  private final int rectW = 300, rectH = 55;
  private int rectX, rectY;
  private String buttonString;
  private PFont mFont = createFont("Helvetica Neue", 50);
  private color buttonHighlight = color(80);
  private Boolean buttonShowing = false;
  
  ButtonA(String AString, int ix, int iy) {
    this.rectX = ix;
    this.rectY = iy;
    this.buttonString = AString;
    
  }


  void draw() {

    textFont(mFont);
    textAlign(CENTER, CENTER);
    //button highlight

    if (overButton()) {
      fill(buttonHighlight);
    } else {
      fill(0);
    }
    //draw button
    stroke(0);
    rect(rectX, rectY, rectW, rectH, 18, 18, 18, 18);  
    fill(150);
    text(buttonString, rectX+rectW/2, rectY+rectH/2-8);  
    
  }
  
  void buttonAClick(){
    if (overButton()&&buttonShowing) {
      if (this.buttonString =="Browse") {
        theCount = 1;
        
      } else if (this.buttonString == "HOME") {
        theCount = 0;
   
      } else if (this.buttonString=="Charts") {
        theCount = 2;

      }else if(this.buttonString=="Explore"){
        theCount = 3;

      } else if(this.buttonString=="Danceablity"){
        
      }
      else if(this.buttonString=="Valence"){
        
      }
      else if(this.buttonString=="Tempo"){
        
        
      }else if (this.buttonString=="Danceable") {

        chartType = "Danceable";
        chartIllstrate = chartDance;
        
      } else if (this.buttonString=="Fast") {

        chartType = "Fast";
        chartIllstrate = chartFast;
      } else if (this.buttonString=="Euphoric") {

        chartType = "Euphoric";
        chartIllstrate = chartEuphoric;
      } else if (this.buttonString=="LAST") {

        if (volumeCue>1) {
          volumeCue -= 1;
        }
      } else if (this.buttonString=="NEXT") {

        if ((volumeCue<60)&&(volumeCue>=1)) {
          volumeCue += 1;
        }
      } else if (this.buttonString=="By Volume") {
        browseCount = 1;

      } else if (this.buttonString=="By Year") {
        browseCount = 2;

      } else if (this.buttonString=="YEAR +") {

        if ((currentYear<2016)&&(currentYear>=1998)) {
          currentYear+=1;
        }
      } else if (this.buttonString=="YEAR -") {

        if (currentYear>1998) {
          currentYear-=1;
        }
      }
    }
  }

  

  boolean overButton() {
    return (mouseX >= rectX && mouseX <= rectX+rectW && 
      mouseY >= rectY && mouseY <= rectY+rectH);
  }
}