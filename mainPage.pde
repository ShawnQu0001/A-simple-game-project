float timeInterval; 
float timePast;
boolean gameState = true;
boolean fightingState = false;
int textAlpha = 100;
int textFade = 2;
PImage bgImg1, bgImg2;
Player p1 = new Player();
ArrayList npcList = new ArrayList<NPC>();

//Character variables
int x = 400;
int y = 726;
float speed = 2.0;

// Master Varibales
int w = 40; // Boundary thickness
int thNpc; // Which npc is fighting with player
int dmg; // Damge is the difference between attack and Dense value
Item hpPotion;
NPC p;



void setup(){
  size(800, 806);
  timePast = millis();
  timeInterval = 2000.0f;
  bgImg1  = loadImage("bgImg1.png");
  bgImg2  = loadImage("bgImg2.png");
  hpPotion = new Item();
  // Populate 5 new NPCs for the game
  for(int i = 0; i < 5;  i++){
   npcList.add(new NPC());
  }
}

// The text on screen will fade after 2secs
void textFade(){
  if(millis() > timeInterval + timePast)
  {
    timePast = millis();
    textFade *= -1;
    
  }
  textAlpha += textFade;
}

void draw(){
  
  frameRate(60);
   // Stop Player from walking through boundaries
   if (x < w + 15){ // Check left boundary
     x = w + 15;
   }
   if (y > height - w - 15){ // check bottom boundary
     y = height - w - 60;
   }
   if (x > width - w - 15){ // check right boundary
     x = width - w - 15;
   }
   if (y < w + 15){ // check top boundary
     y = w + 15;
   }
   
   
   
  
  if(gameState){
    background(1);
    textSize(40);
    fill(255,255,255,textAlpha);
    text("A Simple Game", width/4,height/4);
  
    textFade();
    textSize(26);
    fill(255,255,255,textAlpha);
    text("Click anywhere to start the Game", width/4,height/2);
  }
  else if(!gameState && !fightingState){
    // Display game background1
    // Image size is 800 * 806
    image(bgImg1, 0, 0 ,bgImg1.width, bgImg1.height);
    
    // Display player's Character 
    p1.setXPos(x);
    p1.setYPos(y);
    p1.display();
    
    // Move Player's character with arrow keys
    if ((keyPressed == true) && (key == CODED)) {
      if (keyCode == UP) { 
        y -= speed;
      } else if (keyCode == DOWN) { 
        y += speed;
      } else if (keyCode == LEFT) { 
        x -= speed;
      } else if (keyCode == RIGHT) {
        x += speed;
      }
    }
    
    // Display NPCs
    for (int i = 0; i < 5; i++)
    {
     NPC p = (NPC) npcList.get(i);
     if (p.getHP()>0){
       p.setXPos(80 + i * 150);
       p.setYPos(100 + i * 80);
       p.display();
     }
    }
    // Check if player is on top of the NPC
    for (int i = 0; i < 5; i ++){
      NPC p = (NPC) npcList.get(i);
      int pXPos = p.getXPos();
      int pYPos = p.getYPos();
      
      if ( x > pXPos && x < pXPos + 30 && y > pYPos && y < pYPos + 80 ){
        // fighting stage is on if true.
        thNpc = i;
        fightingState = true;
      }
    
    }
  }
  else if(fightingState){ // Actuall fighting is here
    // Image size is 800 * 501 
    background(255,255,255);
    frameRate(20);
    //load fighting background
    image(bgImg2, 0, 0 ,bgImg2.width, bgImg2.height);
    
    // Display Player in fighting stage
    p1.setXPos(0);
    p1.setYPos(421);
   // p1.setMultiplier(5);
    p1.display();
    p1.displayHMp();
    
    // Display NPC in fighting stage
    p = (NPC) npcList.get(thNpc);
    p.setXPos(740);
    p.setYPos(421);
    //p.setMultiplier(5);
    p.display();
    p.displayHMp();
    
    // Display Stautes table under the fighting background
    line(0,501,800,501);
    line(300, 501,300,700);
    line(500, 501,500,700);
    line(0, 700,800,700);
    textSize(46);
    text("VS", 380, 581);
    textSize(26);
    text("Press A to attack", 21, 750);
    text("Press I to use HP potion", 21, 780);
    
    
    
    
    textSize(26);
    // Player's stautes
    text("Attack " + p1.getAttack(), 10, 551);
    text("Defense " + p1.getDefense(), 10, 591);
    text("Magic " + p1.getMagic(), 10, 631);
    text("Magic Resist " + p1.getMagicResist(), 10, 671);
    
    // NPC's statutes
    text("Attack " + p.getAttack(), 510, 551);
    text("Defense " + p.getDefense(), 510, 591);
    text("Magic " + p.getMagic(), 510, 631);
    text("Magic Resist " + p.getMagicResist(), 510, 671);
    
    if(p.getHP() <=0 ){
         fill(255,0,0);
         textSize(60);
         text("Win", 200, 400);
         text("Click Q to quit.", 200,470);
         // npcList.remove(thNpc);
    }
    if(p1.getHP() <=0 ){
         fill(255,0,0);
         textSize(60);
         text("Game Over", 200, 400);
         text("Click R to Restart.", 200,470);
         //p1.setHp(100);
         // npcList.remove(thNpc);
    }
   
  }
}

void mousePressed(){
 background(0);
 gameState = false;
}

void keyPressed(){
  int dmg;
  //int round = 1;
  if(key == 'a'){ // Player attack
    if( p.getHP() > 0 ){
       dmg = p1.getAttack() - p.getDefense();
       if(p.getHP() >= dmg){
         p.updateHP(dmg);
       }
       else{
         p.setHp(0);
       }
     if(p1.getHP()>0){
       dmg = p.getAttack() - p1.getDefense();
       p1.updateHP(dmg);
     }else{
       p1.setHp(0);
     }
    }
  
  }
  if (key == 'i'){
    if(p1.getHP()+ hpPotion.getRestoValue() <= 100){
      p1.updateHP( -hpPotion.getRestoValue());
    }
    else{
      p1.setHp(100);
    }
  }
  
  if (key == 'q'){
    //npcList.remove(thNpc);
    fightingState = false;
    gameState = false;
    x = x - 50;
    y = y - 100;
  }
  
  if (key == 'r'){ // game will reset
    //npcList.remove(thNpc);
    p1.setHp(100);
    for (int i = 0; i < 5; i++){
      NPC p = (NPC) npcList.get(i);
      p.setHp(100);
    }
    x = 400;
    y = 720;
  }
}