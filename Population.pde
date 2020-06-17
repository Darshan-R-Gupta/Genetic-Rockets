class Population{
  float mutationRate;
  Rocket[] population;
  ArrayList<Rocket> matingPool;
  Population(float mr, int size){
    population = new Rocket[size];
    mutationRate = mr;
    matingPool = new ArrayList<Rocket> ();
    for(int i = 0; i < population.length; ++i){
      population[i] = new Rocket(width/2, height-100, new DNA() );
    }
  }
  
  
  void fitness(){
    for(int i = 0; i< population.length; ++i){
      population[i].calcFit();
    }
  }
  void decide_pool(){
    matingPool = new ArrayList<Rocket>();
    //Deciding the mating Pool
    for(int i = 0;i < population.length; ++i){
        float fit = population[i].fitness*100000;
        int n= int(fit*100);
        for(int j = 0; j <= n; ++j){
          matingPool.add(population[i] );
        }
     }
     
  }
  Rocket selection(){    
    //Actual Selection
    int p=0;
    p = int(random(matingPool.size() ) );
    return matingPool.get(p);
  
  }
  
  void reproduction(){
     for(int i =0; i< population.length; ++i){
       Rocket p1,p2;
       do{
           p1 =selection();
           p2 = selection();
       }while(p1 == p2);
        DNA child = p1.dna.crossover(p2.dna);
         
       child.mutate(mutationRate);
         population[i] = new Rocket(width/2, height-100,child);
       }
     
  }
  
  void live(){
    for(int i = 0; i < population.length ;++i){
      population[i].run();
      
    }
  }
}
