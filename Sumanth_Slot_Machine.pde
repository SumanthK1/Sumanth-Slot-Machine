// Importing GUI
import g4p_controls.*;

// Setting images for the fruit line, 3 wallpapers and default slot machine wallpaper
PImage fruitLine;
PImage wallpaper1;
PImage wallpaper2;
PImage wallpaper3;
PImage curSM;

// Setting 3 Fruit Slots on slot machine
FruitSlot fS1;
FruitSlot fS2;
FruitSlot fS3;

// Setting User u1 from User class
User u1;

boolean spin=false; // Boolean to start spinning
boolean start=false; // Boolean that confirms user starting amount and allows spinner to be spun

int numFruits=5; // Fruits in the vertical line (0,4)
int count=0; // Timer to stop spinning
int curSpeed=1; // Spinner speed picked on gui
int init=0; // Letting user choose total value in gui and not being able to change it until the game is restarted


// Setup
void setup(){
  size(1600,1000);
  frameRate(75);
  createGUI();
 
  // Loading images
  fruitLine=loadImage("fruits.png");
  wallpaper1=loadImage("wallpaper1.png");
  wallpaper2=loadImage("wallpaper2.png");
  wallpaper3=loadImage("wallpaper3.png");
  curSM=loadImage("wallpaper1.png");
  
  // Creating area for slots on screen and new user
  fS1=new FruitSlot(fruitLine,700,1);
  fS2=new FruitSlot(fruitLine,1023,2);
  fS3=new FruitSlot(fruitLine,377,3);
  u1=new User(0);
}
void draw(){
  
  // Countdown to 1300
  count+=5;
  
  // Drawing fruit slots
  fS1.drawfruitLine();
  fS2.drawfruitLine();
  fS3.drawfruitLine();
  image(curSM,0,0); // Default wallpaper
  u1.drawTotal(); // User total
  u1.drawBet(); // User current bet
  u1.drawWinnings(); // User winnings
  if(count==1300) //Check winnings after the spinning has finished
    fS1.checkWinnings(fS2,fS3);
}
