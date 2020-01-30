

    import processing.sound.*;
    boolean isMissileSpawned;
    
    
    SoundFile music;          //start of sounds
    //SoundFile fire;
   // SoundFile thrust; //end of sounds
    
    int score = 0;
    int randomC1,randomC2,randomC3;
                             
                              
    PImage asteroid;         
    
    
    float misX;
    float misY;
    
    boolean alive = true; //ship test
    
    
    int asx1 = (int)random(1600);        //beginning of asteroid variables
    int asy1 = (int)random(1000);
    int asx2 = (int)random(1600);        
    int asy2 = (int)random(1000);
    int asx3 = (int)random(1600);       
    int asy3 = (int)random(1000);
    int asx4 = (int)random(1600);        
    int asy4 = (int)random(1000);
    int asx5 = (int)random(1600);        
    int asy5 = (int)random(1000);        
    boolean roid1 =true;
    boolean roid2 =true;
    boolean roid3 =true;
    boolean roid4 =true;
    boolean roid5 =true;  //end of asteroid variables
    
    
    
    static int gw, gh;
    static float x, y, z, v,xx,yy;
    static boolean north, south, west, east,shootB;
    final static float SPD = .2, ROT = .1, ACCEL = .96;
    
    Missile m;
    PShape ship;
    
    public void settings() { 
      size(1600, 1000);
    
    }
    
    void setup() {
      
      smooth();
      asteroid =loadImage("Asteroids_Large_Asteroid.png");
      
      gw = width;
      gh = height;
      x = gw>>1;
      y = gh>>1;
      ship = createShape();
    ship.beginShape();
    ship.fill(0);
    ship.stroke(255);
    ship.strokeWeight(1);
    ship.vertex(0,0);//nose
    ship.vertex(-15,40);
    ship.vertex(0,0);
    ship.vertex(15,40);
    ship.vertex(10,30);//right triangle point
    ship.vertex(-10,30);//left triangle point
    ship.vertex(0,30);// midpoint of thruster
    ship.vertex(-10,30);//left triangle point
    ship.vertex(0,0);//nose
    ship.vertex(15,40);
    ship.vertex(10,30);
    ship.vertex(0,30);// midpoint of thruster
    ship.endShape();
    
    
    //music = new SoundFile(this,"Asteroids Game Boy Title Music.mp3");
   // fire = new SoundFile(this,"fire.wav");
    //thrust = new SoundFile(this,"thrust.wav");
    
    
    translate(width/2,height/2);
    shape(ship,0,0);
    translate(ship.width/2,ship.height/2);
    
    //music.loop();
    }
    
    
    
    
    
    void keyPressed() {
      setKeys(keyCode, true);
    }
    
    
    void keyReleased() {
      setKeys(keyCode, false);
    }
    
    
    final void setKeys(int k, boolean decision) {
      if    (k == UP  | k == 'W'){   north = decision; playThrust();}
      //else if(k==DOWN | k=='S') south = decision;
      else if (k == LEFT  | k == 'A')   west  = decision;
      else if (k == RIGHT | k == 'D')   east  = decision;
      else if(k == 'r' ) { roid1 = true;roid2 = true;roid3 = true;roid4 = true;roid5 = true;}
      else if(k=='q'){alive = true;}
      else if(k==' '){playFire(); shootB = decision;}
    }
    void playFire()
    {
     // fire.play();
    }
    void playThrust()
    {
      //thrust.play();
    }
    
    
    final void update() {
      v += (north? SPD : 0) - (south? SPD : 0);
      z += (east?  ROT : 0) - (west?  ROT : 0);
      x = (x + gw + cos(z)*v) % gw;
      y = (y + gh + sin(z)*v) % gh;
      v *= ACCEL;
     if(shootB)
      {
        isMissileSpawned = true;
        
        
        /*if(north)
        {
        m = new Missile(x,y,0,9);
        }
        else if(west)
        {
          m = new Missile(x,y,-9,0);
        }
        else if(east)
        {
          m = new Missile(x,y,9,0);
        }
        else 
        {
          m = new Missile(x,y,0,-9);
        }
        m.setStart(x,y);
        
      
      if(x>y)
      {
        if(x<0&&y<0)
        {
        xx = (x/y*-1);
        yy=(y/y*-1);                                                        //heres the part where i wanted to shoot myself
      }
      else if(x<0&&y>0)
      {xx = x/y*-1;
      yy = y/y;
      }
      else if(x>0&&y<0)
        {xx = x/y;
         yy=y/y*-1;
      }
      else if(x>0&&y>0)
      {xx=x/y;
      yy = y/y;
      }
      }
      
      
      
      else if(y>x)
     {
       if(x<0&&y<0)
        {
        xx = (x/x*-1);
        yy=(y/x*-1);
      }
      else if(x<0&&y>0)
      {xx = x/x*-1;
      yy = y/x;
      }
      else if(x>0&&y<0)
        {xx = x/x;
         yy=y/x*-1;
      }
      else if(x>0&&y>0)
      {xx = x/x;
      yy = y/x;
     }
     }
    */
    
    m = new Missile(x,y,cos(z)*12,sin(z)*12);
    m.setStart(x,y);
    }
      if(isMissileSpawned)
        {
        m.update();
        misX = m.getX();
        misY = m.getY();
        m.display();
      }
      
      //isMissileSpawned=false;
    }
    
    void ast1()                              //asteroid 1 movement
    {imageMode(CENTER);
     image(asteroid,asx1,asy1,100,100);
      if(asx1>width)
      asx1=0;
      if(asy1>height)
      asy1=0;
      
      asx1++;
      asy1++;
    }
     void ast2()                            //asteroid 2 movement
    {imageMode(CENTER);
     image(asteroid,asx2,asy2,100,100);
      if(asx2>width)
      asx2=0;
      if(asy2<0)
      asy2=height;
      
      asx2++;
      asy2--;
    }
    void ast3()                              //asteroid 3 movement
    {imageMode(CENTER);
     image(asteroid,asx3,asy3,100,100);
      if(asx3<0)
      asx3=width;
      if(asy3>height)
      asy3=0;
      
      asx3--;
      asy3++;
    }
    void ast4()                              //asteroid 4 movement
    {imageMode(CENTER);
     image(asteroid,asx4,asy4,100,100);
      if(asx4<0)
      asx4=width;
      if(asy4<0)
      asy4=height;
      
      asx4--;
      asy4--;
    }
    void ast5()                              //asteroid 5 movement
    {imageMode(CENTER);
     image(asteroid,asx5,asy5,100,100);
      if(asx5>width)
      asx5=0;
      if(asy5>height)
      asy5=0;
      
      asx5++;
      asy5++;
    }
    
    
    
    void display() {
      translate(x, y);
      rotate(z+HALF_PI);
      shape(ship,0,0);
    }


    void draw() {
      background(0);
      fill(255);
      textSize(32);
      text(score,0,50);
      
    
    
      if(roid1)  ast1(); //drawing asteroids
      if(roid2)  ast2();
      if(roid3)  ast3();
      if(roid4)  ast4();
      if(roid5)  ast5();
      
      if(alive)
      {
      update();
      display();
      }
       
      if((dist(x,y,asx1,asy1) <50) && roid1==true)alive = false; 
      if((dist(x,y,asx2,asy2) <50) && roid2==true)alive = false; 
      if((dist(x,y,asx3,asy3) <50) && roid3==true)alive = false;    //separate into 5 tests, one for each asteroid, checking to see if asteroid is there with the roidx boolean
      if((dist(x,y,asx4,asy4) <50) && roid4==true)alive = false;
      if((dist(x,y,asx5,asy5) <50) && roid2==true)alive = false;
      
      if( dist(asx1,asy1,misX,misY)<75|| dist(asx1,asy1,asx2,asy2)<75|| dist(asx1,asy1,asx3,asy3)<75|| dist(asx1,asy1,asx4,asy4)<75||dist(asx1,asy1,asx5,asy5)<75|| dist(asx1,asy1,x,y)<50){score++; asx1 = (int)random(0,1600);asy1 = (int)random(0,1000); roid1 = false;}
      if( dist(asx2,asy2,misX,misY)<75|| dist(asx2,asy2,asx1,asy1)<75|| dist(asx2,asy2,asx3,asy3)<75|| dist(asx2,asy2,asx4,asy4)<75||dist(asx2,asy2,asx5,asy5)<75|| dist(asx2,asy2,x,y)<50){score++; asx2 = (int)random(0,1600);asy2 = (int)random(0,1000); roid2 = false;}
      if( dist(asx3,asy3,misX,misY)<75|| dist(asx3,asy3,asx2,asy2)<75|| dist(asx3,asy3,asx1,asy1)<75|| dist(asx3,asy3,asx4,asy4)<75||dist(asx3,asy3,asx5,asy5)<75|| dist(asx3,asy3,x,y)<50){score++; asx3 = (int)random(0,1600);asy3 = (int)random(0,1000); roid3 = false;}
      if( dist(asx4,asy4,misX,misY)<75|| dist(asx4,asy4,asx2,asy2)<75|| dist(asx4,asy4,asx3,asy3)<75|| dist(asx4,asy4,asx1,asy1)<75||dist(asx4,asy4,asx5,asy5)<75|| dist(asx4,asy4,x,y)<50){score++; asx4 = (int)random(0,1600);asy4 = (int)random(0,1000); roid4 = false;}
      if( dist(asx5,asy5,misX,misY)<75|| dist(asx5,asy5,asx2,asy2)<75|| dist(asx5,asy5,asx3,asy3)<75|| dist(asx5,asy5,asx4,asy4)<75||dist(asx5,asy5,asx1,asy1)<75|| dist(asx5,asy5,x,y)<50){score++; asx5 = (int)random(0,1600);asy5 = (int)random(0,1000); roid5 = false;}
      
      if(mousePressed)
      {/*
        roid1 = true;
        roid2 = true;
        roid3= true;
        roid4= true;
        roid5 = true;
        */
        alive = true;
    }
    if(roid1 == false &&roid2 == false &&roid3 == false &&roid4 == false &&roid5 == false)
    {
      roid1 = true;
        roid2 = true;
        roid3= true;
        roid4= true;
        roid5 = true;
      
    }
   
    }
