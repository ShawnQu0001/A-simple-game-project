
class Tiles {

  final int CHASM      = 0;
  final int EMPTY      = 1;
  final int GRASS      = 2;
  final int EMPTY_WELL    = 3;
  final int WALL      = 4;
  final int DOOR      = 5;
  final int OPEN_DOOR    = 6;
  final int ENTRANCE    = 7;
  final int EXIT      = 8;
  final int EMBERS      = 9;
  final int LOCKED_DOOR    = 10;
  final int PEDESTAL    = 11;
  final int WALL_DECO    = 12;
  final int BARRICADE    = 13;
  final int EMPTY_SP    = 14;
  final int HIGH_GRASS    = 15;
  final int EMPTY_DECO    = 24;
  final int LOCKED_EXIT    = 25;
  final int UNLOCKED_EXIT  = 26;
  final int SIGN      = 29;
  final int WELL      = 34;
  final int STATUE      = 35;
  final int STATUE_SP    = 36;
  final int BOOKSHELF    = 41;
  final int ALCHEMY      = 42;
  final int CHASM_FLOOR    = 43;
  final int CHASM_FLOOR_SP  = 44;
  final int CHASM_WALL    = 45;
  final int CHASM_WATER    = 46;
  
  final int SECRET_DOOR        = 16;
  final int TOXIC_TRAP        = 17;
  final int SECRET_TOXIC_TRAP    = 18;
  final int FIRE_TRAP        = 19;
  final int SECRET_FIRE_TRAP    = 20;
  final int PARALYTIC_TRAP      = 21;
  final int SECRET_PARALYTIC_TRAP  = 22;
  final int INACTIVE_TRAP      = 23;
  final int POISON_TRAP        = 27;
  final int SECRET_POISON_TRAP    = 28;
  final int ALARM_TRAP        = 30;
  final int SECRET_ALARM_TRAP    = 31;
  final int LIGHTNING_TRAP      = 32;
  final int SECRET_LIGHTNING_TRAP  = 33;
  final int GRIPPING_TRAP      = 37;
  final int SECRET_GRIPPING_TRAP  = 38;
  final int SUMMONING_TRAP      = 39;
  final int SECRET_SUMMONING_TRAP  = 40;
  
  final int WATER_TILES  = 48;
  final int WATER    = 63;
  
  final int PASSABLE    = 0x01;
  final int LOS_BLOCKING  = 0x02;
  final int FLAMABLE    = 0x04;
  final int SECRET      = 0x08;
  final int SOLID      = 0x10;
  final int AVOID      = 0x20;
  final int LIQUID      = 0x40;
  final int PIT        = 0x80;
  
  final int UNSTITCHABLE  = 0x100; 
  boolean passable = true;
  boolean isEnemyOn = false;
  int tileNumber;
  int enemyIndex;
 
  
  Tiles(){
     this.tileNumber = 4; // Default Wall
     checkPassbale(this.tileNumber);
  }
  
  Tiles( int number){
    this.tileNumber = number;
    checkPassbale(this.tileNumber);
  }
  
  
  void checkPassbale(int tileNumber){
    if (tileNumber == 3 || tileNumber == 5 
      || tileNumber == 10 || tileNumber ==  12 
      || tileNumber == 13 || tileNumber == 16 || 
      tileNumber == 25 || tileNumber == 29 || tileNumber == 34){
        
        this.passable = false;
        this.isEnemyOn = false;
      }
    else{
      if(!isEnemyOn){
        this.passable = true;
      }
    }
  }
  void putEnemyOn(int index){
    this.isEnemyOn = true;
    this.enemyIndex = index;
  }
  
  int getEnemyIndex(){
    return this.enemyIndex;
  }
  
  void removeEnemy(){
    this.isEnemyOn = false;
  }
  
  void updatePassable(boolean flag){
    this.passable = flag;
  }
}