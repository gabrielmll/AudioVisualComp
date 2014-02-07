class Stars {

// ----- Set variables and parameters. -----

  float []starsX; //Horzontal position of star.
  float []starsY; //Vertical position of star.
  float starColor =  50; //Star colour.
  int starNum = 50; //Number of stars.
  int starSize = 1; //Size of stars.

  Stars (int sN, int sS) {
    starNum = sN;
    starSize = sS;
  }



// ----- Builders -----
  
  //Set position of all stars.
  void drawStars() { 
    starsX = new float[starNum];
    for (int i = 0; i < starsX.length; i++) { //Set horizontal coordinates across the width of the window.
      starsX[i] = random(width);
    }
    starsY = new float[starNum];
    for (int i = 0; i < starsY.length; i++) { //Set vertical coordinates across the height of the window.
      starsY[i] = random(height);
    }
  }

  //Draw stars and make them blink.
  void colourStars() {
    strokeWeight (starSize); //Apply star size to strokeWeight.  
    for (int i = 0; i < starNum; i++) { //Run for the number of stars.
      starColor = random(50, 255); //Randomize starColor in grayscale values.
      stroke (starColor); //Set starColor to stroke.
      point (starsX[i], starsY[i],-1); //Draw stars.
    }
  }
  
}
