class User{
  
  int bet=0;
  int total=0;
  int winnings=0;

User(int t){
  this.total=t;
  }

// Drawing user total on screen
void drawTotal(){
  textSize(27); 
  text("$"+str(this.total),1100,818);
  }

// Drawing user bet on screen
void drawBet(){
  textSize(27);
  text("$"+str(this.bet),350,818);
  }

// Drawing user winnings on screen
void drawWinnings(){
  textSize(27);
  if(this.winnings>0)
    text("+"+str(this.winnings),670,818); // Money gain
  else
    text(str(this.winnings),670,818); // Money loss
  }
}
