float timeInterval; 
float timePast;
boolean gameState = true;
boolean fightingState = false;
int textAlpha = 100;
int textFade = 2;
PImage bgImg1, bgImg2,CImg,NImg;
Player p1 = new Player();
ArrayList npcList = new ArrayList<NPC>();
int numberOfNPC = 5;

final int N_SPRITES_X = 16;
final int N_SPRITES_Y = 4;
final int TOTAL_SPRITES = N_SPRITES_X * N_SPRITES_Y; //
PImage [] my_sprites;
PImage my_sprite_sheet;
int my_sprite_width;
int my_sprite_height;
ArrayList tileList = new ArrayList<Tiles>();
int HT = 12; // number of Horozontal tiles
int VT = 15; // number of verticle tiles
boolean isLevelCleaned = false;
int level = 1;

//Character initial position variables
int x = 832;
int y = 640;
int stepSize = 16;
float speed = 2.0;

// Master Varibales
int w = 64; // Boundary thickness
int thNpc; // Which npc is fighting with player
int dmg; // Damge is the difference between attack and Dense value
Item hpPotion;
NPC p;


void setup(){
  size(960, 768);
  timePast = millis();
  timeInterval = 2000.0f;
  //bgImg1  = loadImage("bgImg1.png"); 
  bgImg2  = loadImage("bgImg2.png"); // 
  CImg  = loadImage("01.png"); //Character Image
  NImg =  loadImage("sword_dude.png");
  hpPotion = new Item();
  // Populate 5 new NPCs for the game
  for(int i = 0; i < 5;  i++){
   npcList.add(new NPC());
  }
  
  my_sprites = new PImage[TOTAL_SPRITES];
  
  // load sprite sheet
  my_sprite_sheet = loadImage("s2.png");
  my_sprite_width = my_sprite_sheet.width / N_SPRITES_X;
  my_sprite_height = my_sprite_sheet.height / N_SPRITES_Y;
  
  // Store the tiles into the image array
  int index = 0;
  for(int y = 0; y <N_SPRITES_Y; y++){
    for(int x =0; x < N_SPRITES_X; x++){
        my_sprites[index] = my_sprite_sheet.get(x * 64, 
          y * 64, 64, 64);
      index++;
    }
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
   if (x < w){ // Check left boundary
     x = w;
   }
   if (y > 764 - w - 64){ // check bottom boundary
     y = 764 - w - 64;
   }
   if (x > 960 - w - 64){ // check right boundary
     x = 960 - w - 64;
   }
   if (y < w){ // check top boundary
     y = w;
   }
   
  if(gameState){
    background(1);
    textSize(40);
    fill(255,255,255,textAlpha);
    text("Roug", width/4,height/4);
  
    textFade();
    textSize(26);
    fill(255,255,255,textAlpha);
    text("Click anywhere to start the Game", width/4,height/2);
  }
  else if(!gameState && !fightingState){
    // Display game background1
    //----------------------------------------- Load game map/level 1 here
    displayMap(level);// load the first level of the game.
    checkIfLevelCleaned();
    fill(0);
    textSize(16);
    
    // Display player's Character 
    p1.setXPos(x);
    p1.setYPos(y);
    image(CImg, x, y ,CImg.width, CImg.height);
    //p1.display();
    
    // Move Player's character with arrow keys
    if ((keyPressed == true) && (key == CODED)) {
      if (keyCode == UP) { 
        y -= stepSize;
      } else if (keyCode == DOWN) { 
        y += stepSize;
      } else if (keyCode == LEFT) { 
        x -= stepSize;
      } else if (keyCode == RIGHT) {
        x += stepSize;
      }
    }
    
    // Display NPCs
    for (int i = 0; i < 5; i++)
    {
     NPC p = (NPC) npcList.get(i);
     if (p.getHP()>0){
       p.setXPos(80 + i * 150);
       p.setYPos(100 + i * 80);
       //p.display();
        image(NImg, p.getXPos(), p.getYPos(),NImg.width, NImg.height);
     }
    }
    // Check if player is on top of the NPC
    for (int i = 0; i < 5; i ++){
      NPC p = (NPC) npcList.get(i);
      int pXPos = p.getXPos();
      int pYPos = p.getYPos();
      
      if ( x > pXPos && x < pXPos + 50 && y > pYPos && y < pYPos + 80 ){
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

    image(CImg, 0, 421 ,CImg.width, CImg.height);
    //p1.display();
    p1.displayHMp();
    
    // Display NPC in fighting stage
    p = (NPC) npcList.get(thNpc);
    p.setXPos(740);
    p.setYPos(421);

    image(NImg, p.getXPos(), p.getYPos(),NImg.width, NImg.height);
    p.displayHMp();
    
    // Display Stautes table under the fighting background
    line(0,501,800,501);
    line(300, 501,300,700);
    line(500, 501,500,700);
    line(0, 700,800,700);
    textSize(46);
    text("VS", 380, 581);


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
   
         numberOfNPC --;
    }
    if(p1.getHP() <=0 ){
         fill(255,0,0);
         textSize(60);
         text("Game Over", 200, 400);
         text("Click R to Restart.", 200,470);
         //p1.setHp(100);
         
    }
   
  }
}

void mousePressed(){
 background(255,255,255);
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



void displayMap(int level){
  /**
  *  Create level 1 Map here. Will load image into each tiles.
  */
  if(level == 1){
    int index = 0;
    for(int i = 0; i < HT; i ++){
      for(int j = 0; j < VT; j++){
        image(my_sprites[4], j* 64, i * 64);
         tileList.add(new Tiles());
         //tileList[index].setPassable(false);
         Tiles t= (Tiles) tileList.get(index);
      
       if(i == 0 || j == 0 || j == VT - 1 || i == HT - 1|| j == (VT - 1)/2 || i == HT/2){  // Load wall tiles
        
         if((i == HT/2 + 1 && j == (VT-1)/2) || (i == HT/4 + 1 && j == VT / 2 ) || (i == 6 && j == 2)){ // add door.
           image(my_sprites[6], j* 64, i * 64);
           t.setPassable(true);
         }
       }
       else if( i == 1 && j == HT + 1){ // Entrance to next level
            image(my_sprites[8], j* 64, i * 64);
            t.setPassable(true);
            if(isLevelCleaned){
              level ++;
            }
       }
       else{
         //tiles[index] = new Tiles(1);// 
         image(my_sprites[1], j * 64, i * 64);
         t.setPassable(false);
       }
       // Need map design pattern here to randomly generate tiles.
       // Otherwise, we have to manually create each map.
        index++;
     }   
    } 
  }
 }
 
 void checkIfLevelCleaned(){
   if (numberOfNPC == 0){
     isLevelCleaned = true;
   }
 }
