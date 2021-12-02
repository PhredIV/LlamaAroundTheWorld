//Me goal

class Goal {

  int x;
  int y;
  int d;

  int gtopBound;
  int gbottomBound;
  int gleftBound;
  int grightBound;

  boolean touching;

  Goal() {

    touching = false;

    x = int(random(300, 500));
    y = 200;
    d = 100;

    gtopBound = y - d/2;
    gbottomBound = y + d/2;
    gleftBound = x - d/2;
    grightBound = x + d/2;
  }

  void render() {
    gtopBound = y - d/2;
    gbottomBound = y + d/2;
    gleftBound = x - d/2;
    grightBound = x + d/2;
    fill(255);
    if (state == 1) {
      image(russiaGoal, x, y);
    }
    if (state == 2) {
      image(indiaGoal, x, y);
    }
    if (state == 3) {
      image(germanGoal, x, y);
    }
    if (state == 4) {
      image(usaGoal, x, y);
    }
  }

  void updateBounds() {
    gtopBound = y - d/2;
    gbottomBound = y + d/2;
    gleftBound = x - d/2;
    grightBound = x + d/2;
  }
}
