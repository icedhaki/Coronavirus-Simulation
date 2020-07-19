class Person{
  float x;
  float y;
  float dirX;
  float dirY;
  int diameter=20;
  char state;
  int socialDistance;
  int healTime=200;
  int frameSick=0;
  
  Person(int tempSocialDistance, char tempState, float tx, float ty){
    x=tx;
    y=ty;
    dirX=random(-3,3);
    dirY=random(-3,3);
    socialDistance=tempSocialDistance;
    state=tempState;
    
  }

  void displayPerson(){
    stroke(0);
    if(frameSick>healTime){
      state='r';
    }
    if(state=='h'){
      fill(#6399db);
    }
    else if(state=='s'){
      fill(#e39520);
      frameSick++;
    }
    else{
      fill(#ed91e4);
    }
    
    circle(x,y,diameter);
  }
  
  void movePerson(){
    x=x+dirX*(1-socialDistance)*factor;
    y=y+dirY*(1-socialDistance)*factor;
  }
  
  void bounceEdges(){
    if(x>=width-diameter/2 || x<=diameter/2){
      dirX=-dirX;
    }
    if(y>=simHeight-diameter/2 || y<=diameter/2){
      dirY=-dirY;
    }
  }
  
  void bouncePeople(Person other){
    float dx=other.x-this.x;
    float dy=other.y-this.y;
    float distance=sqrt(dx*dx+dy*dy);
    float minDist=diameter;
    
    
    if(distance<minDist){
      float angle=atan2(dy,dx);
      float targetX=x+cos(angle)*minDist;
      float targetY=y+sin(angle)*minDist;
      float ax=(targetX-other.x)*0.05;
      float ay=(targetY-other.y)*0.05;
      this.dirX-=ax;
      this.dirY-=ay;
      other.dirX+=ax;
      other.dirY+=ay;
      
      if(this.state=='h' && other.state=='s'){
        this.state='s'; 
      }
    }
  }
}
