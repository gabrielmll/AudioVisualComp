/*This program demonstrates the push and pop matrix functions that allows to move separate objects
by changing the coordinate system position and putting back after drawing the object. */

//----- Declaring global variables. -----

PVector posSquare; //Variable for the position of the red square.
PVector posTriangle; //Variable for the position of the blue triangle.
PVector posCircle; //Variable for the position of the green circle.
PVector velSquare; //Variable for adding to the position of the red square.
PVector velTriangle; //Variable for adding to the position of the blue triangle.
PVector velCircle; //Variable for adding to the position and of green the circle.


//----- PROGRAM -----

void setup () {

  posSquare = new PVector(-1, -1); //Initializing square position vector.
  posTriangle = new PVector(-1, -1); //Initializing triangle position vector.
  posCircle = new PVector(-1, -1); //Initializing circle position vector.
  velSquare = new PVector(1, 2); //Initializing square velocity vector.
  velTriangle = new PVector(2, 2); //Initializing triangle velocity vector.
  velCircle = new PVector(2, 1); //Initializing circle velocity vector.

  size(700, 700); //Setting the window size.
}

void draw () {
  
  stroke(0); // Applies black stroke.

  //RED SQUARE
  pushMatrix(); //Saves the current coordinate system in the stack, allowing the following changes to be made and then revert the system back to original using popMatrix().
  posSquare.add(velSquare); //Adding square velocity vector to the square position vector to make each new square to be in a new position.
  translate(posSquare.x, posSquare.y); //Translating the square positions each time the program runs.
  square(); //Call the square function.
  popMatrix(); //Reverts the changes to the coordinate system back to the original state it was before pushMatrix().

  //BLUE TRIANGLE
  pushMatrix(); //Saves the current coordinate system in the stack, allowing the following changes to be made and then revert the system back to original using popMatrix().
  posTriangle.add(velTriangle); //Adding triangle velocity vector to the triangle position vector to make each new triangle to be in a new position.
  translate(posTriangle.x, posTriangle.y); //Translating the triangle positions each time the program runs.
  triang(); //Call the triang dunction.
  popMatrix(); //Reverts the changes to the coordinate system back to the original state it was before pushMatrix().

  //GREEN CIRCLE
  pushMatrix(); //Saves the current coordinate system in the stack, allowing the following changes to be made and then revert the system back to original using popMatrix().
  posCircle.add(velCircle); //Adding circle velocity vector to the circle position vector to make each new circle to be in a new position.
  translate(posCircle.x, posCircle.y); //Translating the circle positions each time the program runs.
  circle(); //Call the circle function.
  popMatrix(); //Reverts the changes to the coordinate system back to the original state it was before pushMatrix().

  // The next four lines will draw a black and a white squares on top-right corner,
  // and bottom-left corner to prove that after popping the matrix back, the coordinate system gets back to the original place. 
  noStroke();
  fill(0);
  rect(600, 0, 100, 100);
  fill(255);
  rect(0, 600, 100, 100);
}
