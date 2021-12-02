//Makin me Platforms

class Platform {

  int x; //x and y of platform
  int y;
  int h; //height and width
  int w;

  int ptopBound;
  int pbottomBound;
  int pleftBound;
  int prightBound;

  boolean touching;

  //constructor

  Platform(int platX, int platY) {
    x = platX;
    y = platY;
    w = 150;
    h = 15;

    ptopBound = y;
    pbottomBound = y + h;
    pleftBound = x;
    prightBound = x + w;

    touching = false;
  }
  void render() {
    fill(0, 0, 255);
    rect(x, y, w, h);
  }
  void updateBounds() {
    ptopBound = y;
    pbottomBound = y + h;
    pleftBound = x;
    prightBound = x + w;
  }
  void detect(Player P1) {
    touching = false;
    if (P1.topBound<pbottomBound) {
      if (P1.bottomBound>ptopBound) {
        if (P1.leftBound<prightBound) {
          if (P1.rightBound>pleftBound) {
            touching = true;
          }
        }
      }
    }
  }
  void landedOn(Player P1) {
    if (P1.isFalling == true && touching == true) {
      P1.y = y - P1.size+1;
      P1.isFalling = false;
      P1.peakY = P1.y - 150;

      //println("platDetect");
    }
  }
}
