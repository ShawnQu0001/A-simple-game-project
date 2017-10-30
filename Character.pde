
class Character{
  // GLOBAL VARIABLES
  int hp, mp, defense, magicResist, attack, magic;
  int xPos, yPos;
  
  String name;
  color c1 = color(255,0,0);
  color c2 = color(0,0,255);
  //boolean isPlayer;
  // DEFAULT CONSTRUCTOR
  Character(){
    this.hp = 100;
    this.mp = 100;
    this.defense = 10;
    this.magicResist = 8;
    this.attack = 12;
    this.magic = 10;
    xPos = width/2;
    yPos = height - 80;
    //isPlayer = false;
  }
  
  Character(int hp, int mp, int defense, int magicResist, int attack, int magic){
    this.hp = hp;
    this.mp = mp;
    this.defense = defense;
    this.magicResist = magicResist;
    this.attack = attack;
    this.magic = magic;
  }
  
  void setHp(int hp){
    this.hp = hp;
  }
   void setMp(int mp){
    this.mp = mp;
  }
   void setDEF(int defense){
    this.defense = defense;
  }
   void setMR(int mr){
    this.magicResist = mr;
  }
   void setAttack(int attack){
    this.attack = attack;
  }
   void setMagic(int magic){
    this.magic = magic;
  }
  
   void setXPos(int xPos){
    this.xPos = xPos;
  }
  
  void setYPos(int yPos){
    this.yPos = yPos;
  } 
  
  int getXPos(){
   return this.xPos;
  }
  
  int getYPos(){
   return this.yPos;
  } 
  
  int getHP(){
    return this.hp;
  }
  void updateHP(int dmg) {
    this.hp = this.hp -dmg;
  }
}