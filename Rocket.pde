class Rocket{
  DNA dna;
  PVector loc;
  float recordDist;
  int geneC;
  PVector v;
  PVector acc;
  float fitness;
  boolean reached;  //Is the rocket in the target
  boolean stopped;  //Has the rocket hit any obstacles
  int finishTime;
  Rocket(float x, float y, DNA dn){
      loc = new PVector(x,y);
      v = new PVector();
      acc = new PVector();
      dna = dn;
      geneC =0;
      finishTime =0;
      recordDist = width;
      stopped = false;
      reached = false;
  }
  void obstacles(){
    for(Obstacles obs: obstacles){
       stopped = obs.contains(loc);
        if(stopped == true){
          break;
        }
    }
  }
  void checkTarget(){
    float d = dist(loc.x ,loc.y, target.x,target.y);
    if(d< recordDist){
      recordDist = d;
    }
    if(!reached){
      finishTime++;
    }
  }
  void calcFit(){
   fitness = (1/(finishTime*recordDist));
   fitness = pow(fitness,1);
    if(stopped){
      fitness *=0.01;
    }
    if(reached){
      fitness *= 2;
    }
  }
  void update(){
    v.add(acc);
     PVector dir = PVector.sub(target, loc);
     if(dir.mag() > 15 ){
      loc.add(v);
     }
     else{
       reached = true;
     }
     acc.mult(0);
  }
  void run(){
    if(!stopped){
      applyForce(dna.genes[geneC] );
      geneC = (geneC +1) % dna.genes.length;  //Just to make sure it doesn't go above lifetime
   
      update();
      checkTarget();
      obstacles();
    }
   display();
  }
  void applyForce( PVector force){
    acc.add(force);
  }
  void display(){
    rectMode(CENTER);
    
    fill(100);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate( v.heading() +PI/2);
    triangle(0,0, -5,20, 5,20   );
    popMatrix();
  }
}
