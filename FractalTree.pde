private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  
money [] mm; 
public void setup() 
{   
  
  size(640,480);    
  mm = new money [50]; 
  
   for(int i = 0; i< mm.length; i++){ //notice start 
     mm[i] = new money ();
  }
} 
public void draw() 
{   
  background(0);   
  stroke(39, 237, 36);   
  strokeWeight(3); 
  line(320,480,320,380);     
  drawBranches(320, 380, 100.0, -PI/2);
  
  for (int i =0; i< mm.length; i++){
  mm[i].drift(); 
  mm[i].show(); 
 }
 
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
  double angle1 = angle + branchAngle; 
  double angle2 = angle - branchAngle; 
  
  branchLength*= fractionLength; 
  
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 =  (int)(branchLength*Math.sin(angle2) + y);
  line(x, y, endX1, endY1); 
  line (x, y, endX2, endY2); 
   if (branchLength > smallestBranch){
    strokeWeight(2);
     drawBranches(endX1, endY1, branchLength, angle1);
     drawBranches(endX2, endY2, branchLength, angle2);
    
   }
}//end draw branches func


 class money
 {
   String m; 
   
   int myX, myY, mySpeed; 
   money()
   {
   
    m = "$"; 
    mySpeed = (int) (Math.random()*2) + 1;
    myX = (int) (Math.random()*480) + 80; 
    myY = (int) (Math.random()*450) + 180; 
   } // end constructor 
   
 void show(){
   textSize(18); 
   text (m, myX, myY); 
   }
   
   void drift() {
     myY += mySpeed; 
    if ( myY > 480) {
      myY = 150; // for the pattern/animation to keep going
    }
   }//end drift 
  }//end money class
 
 

