class Obstacles{
  PVector loc;
  float w,h;
  Obstacles(float x, float y){
    loc = new PVector(x,y);
    w  = width-800;
    h = 50;
  }
  boolean contains(PVector r){
    if(r.x > loc.x && r.x < loc.x + w && r.y > loc.y && r.y < loc.y + h){
      return true;
    }
    else{
      return false;
    } 
  }
  void display(){
    rectMode(CORNER);
    fill(0);
    rect(loc.x,loc.y, w,h);
  }
  
}
