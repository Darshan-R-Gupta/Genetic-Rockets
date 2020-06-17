int lifetime;
int lifeC;
PVector target;
ArrayList<Obstacles> obstacles;
float mutationRate = 0.01;
int gen = 0;
int pSize = 300;
int flag =0;
int num_touched =0;  //The number of rockets which touched the target; 
Population population;
void setup(){
  fullScreen();
  obstacles = new ArrayList<Obstacles>();
  lifetime = 200;
  lifeC = 0;
  target= new PVector(width/2 + 300, height/4 - 100);
  population = new Population(mutationRate, pSize);
  background(255);
  fill(0);
  textSize(45);
  obstacles.add(new Obstacles(10,height/2+ 100)   );
  obstacles.add(new Obstacles(width-500, height/2- 200)  );
}
void draw(){

  if(lifeC < lifetime){
    
       background(255);  

    population.live();
      lifeC++;
      text("Lifetime left: " + (lifetime -lifeC) , 20, 80);
  }
  else{
    num_touched =0;
     for(int i =0; i < population.population.length; ++i){
      if(population.population[i].reached){
          num_touched++;
      }
     }
    text(num_touched + " rockets touched" , 20,120);

   // if(keyPressed){
      gen++;
      lifeC =0;
      
      population.fitness();
      population.decide_pool();
      population.reproduction();
      num_touched = 0;
    //}
  }
   for(Obstacles obs : obstacles){
     obs.display();
   }
   
  ellipse(target.x, target.y , 50,50);
 text("Generations: " + gen, 20, 40);
    
}
