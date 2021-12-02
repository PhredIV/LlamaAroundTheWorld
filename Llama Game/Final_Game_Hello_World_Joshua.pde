//Final Game!!! // LlamaAround the World

//reference "interaction bt classes" for integration info
PImage russiaFlag;
PImage indiaFlag;
PImage germanFlag;
PImage usaFlag;
PImage flags;

PImage russiaGoal;
PImage indiaGoal;
PImage germanGoal;
PImage usaGoal;

Animation llamaAnimation;

PImage [] llamaImages = new PImage [6]; //array has six slots rn, update according to image

ArrayList<Platform> platList;

import processing.sound.*;


//sound var
SoundFile jumpSound;
SoundFile germanMusic;
SoundFile indiaMusic;
SoundFile usaMusic;
SoundFile russiaMusic;

int numPlatforms;
int totalPlatforms;

Player P1;
Platform aPlat;
Goal G1;

int state;

void setup() {

  size (1200, 800);

  for (int i=0; i<llamaImages.length; i++) { //filling array with images from the data folder
    llamaImages[i] = loadImage("llama"+i+".png");

    llamaAnimation = new Animation(llamaImages, 0.1, 1.0);

    russiaMusic = new SoundFile(this, "russiaMusic.mp3");
    indiaMusic = new SoundFile(this, "indiaMusic.mp3");
    indiaMusic.amp(0.6);
    usaMusic = new SoundFile(this, "usaMusic.mp3");
    germanMusic = new SoundFile(this, "germanMusic.mp3");

    jumpSound = new SoundFile(this, "jumpSound.wav"); //give file name and the "this" is just straight java things

    jumpSound.rate(2.0);

    //change volume for each sound file
    jumpSound.amp(1.0); //bt. 1.0 and 0.0
    russiaMusic.amp(0.8); //bt. 1.0 and 0.0

    numPlatforms = 0;
    totalPlatforms = 10;

    P1 = new Player ();
    platList = new ArrayList<Platform>(); //int (random(100,1000)),int ((random(100,500)))
    G1 = new Goal();

    state = 0;
    
    flags = loadImage("flags.png"); //background for start and end
    flags.resize(1200, 800);

    russiaFlag = loadImage("russiaFlag.png"); //russia
    russiaFlag.resize(1200, 800); //width and height

    indiaFlag = loadImage("indiaFlag.png"); //india
    indiaFlag.resize(1200, 800);

    germanFlag = loadImage("germanFlag.png"); //german
    germanFlag.resize(1200, 800); 

    usaFlag = loadImage("usaFlag.png"); //usa
    usaFlag.resize(1200, 800);


    //goals for each country
    russiaGoal = loadImage("russiaGoal.png"); 
    russiaGoal.resize(100, 100);
    
    indiaGoal = loadImage("indiaGoal.png");
    indiaGoal.resize(100, 100);
    
    germanGoal = loadImage("germanGoal.png");
    germanGoal.resize(100, 100);
    
    usaGoal = loadImage("usaGoal.png");
    usaGoal.resize(100, 100);
    
  }
}

