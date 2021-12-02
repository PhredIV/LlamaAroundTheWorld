//Mekin da playa

class Player {

  int x;
  int y;
  int size;
  color c;

  int runSpeed;// the speed of the player as it runs
  int jumpSpeed;// the speed the player jumps up in the air
  int fallSpeed;// the speed the player falls

  int topBound;// the top boundary of the player
  int bottomBound;// the bottom boundary of the player
  int leftBound;// the left bound of the player
  int rightBound;// the right bound of the player

  boolean movingLeft;// a boolean- when it is true, the player will move to the left
  boolean movingRight;//a boolean- when it is true, the player will move to the right
  boolean isJumping;// a boolean- when it is true, the player will be rising from a jump
  boolean isFalling;// a boolean- when it is true, the player will be falling

  int jumpHeight;// the amount of distance the player moves up when the player jumps
  int peakY;// the y value the player will have when it reaches the top of its jump

  boolean touchingGoal;
  boolean touchingPlat;





  Player() { //constructor

    touchingGoal = false;
    touchingPlat = false;


    x = int(random(width/4, 3*width/4));
    size = 25;
    y = height-size-10;
    c = color(255, 0, 255);

    runSpeed = 5;
    jumpSpeed = 5;
    fallSpeed = 5;

    movingLeft = false;
    movingRight = false;
    isJumping = false;
    isFalling = false;

    jumpHeight = height-100;
    peakY = jumpHeight;

    topBound = y - size/2;
    bottomBound = y + size/2;
    leftBound = x - size/2;
    rightBound = x + size/2;
  }

  void render() {
    fill(c);
    for (int i=0; i<llamaImages.length; i++) {
    llamaImages[i] = loadImage("llama"+i+".png");
    }
  }

  void moveLeft() { //moving left and right, keyReleased is in main code page
    if (movingLeft == true) {
      x = x-runSpeed;
    }
  }

  void moveRight() {
    if (movingRight == true) {
      x = x+runSpeed;
    }
  }

  void jump() {
    if (isJumping == true && isFalling == false) {
      y = y-jumpSpeed;
    }
  }



  void fall() {
    if (isFalling == true && isJumping == false) {
      y = y+fallSpeed;
      //println(isFalling);
      //println(isJumping);
    }
  }

  void land() {
    if (y >= height-size) {
      isFalling = false;
      peakY = y - 150;
      //println("landed");
    }
  }

  void reachedTopOfJump() {
    if (y <= peakY) {
      isJumping = false;
      isFalling = true;
    }
  }
  void updateBounds() {
    topBound = y;
    bottomBound = y + size;
    leftBound = x;
    rightBound = x + size;
  }
  void detectGoal(Goal G1) {
    if (topBound<G1.gbottomBound) {
      if (bottomBound>G1.gtopBound) {
        if (leftBound<G1.grightBound) {
          if (rightBound>G1.gleftBound) {
            touchingGoal = true;
            //println("goalDetect");
          }
        }
      }
    }
  }

  void fallOffPlatform(ArrayList<Platform> platList) {
    boolean onPlatform = true;
    if (isJumping == false && y < height-size) {
      onPlatform = false;
      //println("fallOff");
    }
    for (Platform aPlat : platList) {
      if (aPlat.touching == true) {
        onPlatform = true;
      }
    }
    if (onPlatform == false) {
      isFalling = true;
    }
  }
}
