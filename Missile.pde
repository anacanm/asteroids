class Missile
{
  PVector distance;
  PVector speed;
  boolean shooting;
  boolean isMissileSpawned;
  
  
  Missile(float xstart,float ystart,float xv, float yv)
  {
   distance = new PVector(xstart, ystart);
   speed = new PVector(xv,yv);
   
   
   shooting = false;
   isMissileSpawned = false;
  }
  
  void setStart(float startX,float startY)
  {
    if (shooting == false)
    {
   distance.x = startX; 
   distance.y = startY;
   shooting = true; 
    }
  }

  float getX()
  {
    return distance.x;
  }
  float getY()
  {
    return distance.y;
  }
  void update()
  {
  distance.add(speed);
  
  }
  
 
  
  void display() {
    if (shooting == true)
    {
      
   stroke(255);
    fill(255);
    ellipse(distance.x, distance.y,4,4);
    }
  }
}