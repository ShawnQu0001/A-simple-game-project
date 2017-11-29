class Item{
  int restoValue;
  String name = "HP Potion";
  // DEFAULT CONSTRUCT
  Item(){
    this.restoValue = 20;
  }
  int getRestoValue(){
    return this.restoValue;
  }
}