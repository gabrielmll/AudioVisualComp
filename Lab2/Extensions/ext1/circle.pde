//Function to draw the green circle.

void circle () {
  
  fill(0,255,0); //Set the fill colour to green.
  ellipseMode(CORNER); //Puts the ellipse mode to CORNER, so the first two parameters become the origin coordinates of the square that the ellipse is written within.
  ellipse(110, 0, 100, 100); //Draws the ellipse.
  
}
