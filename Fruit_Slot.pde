class FruitSlot{
  
  PImage fruitLine;
  int [] spots={-360,-160,40,240,440}; // Fruit locations
  int fX; // Fruit x value
  int fY=-360; // Fruit y value
  int curPlace; // Which slot is being used
  int counter; // Stopping time for specific slot
  int curSpot; // Current fruit coordinates
  int curFruit; // 1=grape 2=orange 3=watermelon 4=banana 5=cherry
  int speedVar=0; // Used to find when to switch to a new fruit in slot

FruitSlot(PImage fl, int fx,int place){
  this.fruitLine=fl;
  this.fX=fx;
  this.curPlace=place; 
  if(this.curPlace==1)
    this.counter=500;
  if(this.curPlace==2) 
    this.counter=950;
  if(this.curPlace==3)
    this.counter=1300;
   fY=spots[int(random(0,numFruits))]; // Random fruit displayed at start
}

void drawfruitLine(){
  this.speedVar++;
  image(this.fruitLine, this.fX,this.fY);
  if(spin){ //If spinning
  if(count<this.counter){ // Spin till time runs out
    if(this.speedVar%curSpeed==0){ // Controls fruit switching speed
      this.curSpot=spots[int(random(0,numFruits))]; // Random fruit switch
      this.fY=this.curSpot;
      
      // Checks which fruit
      if(curSpot==-360)
        curFruit=1;
      if(curSpot==-160)
        curFruit=2;
      if(curSpot==40)
        curFruit=3;
      if(curSpot==240)
        curFruit=4;
      if(curSpot==440)
        curFruit=5;
    }
  }
  // Stop spinning
  if(count>1300) 
    spin=!spin;
  }
}

// Checks payout depending on matching slots
void checkWinnings(FruitSlot a, FruitSlot b){
  if(this.curFruit==a.curFruit && this.curFruit==b.curFruit) // All 3 slots are the same
    u1.winnings+=u1.bet*4;
    
  else if(this.curFruit==a.curFruit || this.curFruit==b.curFruit || a.curFruit==b.curFruit) // Only 2 slots are the same
    u1.winnings+=u1.bet*1.25;
    
  else //All 3 slots are different
    u1.winnings-=u1.bet;
    
  u1.total+=u1.winnings;
}

}
