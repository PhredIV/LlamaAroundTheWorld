class Animation {
  // variables
  PImage[] images; //number of images in animation
  float speed; //speed of progression through annimation
  float scale; //aspect ratio/scale of image

  float index; //where in the index of the array image[] are we
  boolean isAnimating; //are we doing the animation or nah?

  // constructor
  Animation(PImage[] tempImages, float tempSpeed, float tempScale) {
    images = tempImages;
    speed = tempSpeed;
    scale = tempScale;

    index = 0;
    isAnimating = false;
  }

  // updates the index which image to display for
  // the animation
  void next() {
    index += speed;

    // resets the index if it is too big
    if (index >= images.length) {
      index=0;
      isAnimating=false;
    }
  }

  // display an image of the animation
  void display(int x, int y) {
    imageMode(CENTER);
    if (isAnimating) {
      int imageIndex = int(index);
      PImage img = images[imageIndex];
      image(img, x, y, img.width*scale, img.height*scale); //shows first image, and where, then each next one after

      // increment the index of the images to display
      next();
    } else {
      PImage img = images[0];
      image(img, x, y, img.width*scale, img.height*scale);
    }
  }
}
