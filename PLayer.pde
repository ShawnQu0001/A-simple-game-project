class Player extends Character{
  
  int mutliplier = 1;
  
  // DEFAULT CONSTRUCT
  Player(){
    super();
    this.attack = 25;
    
  }
  
  void setMultiplier(int m){
    this.mutliplier = m;
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
  
  void display(){
    
    // Draw Player shape  
    pushMatrix();
    translate(xPos, yPos);
    fill(c2);
    //image(CImage, xPos, yPos ,CImage.width, CImage.height);
    popMatrix();
  
  }
  
  void displayHMp(){
     // Display Player's HP bar
    fill(1);
    textSize(26);
    
    text("HP", 10, 30);
    fill(0,255,0);
    rect(60,10,this.hp, 20);
    text(this.hp, 170, 20);
    fill(1);
    text("MP", 10, 60);
    fill(0, 0, 255);
    rect(60,40,this.mp, 20);
    text(this.mp, 170, 60);
  
  }
  
}