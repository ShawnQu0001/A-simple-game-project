final int N_SPRITES_X = 16;
final int N_SPRITES_Y = 4;
final int TOTAL_SPRITES = N_SPRITES_X * N_SPRITES_Y; //16


int current_sprite = 0;
int speed_x = 3;
int posi_x = 0;
int posi_y = 200;
int HT = 12; // number of Horozontal tiles
int VT = 15; // number of verticle tiles
PImage [] my_sprites;
Tiles [] tiles;

void settings(){
  size(800, 600, P3D);
}

void setup(){
  my_sprites = new PImage[TOTAL_SPRITES];
  
  // load sprite sheet
  PImage my_sprite_sheet = loadImage("s2.png");
  
  int my_sprite_width = my_sprite_sheet.width / N_SPRITES_X;
  int my_sprite_height = my_sprite_sheet.height / N_SPRITES_Y;
  
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

void draw(){
  background(100,50,200);
  //move_the_sprite();
  display_the_sprite();
  
  frameRate(15);
}

void move_the_sprite(){
  current_sprite++;
  current_sprite %= TOTAL_SPRITES;
  
  //posi_x = (posi_x < width ) ? posi_x += speed_x : 0;
}

void display_the_sprite(){
  /**
  *  Create Map here. Will load image into each tiles.
  */
  int index = 0;
  for(int i = 0; i < HT; i ++){
    for(int j = 0; j < VT; j++){
       if(i == 0 || j == 0 || i == HT || j == VT){  // Load wall tiles
         //tiles[index] = new Tiles(4); //default constructor
         image(my_sprites[4], j* 64, i * 64);
       }
       else{
         //tiles[index] = new Tiles(1);// 
         image(my_sprites[1], j * 64, i * 64);
       }
       // Need map design pattern here to randomly generate tiles.
       // Otherwise, we have to manually create each map.
        index++;
     }
     
    }
  }
  
  
  // Display the original spritesheet
 /** int index = 0;
  for(int i = 0; i < N_SPRITES_Y; i++){
    for(int j = 0; j < N_SPRITES_X; j++){
      if(index < my_sprites.length - 1){
       image(my_sprites[index], j * 64, i * 64);
       index ++;
      }
    }
  }
  */
  /**
  pushMatrix();
  translate(posi_x,posi_y,0);
  image(my_sprites[current_sprite],0,0);
  popMatrix();
  
  pushMatrix();
  translate(0, posi_y + 1, 0);
  stroke(255);
  line(0, my_sprites[current_sprite].height,width,my_sprites[current_sprite].height);
  popMatrix();
  */