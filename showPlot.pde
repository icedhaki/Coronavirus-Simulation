void showPlot(){
  int countHealthy=0;
  int countSick=0;
  int countRecover=0;
    
  for(Person p:list_p){
   if(p.state=='h'){
     countHealthy++;
   }
   else if(p.state=='s'){
     countSick++;
   }
   else{
     countRecover++;
   }
  }
  
  numSick=append(numSick,countSick);
  numHealthy=append(numHealthy, countHealthy);
  numRecover=append(numRecover, countRecover);
  
  int plotHeight=height-simHeight;
  for(int r=0;r<numSick.length;r++){
    int rectHeight=(int)map(numSick[r], 0,list_p.length,0,plotHeight);
    stroke(#e39520);
    rect(plotWidth+r,height-rectHeight,1,rectHeight);
    
    int rectHeightHealthy=(int)map(numHealthy[r], 0,list_p.length,0,plotHeight);
    stroke(#6399db);
    rect(plotWidth+r,simHeight,1,rectHeightHealthy);
    
    int rectHeightRecover=(int)map(numRecover[r], 0,list_p.length,0,plotHeight);
    stroke(#ed91e4);
    rect(plotWidth+r,simHeight+rectHeightHealthy,1,rectHeightRecover);
  }
  
  if(countSick==0){
    stroke(255);
    fill(255);
    rect(0,0,width,simHeight);
    textSize(30);
    textSize(30);
    if(factor==1.7){
      fill(0);
      text("Since social distancing is the lowest, it means that more people are in contact with each other. Therefore, there is higher chance that people will transfer virus, which leads to higher rate of spread of the virus among population.",width/4,height/8,800,300);
    }
    else{
      fill(0);
      text("Since social distancing is the highest, it means that less people are in contact with each other. Therefore, there is lower chance that people will transfer virus, which leads to lower rate of spread of the virus among population.",width/4,height/8,800,300);     
    }
    noLoop();
  }
}