void draw () {

  switch(state) { //FSM // first is opening screen!
  case 0: //my 0st case
    background(flags);
    textSize(100);
    fill(0);
    text("Llama Around the World!", 100, 200);
    fill(0, 255, 255);
    textSize(98);
    text("Llama", 100, 200); //overlap text for texture
    textSize(98);
    text("Around", 378, 200); //overlap text for texture
    textSize(98);
    text("the", 700, 200); //overlap text for texture
    textSize(98);
    text("World!", 860, 200); //overlap text for texture
    println(mouseX);
    
    
    textSize(60);
    fill(0);
    text("Collect all the souvenirs to win", 250, 350);
    textSize(25);
    fill(255,255,0);
    text("Press 'b' to begin", 100, 600);
    text("Space to jump, left and right arrow to move", 100, 700);
    break;

  case 1: // level 1 // Russia

    background(russiaFlag);  //flag for country goes here
    if (russiaMusic.isPlaying() == false) { //if not playing then play
      russiaMusic.play();
    }
    if (numPlatforms < totalPlatforms) {
      platList.add (new Platform(int (random(100, 600)),int (random(200, 700))));
      numPlatforms += 1;
    }

    for (Platform aPlat : platList) {
      aPlat.render();
      aPlat.updateBounds();
      aPlat.detect(P1);
      aPlat.landedOn(P1);
    }

    P1.render();
    P1.jump();
    P1.fall();
    P1.moveLeft();
    P1.moveRight();
    P1.land();
    P1.reachedTopOfJump();
    P1.updateBounds();
    P1.detectGoal(G1);
    P1.fallOffPlatform(platList);

    llamaAnimation.display(P1.x, P1.y);


    G1.render();
    G1.updateBounds();

    if (P1.touchingGoal == true) { //exit condition
      P1.y = height-P1.size-10;
      P1.x = 600;
      P1.touchingGoal = false;
      P1.isJumping = false;
      state = 2;
    }

    break;

  case 2: //level 2
    russiaMusic.stop();
    P1.isJumping = false;
    background(indiaFlag);  //flag for country goes here
    if (indiaMusic.isPlaying() == false) { //if not playing then play
      indiaMusic.play();
    }
    if (numPlatforms < totalPlatforms) {
      platList.add (new Platform(int (random(100, 600)),int (random(200, 700))));
      numPlatforms += 1;
    }

    for (Platform aPlat : platList) {
      aPlat.render();
      aPlat.updateBounds();
      aPlat.detect(P1);
      aPlat.landedOn(P1);
    }

    P1.render();
    P1.jump();
    P1.fall();
    P1.moveLeft();
    P1.moveRight();
    P1.land();
    P1.reachedTopOfJump();
    P1.updateBounds();
    P1.detectGoal(G1);
    P1.fallOffPlatform(platList);

    llamaAnimation.display(P1.x, P1.y);


    G1.render();
    G1.updateBounds();

    if (P1.touchingGoal == true) { //exit condition
      P1.y = height-P1.size-10;
      P1.x = 600;
      P1.touchingGoal = false;
      P1.isJumping = false;
      state = 3;
    }

    break;

  case 3: //level 3
    indiaMusic.stop();
    P1.isJumping = false;
    background(germanFlag);  //flag for country goes here
    if (germanMusic.isPlaying() == false) { //if not playing then play
      germanMusic.play();
    }
    if (numPlatforms < totalPlatforms) {
      platList.add (new Platform(int (random(100, 600)),int (random(200, 700))));
      numPlatforms += 1;
    }

    for (Platform aPlat : platList) {
      aPlat.render();
      aPlat.updateBounds();
      aPlat.detect(P1);
      aPlat.landedOn(P1);
    }

    P1.render();
    P1.jump();
    P1.fall();
    P1.moveLeft();
    P1.moveRight();
    P1.land();
    P1.reachedTopOfJump();
    P1.updateBounds();
    P1.detectGoal(G1);
    P1.fallOffPlatform(platList);

    llamaAnimation.display(P1.x, P1.y);


    G1.render();
    G1.updateBounds();

    if (P1.touchingGoal == true) { //exit condition
      P1.y = height-P1.size-10;
      P1.x = 600;
      P1.touchingGoal = false;
      P1.isJumping = false;
      state = 4;
    }

    break;

  case 4: //level 3
    germanMusic.stop();
    P1.isJumping = false;
    background(usaFlag);  //flag for country goes here
    if (usaMusic.isPlaying() == false) { //if not playing then play
      usaMusic.play();
    }
    if (numPlatforms < totalPlatforms) {
      platList.add (new Platform(int (random(100, 600)),int (random(100, 700))));
      numPlatforms += 1;
    }

    for (Platform aPlat : platList) {
      aPlat.render();
      aPlat.updateBounds();
      aPlat.detect(P1);
      aPlat.landedOn(P1);
    }

    P1.render();
    P1.jump();
    P1.fall();
    P1.moveLeft();
    P1.moveRight();
    P1.land();
    P1.reachedTopOfJump();
    P1.updateBounds();
    P1.detectGoal(G1);
    P1.fallOffPlatform(platList);
    //P1.reset();

    llamaAnimation.display(P1.x, P1.y);


    G1.render();
    G1.updateBounds();

    if (P1.touchingGoal == true) { //exit condition
      P1.y = height-P1.size-10;
      P1.x = 600;
      P1.touchingGoal = false;
      P1.isJumping = false;
      state = 5; //to win screen
    }

    break;

  case 5: //my 0st case
    usaMusic.stop();
    P1.isJumping = false;
    background(flags);
    textSize(100);
    fill(0);
    text("Welcome Home!", 300, 200);
    fill(0, 0, 255);
    text("Welcome Home!", 302, 199); //overlap text for texture
    
    textSize(60);
    fill(255,192,203);
    text("You Collected all the souvenirs", 250, 350);
    textSize(25);
    fill(255,255,0);
    text("Press 'r' to restart", 100, 600);
    break;
  }
}


void keyPressed() {
  if (keyCode == LEFT) {
    P1.movingLeft = true;
  }
  if (keyCode == RIGHT) {
    P1.movingRight = true;
  }
  if (key == 'b') {
    state = 1;
  }
  if (key == 'r') {
    state = 0;
  }
}

void keyReleased() {
  P1.movingLeft = false;
  P1.movingRight = false;
  if (keyCode == ' ' && P1.isFalling == false && P1.isJumping == false) { //to keep it from falling and jumping and falling and jumping and...
    P1.isJumping = true;
    llamaAnimation.isAnimating = true;
  }
}
