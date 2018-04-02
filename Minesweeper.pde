import de.bezier.guido.*;
public final static int NUM_ROWS = 10;
public final static int NUM_COLS = 10;//Declare and initialize NUM_ROWS and NUM_COLS = 20
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> bombs; //ArrayList of just the minesweeper buttons that are mined

void setup ()
{
  bombs = new ArrayList <MSButton>();
    size(400, 400);
    textAlign(CENTER,CENTER);
    
    // make the manager
    Interactive.make( this );
    
    //your code to declare and initialize buttons goes here
   buttons = new MSButton[NUM_ROWS][NUM_COLS];
    for (int row =0; row<NUM_ROWS; row++){
    for (int col = 0; col<NUM_COLS; col++){
      buttons[row][col] = new MSButton(row,col);


    }
    }
         setBombs();
}
public void setBombs()
{
  //int n = (int)Math.random()*NUM_ROWS;
  //int m = (int)Math.random()*NUM_ROWS;
  for (int i = 0; i<7; i++){
  int n = (int)(Math.random()*NUM_ROWS);
  int m = (int)(Math.random()*NUM_COLS);
  if (!bombs.contains(buttons[n][m]))
  {
    bombs.add(buttons[n][m]);
  }
  System.out.println(n+","+  m);
  }
    //your code
}

public void draw ()
{
    background( 0 );
    if(isWon()){
        displayWinningMessage();}
}
public boolean isWon()
{
  for(int i =0; i< NUM_ROWS; i++){
  for(int j=0; j<NUM_COLS; j++){
    if(!buttons[i][j].isClicked() && !bombs.contains(buttons[i][j]))
    return false;
  }}
    //your code here
    return true;
}
public void displayLosingMessage()
{
 
  buttons[4][2].setLabel("S");
  buttons[4][3].setLabel("o");
  buttons[4][4].setLabel("r");
  buttons[4][5].setLabel("r");
  buttons[4][6].setLabel("y");
    //your code here
}
public void displayWinningMessage()

{buttons[4][1].setLabel("C");
  buttons[4][2].setLabel("O");
  buttons[4][3].setLabel("N");
  buttons[4][4].setLabel("G");
  buttons[4][5].setLabel("R");
    buttons[4][6].setLabel("A");
  buttons[4][7].setLabel("T");
  buttons[4][8].setLabel("S");

  
   //your code here
}

public class MSButton
{
    private int r, c;
    private float x,y, width, height;
    private boolean clicked, marked;
    private String label;
    
    public MSButton ( int rr, int cc )
    {
         width = 400/NUM_COLS;
         height = 400/NUM_ROWS;
        r = rr;
        c = cc; 
        x = c*width;
        y = r*height;
        label = "";
        marked = clicked = false;
        Interactive.add( this ); // register it with the manager
    }
    public boolean isMarked()
    {
        return marked;
    }
    public boolean isClicked()
    {
        return clicked;
    }
    // called by manager
    
    public void mousePressed () 
    {
        clicked = true;
       if (keyPressed ==true){
        
         marked = !marked;
         
          if( marked == false)
         clicked= false;
       }
       else if (bombs.contains(this)){
       displayLosingMessage();}
       else if (countBombs(r,c)>0)
       {
 
     setLabel(""+countBombs(r,c));
       }
       else
       {
         if(isValid(r-1,c-1) && buttons[r-1][c-1].clicked==false)
         buttons[r-1][c-1].mousePressed();
          if(isValid(r-1,c) && buttons[r-1][c].clicked==false)
         buttons[r-1][c].mousePressed();
          if(isValid(r,c-1) && buttons[r][c-1].clicked==false)
         buttons[r][c-1].mousePressed();
          if(isValid(r-1,c+1) && buttons[r-1][c+1].clicked==false)
         buttons[r-1][c+1].mousePressed();
          if(isValid(r+1,c-1) && buttons[r+1][c-1].clicked==false)
         buttons[r+1][c-1].mousePressed();
          if(isValid(r+1,c+1) &&buttons[r+1][c+1].clicked==false)
         buttons[r+1][c+1].mousePressed();
          if(isValid(r+1,c) &&buttons[r+1][c].clicked==false)
         buttons[r+1][c].mousePressed();
          if(isValid(r,c+1) &&buttons[r][c+1].clicked==false)
         buttons[r][c+1].mousePressed();
       }
       
         
 
       
        //your code here
    }

    public void draw () 
    {    
        if (marked)
            fill(0);
         else if( clicked && bombs.contains(this) ) 
             fill(255,0,0);
        else if(clicked)
            fill( 200 );
        else 
            fill( 100 );

        rect(x, y, width, height);
        fill(0);
        text(label,x+width/2,y+height/2);
    }
    public void setLabel(String newLabel)
    {
        label = newLabel;
    }
    public boolean isValid(int r, int c)
    {
      if(r<NUM_ROWS && r>-1 && c>-1 && c<NUM_COLS )
      return true;
        //your code here
        return false;
    }
    public int countBombs(int r, int c)
    {
      int numBombs = 0;
  
      if(isValid(r-1,c-1) && bombs.contains(buttons[r-1][c-1]))
      numBombs = numBombs+1;
      if(isValid(r-1,c) && bombs.contains(buttons[r-1][c]))
      numBombs = numBombs+1;
      if(isValid(r,c-1) && bombs.contains(buttons[r][c-1]))
      numBombs = numBombs+1;
      if(isValid(r-1,c+1) && bombs.contains(buttons[r-1][c+1]))
      numBombs = numBombs+1;
      if(isValid(r+1,c-1) && bombs.contains(buttons[r+1][c-1]))
      numBombs = numBombs+1;
      if(isValid(r+1,c) && bombs.contains(buttons[r+1][c]))
      numBombs = numBombs+1;
      if(isValid(r,c+1) && bombs.contains(buttons[r][c+1]))
      numBombs = numBombs+1;
      if(isValid(r+1,c+1) && bombs.contains(buttons[r+1][c+1]))
      numBombs = numBombs+1;
      return numBombs;
        //your code here
       
    }

}