void showNumber(){
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
  
  textSize(30);
  fill(#ed91e4);
  text("Recover="+countRecover,50,simHeight+50);
  fill(#6399db);
  text("Healthy="+countHealthy,50,simHeight+100);
  fill(#e39520);
  text("Sick="+countSick,50,simHeight+150);
  
}
