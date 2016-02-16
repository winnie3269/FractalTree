private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  
Snowflake [] ok;
public void setup() 
{   
  size(640, 480);    
  ok=new Snowflake[300];
  for (int i=0; i<ok.length; i++)
  {
    ok[i]=new Snowflake();
  }
  background(0);
  frameRate(10);
  noStroke();
} 
public void draw() 
{   
  for (int i=0; i<ok.length; i++)
  {
    ok[i].erase();
    ok[i].move();
    ok[i].wrap();
    ok[i].show();//your code here
  }
  stroke(#FAD1EB);
  line(320, 480, 320, 380);   
  drawBranches(320, 380, 100, 3*Math.PI/2); //will add late
} 
public class Snowflake
{
  int x, y, snowSize;
  Snowflake()
  {
    x=(int)(Math.random()*640);
    y=(int)(Math.random()*479);
    snowSize=(int)(Math.random()*6);
  }
  void show()
  {
    noStroke();
    fill(255);
    ellipse(x, y, snowSize, snowSize);//your code here
  }
  void erase()
  {
    fill(0);
    ellipse(x, y, snowSize+3, snowSize+3);
  }
  void move()
  {
    y++;
  }
  void wrap()
  {
    if (y>479)
    {
      y=0;
      x=(int)(Math.random()*640);
    }
  }
}

public void drawBranches(int x, int y, double branchLength, double angle) 
{  
  double angle1=angle+branchAngle;
  double angle2=angle-branchAngle;
  angle1=angle+branchAngle;
  angle2=angle-branchAngle;
  branchLength=branchLength*fractionLength;
  int endX1=(int)(branchLength*Math.cos(angle1)+x);
  int endY1=(int)(branchLength*Math.sin(angle1)+y);
  int endX2=(int)(branchLength*Math.cos(angle2)+x);
  int endY2=(int)(branchLength*Math.sin(angle2)+y);
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);//end of step 3
  if (branchLength>smallestBranch)
  {
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2);
  }
} 
public void keyTyped()
{

  if (key=='w')
  {
    branchAngle-=0.1;
    //fractionLength++;
    //smallestBranch++;
  }
  if (key=='s')
  {
    branchAngle+=0.1;
    //fractionLength--;
    //smallestBranch--;
  }
}