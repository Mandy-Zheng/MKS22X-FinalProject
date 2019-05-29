class Enemies {
  int[][] grid=new int[15][15];
  float x;
  float y;
  float tx;
  float ty;
  Player target;
  int[] moves=new int[8];
  public Enemies(Player a) {
    target=a;
    x=100;
    y=100;
    tx=a.getPX();
    ty=a.getPY();
    moves[0]=0;
    moves[1]=1;
    moves[2]=0;
    moves[3]=-1;
    moves[4]=-1;
    moves[5]=0;
    moves[6]=1;
    moves[7]=0;
    clear();
  }
  void clear() {
    for (int i=0; i<grid.length; i++) {
      for (int j=0; j<grid.length; j++) {
        grid[i][j]=0;
      }
    }
  }
  void update(Block[][] gameBoard) {
    clear();
    for (int i=0; i<gameBoard.length; i++) {
      for (int k=0; k<gameBoard[0].length; k++) {
        if (gameBoard[i][k]!=null) {
          grid[i][k]=-1;
        }
      }
    }
    tx=target.getPX();
    ty=target.getPY();
    fillGrid(round(ty/50), round(tx/50), 1);
    //board();
    //System.out.println(target.getPX()+" "+target.getPY());
    //moveE();
  }
  void fillGrid(int xer, int yer, int num) {
    if (xer<grid.length&&xer>=0&&yer>=0&&yer<grid.length&&grid[xer][yer]!=1&&(grid[xer][yer]==0||grid[xer][yer]>num)) {
      grid[xer][yer]=num;
      fillGrid(xer+1, yer, num+1);
      fillGrid(xer, yer+1, num+1);
      fillGrid(xer-1, yer, num+1);
      fillGrid(xer, yer-1, num+1);
    }
  }
  void board() {
    for (int i=0; i<grid.length; i++) {
      for (int j=0; j<grid.length; j++) {
        System.out.print(grid[i][j]+" ");
      }
      System.out.println();
    }
    System.out.println();
    //System.out.println(x+" "+y);
  }
  void moveE() {
    int a=round((y)/50);
    int b=round((x)/50);
    int smallest=grid[a][b];
    int index=-1;
    for (int i=0; i<4; i++) {
      //board();
      if (a+moves[2*i]>=0&&a+moves[2*i]<grid.length&&b+moves[2*i+1]>=0&&b+moves[2*i+1]<grid.length) {
        if (grid[a+moves[2*i]][b+moves[2*i+1]]<=smallest&&grid[a+moves[2*i]][b+moves[2*i+1]]!=-1) {
          smallest=grid[a+moves[2*i]][b+moves[2*i+1]];      
          index=i;
        }
      }
    }
    if (index!=-1) {
      moveAnimation(moves[2*index+1], moves[2*index]);
    }
  }
  void moveAnimation(int dx, int dy) {
    PImage pic;
    x+=dx;
    y+=dy;
    if (dx>0) {
      if (frameCount%30<10) {
        pic=meowthRM1;
      } else if (frameCount%30<20) {
        pic=meowthRM2;
      } else {
        pic=meowthRM2;
      }
      display(pic);
    } else if (dx<0) {
      if (frameCount%30<10) {
        pic=meowthLM1;
      } else if (frameCount%30<20) {
        pic=meowthLM2;
      } else {
        pic=meowthLM3;
      }
      display(pic);
    } else if (dy>0) {
      if (frameCount%30<10) {
        pic=meowthDM1;
      } else if (frameCount%30<20) {
        pic=meowthDM2;
      } else {
        pic=meowthDM3;
      }
      display(pic);
    } else if (dy<0) {
      if (frameCount%30<10) {
        pic=meowthUM1;
      } else if (frameCount%30<20) {
        pic=meowthUM2;
      } else {
        pic=meowthUM3;
      }
      display(pic);
    }
  }
  void display(PImage i) {
    image(i, x, y);
  }
}
class Spoink extends Enemies {
  public Spoink(Player a) {
    super(a);
  }
}
