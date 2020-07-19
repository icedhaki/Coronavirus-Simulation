int [] Pick_Social(int num_ppl, int percent){
  int [] list_not_soc_dist=new int[int((num_ppl*percent)/100)];
  
  for(int s=0;s<list_not_soc_dist.length;s++){
    int pick=(int)random(num_ppl);
    boolean pick_again=false;
    
    for(int i=s;i>=0;i--){
      if(pick==list_not_soc_dist[i]){
        pick_again=true;
      }
    }
    
    if(pick_again){
      s--;
    } else{
      list_not_soc_dist[s]=pick;
    }
  }
    return list_not_soc_dist;
}
