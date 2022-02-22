class Tendril
{
  public final static int SEG_LENGTH = 6; //length of each segment in the tendril
  private int myNumSegments, myX, myY;
  private double myAngle;
  
  /**
   Class constructor
   len is how many segments in this tendril (each a fixed length, 4 is a good start)
   theta is tendril starting angle in radians 
   x, y  is the starting (x,y) coordinate
   */
  public Tendril(int len, double theta, int x, int y)
  {
    myNumSegments = len;
    myAngle = theta;
    myX = x;
    myY = y;
  }
  public void show()
  {
    int endX = myX;
    int endY = myY;                 
    int startX = myX;
    int startY = myY;
    for(int i = 0; i < myNumSegments; i++){
     myAngle += (double)((int)(Math.random()*4)-2)/8;
     endX = startX + (int)(Math.cos(myAngle)*SEG_LENGTH);
     endY = startY + (int)(Math.sin(myAngle)*SEG_LENGTH);
     line(startX, startY, endX + 3, endY + 3);
     line(startX, startY, endX - 3, endY - 3);
     line(startX, startY, endX, endY);
     startX = endX;
     startY = endY;
    }
    if(myNumSegments >= 4){
      strokeWeight(2);
      stroke((int)(Math.random()*100)+50, (int)(Math.random()*150), 80);
      Cluster c = new Cluster(myNumSegments/3, endX, endY);
    }
  }
}
