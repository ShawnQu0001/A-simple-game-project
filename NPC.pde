class NPC extends Character{
   int mutliplier = 1;
  // DEFAULT CONSTRUCT
  NPC(){
    super();
  }
  
 
  void setMultiplier(int m){
    this.mutliplier = m;
  } 
  void setXPos(int xPos){
    this.xPos = xPos;
  }
  
  void setYPos(int yPos){
    this.yPos = yPos;
  } 
  
  int getXPos(){
   return this.xPos ;
  }
  
  int getYPos(){
   return this.yPos;
  } 
  
  
  void display(){
    
    pushMatrix();
    translate(xPos, yPos);
    fill(c1);
    ellipse(30,30,20 * mutliplier, 20 * mutliplier);
    line(30,40,30 * mutliplier, 60 * mutliplier);
    line(20,50,30 * mutliplier, 50 * mutliplier);
    line(30,50,40 * mutliplier, 50 * mutliplier);
    line(30,60,20 * mutliplier, 70 * mutliplier);
    line(30,60,40 * mutliplier, 70 * mutliplier);
    popMatrix();
  }
  
  int getAttack(){
    return this.attack;
  }
  int getDefense(){
    return this.defense;
  }
  int getMagic(){
    return this.magic;
  }
  int getMagicResist(){
    return this.magicResist;
  }
  
  void displayHMp(){
     // Display Player's HP bar
    fill(1);
    textSize(26);
    
    text("HP", 740, 30);
    fill(0,255,0);
    rect(620,10,this.hp, 20);
    text(this.hp, 570, 20);
    fill(1);
    text("MP", 740, 60);
    fill(0, 0, 255);
    rect(620,40,this.mp, 20);
    text(this.mp, 570, 60);
  
  }
  
}