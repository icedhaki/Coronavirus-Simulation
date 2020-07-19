Person[] list_p;
float factor;
float x;
float y;
float dirX;
float dirY;
int diameter=20;

char state='h';
int gap=80;
int percent=90;
int percentInf=1;
int simHeight=600;
int plotWidth=300;

int[] numSick=new int[0];
int[] numHealthy=new int[0];
int[] numRecover=new int[0];

int check=0;
int something;
int num;

void setup(){
    size(1800,900); 
  
  
  list_p=new Person[(width/gap)*(simHeight/gap)];
  for(int x=0;x<width/gap;x++){
    for(int y=0;y<simHeight/gap;y++){
      list_p[x+y*(width/gap)]=new Person(1,'h',x*gap+diameter/2+5,y*gap+diameter/2+5);
    }
  }
  list_p[int(random(0,list_p.length))].state='s';
  
  int[] list_not_soc_dist=new int[int((list_p.length*percent)/100)];
  list_not_soc_dist=Pick_Social(list_p.length, percent);

  for(int i:list_not_soc_dist){
    list_p[i].socialDistance=0;
  }

  int[] list_sick=new int[int((list_p.length*percentInf)/100)];
  list_sick=Pick_Social(list_p.length, percentInf);

  for(int i:list_sick){
    list_p[i].state='s';
  }
}

void draw(){
  background(255);
  startPage();
  if(num==1){
      background(255);

    for(int i=0;i<list_p.length;i++){
      list_p[i].displayPerson();
      list_p[i].movePerson();
      list_p[i].bounceEdges();
  
     
      for(int j=0;j<list_p.length;j++){
        if(i!=j){
          list_p[i].bouncePeople(list_p[j]);
        }
      }
    }
    fill(255);
    rect(0,simHeight,width,height-simHeight);
    showNumber();
    showPlot();
    
    strokeWeight(2);
    stroke(0);
    line(0,simHeight,width, simHeight);
    line(plotWidth,simHeight,plotWidth, height);
  }
  
}

void startPage(){
  fill(255);
  rect(width/7,height/2,500,200);
  rect(width/1.7,height/2,500,200);
  fill(0);
  textSize(60);
  text("Outbreak simulation",width/3,height/8);
  text("Khaknazar Shyntassov",width/3,height/1.1);
  text("Rapid increase",width/6,height/1.6);
  text("Flat curve", width/1.55,height/1.6);

  if(mousePressed){
    if(mouseX>=width/7 && mouseX<=width/7+500 && mouseY>=height/2 && mouseY<=height/2+200){
    num= 1;
    factor=1.7;
    }
    else if(mouseX>=width/1.7 && mouseX<=width/1.7+500 && mouseY>=height/2 && mouseY<=height/2+200){
    num= 1;
    factor=0.3;
    }
  }
  
}
