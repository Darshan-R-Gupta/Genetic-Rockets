class DNA{
  PVector[] genes;
  float maxForce = 0.5;
  DNA(){
    genes = new PVector[lifetime];
    for(int i = 0; i < genes.length; ++i){
       genes[i] = PVector.random2D() ;
       genes[i].mult( random(maxForce) );
        
    }
  }
    
  DNA crossover(DNA parentB){
    int mid = int(random(genes.length) );
    DNA child = new DNA();
    for(int i =0 ; i < genes.length; ++i){
      if(i > mid){
        child.genes[i] = genes[i]; 
      }
      else{
        child.genes[i] = parentB.genes[i];
      }
    }
    return child;
  }
  void mutate(float mr){
    for(int i = 0; i< genes.length; ++i){
       float a = random(1);
       if(a < mr)
       {
         genes[i] = PVector.random2D();
         genes[i].mult(random(maxForce));
       }
    }
  }
  
}
