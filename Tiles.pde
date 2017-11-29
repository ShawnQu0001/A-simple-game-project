class Tiles{
  boolean passable, isOn;
  
  Tiles(){
    this.passable = true;
    this.isOn = false;
  }
  
  void setPassable(boolean flag){
    this.passable = flag;
  }
  
   void setIsOn(boolean flag){
    this.isOn = flag;
  }
  
  boolean getPassable(){
    return this.passable;
  }
  
  boolean getIsOn(){
    return this.isOn;
  }
}